using DesafioOrigin.Models;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace DesafioOrigin.DTOs
{
    public class CardDto
    {
        [Required]
        public int Id { get; set; }        
        [Required]
        [StringLength(16)]
        public string Number { get; set; } = null!;
        [Required]        
        [Precision(18, 2)]
        public decimal Balance { get; set; }
        [Required]
        public DateTime Date { get; set; }

        public User User { get; set; } = null!;
        public List<OperationDto> Operations { get; set; }
    }
}
