using DesafioOrigin.DTOs;
using DesafioOrigin.Models;
using DesafioOrigin.Repositories;

namespace DesafioOrigin.Services
{
    public class AtmService
    {
        private const int MaxNumberOfAttempts = 4;
        private readonly ICardRepository _cardRepository;
        private readonly IOperationRepository _operationRepository;

        public AtmService(ICardRepository cardRepository, IOperationRepository operationRepository)
        {
            _cardRepository = cardRepository;
            _operationRepository = operationRepository;
        }

        public async Task<Card> GetCardAsync(string cardNumber)
        {
            var card = await _cardRepository.GetByNumberAsync(cardNumber);
           
            return card;
        }

        public async Task<Card> ValidatePinAsync(Card card)
        {                                    
            if (++card.Attempts == MaxNumberOfAttempts)
                card.IsLocked = true;

            await _cardRepository.UpdateAsync(card);

            return card;
        }

        public async Task<BalanceDto> GetBalanceAsync(CardInputDto cardNumber)
        {
            var card = await _cardRepository.GetByNumberAsync(cardNumber.CardNumber);
            
            await _operationRepository.AddAsync(GenerateOperation(card, 1));

            return GenerateBalance(card);           
        }

        public async Task<ExtractionDto> ExtractionAsync(ExtractionInputDto extractionInput)
        {
            var card = await _cardRepository.GetByNumberAsync(extractionInput.CardNumber);

            if (card.Balance < extractionInput.Amount)
                return null;

            card.Balance -= extractionInput.Amount;

            await _cardRepository.UpdateAsync(card);            
            await _operationRepository.AddAsync(GenerateOperation(card, 2));
            
            return GenerateExtration(card, extractionInput);
        }

        private BalanceDto GenerateBalance(Card card)
        {
            var balance = new BalanceDto
            {
                CardNumber = card.Number,
                Date = DateTime.Now,
                Balance = card.Balance
            };

            return balance;
        }

        private ExtractionDto GenerateExtration(Card card, ExtractionInputDto extractionInputDto)
        {
            var extraction = new ExtractionDto
            {
                CardNumber = card.Number,
                Date = DateTime.Now,
                withdrawal = extractionInputDto.Amount,
                Balance = card.Balance
            };

            return extraction;
        }

        private Operation GenerateOperation(Card card, int operationType)
        {
            var operation = new Operation
            {
                CardId = card.Id,
                OperationTypeId = operationType,
                CreatedAt = DateTime.Now,
                Amount = card.Balance
            };
            
            return operation;
        }
    }
}
