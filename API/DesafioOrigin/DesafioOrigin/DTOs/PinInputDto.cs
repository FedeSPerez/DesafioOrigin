using System.ComponentModel.DataAnnotations;

namespace DesafioOrigin.DTOs
{
    public class PinInputDto
    {
        [Required]
        [StringLength(16)]
        public string CardNumber { get; set; }
        [Required]
        [StringLength(4)]
        public string Pin { get; set; }
    }
}
