using DesafioOrigin.DTOs;
using DesafioOrigin.Models;
using DesafioOrigin.Services;
using Microsoft.AspNetCore.Mvc;
using System.Security.Cryptography;

namespace DesafioOrigin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AtmController : ControllerBase
    {        
        private readonly AtmService _atmService;

        public AtmController(AtmService atmService)
        {            
            _atmService = atmService;
        }

        [HttpPost("validate-card")]
        public async Task<ActionResult<string>> ValidateCardNumber([FromBody] CardInputDto cardNumber)
        {            
            var card = await _atmService.GetCardAsync(cardNumber.CardNumber);

            return ValidateCard(card);
        }

        [HttpPost("validate-pin")]
        public async Task<ActionResult<string>> ValidatePin([FromBody] PinInputDto pin)
        {
            Card card = await _atmService.GetCardAsync(pin.CardNumber);

            var validatedCard = ValidateCard(card);

            if (!(validatedCard is OkObjectResult))
                return validatedCard;

            string enteredPin = pin.Pin;

            byte[] saltBytes = Convert.FromBase64String(card.Salt);
            byte[] enteredHash = GenerateHash(enteredPin, saltBytes);

            string enteredHashedPin = Convert.ToBase64String(enteredHash);

            if (enteredHashedPin == card.Pin) 
            {
                return Ok(MapCard(card));
            }
            else 
            {
                card = await _atmService.ValidatePinAsync(card);
            }

            if (!card.IsLocked)
            {
                return BadRequest("Pin incorrecto");
            }
            else 
            {
                return BadRequest("Tarjeta Bloqueada");
            }
            
        }

        [HttpPost("balance")]
        public async Task<ActionResult<BalanceDto>> GetBalance([FromBody] CardInputDto cardNumber)
        {
            var card = await _atmService.GetCardAsync(cardNumber.CardNumber);

            var validatedCard = ValidateCard(card);

            if (!(validatedCard is OkObjectResult))
                return validatedCard;

            var result = await _atmService.GetBalanceAsync(cardNumber);

            return Ok(result);
        }

        [HttpPost("extraction")]
        public async Task<ActionResult<ExtractionDto>> Extraction([FromBody] ExtractionInputDto extractionInput)
        {
            var card = await _atmService.GetCardAsync(extractionInput.CardNumber);

            var validatedCard = ValidateCard(card);

            if (!(validatedCard is OkObjectResult))
                return validatedCard;

            var result = await _atmService.ExtractionAsync(extractionInput);

            if (result == null)
                return BadRequest("Saldo insuficiente");

            return Ok(result);
        }

        private ActionResult ValidateCard(Card card) 
        {
            if (card is null)
                return NotFound("Tarjeta Inexistente");

            if (card.IsLocked)
                return BadRequest("Tarjeta Bloqueada");

            if (card.Date < DateTime.Now)
                return BadRequest("Tarjeta Vencida");

            return Ok("Tarjeta Valida");
        }

        CardDto MapCard(Card card)
        {
            var cardDto = new CardDto
            {
                Id = card.Id,
                Number = card.Number,
                Balance = card.Balance,
                Date = card.Date,
                User = card.User,
                Operations = new List<OperationDto>() 
            };

            foreach (Operation operation in card.Operations)
            {
                var operationDto = new OperationDto 
                {
                    Id = operation.Id,
                    CreatedAt = operation.CreatedAt,
                    Amount = operation.Amount,
                    OperationType = operation.OperationType.Description
                };

                cardDto.Operations.Add(operationDto);
            }

            return cardDto;
        }

        static byte[] GenerateHash(string pin, byte[] salt)
        {
            using (var pbkdf2 = new Rfc2898DeriveBytes(pin, salt, 10000, HashAlgorithmName.SHA256))
            {
                return pbkdf2.GetBytes(32);
            }
        }
    }
}
