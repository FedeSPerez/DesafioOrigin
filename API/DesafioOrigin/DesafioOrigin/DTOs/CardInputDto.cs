using System.ComponentModel.DataAnnotations;

namespace DesafioOrigin.DTOs
{
    public class CardInputDto
    {
        [Required]
        [StringLength(16)]
        public string CardNumber { get; set; }
    }
}
