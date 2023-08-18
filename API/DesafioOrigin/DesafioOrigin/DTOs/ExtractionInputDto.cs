using System.ComponentModel.DataAnnotations;

namespace DesafioOrigin.DTOs
{
    public class ExtractionInputDto
    {
        [Required]
        [StringLength(16)]
        public string CardNumber { get; set; }
        [Required]
        public decimal Amount { get; set; }
    }
}
