using Azure;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DesafioOrigin.Models
{
    public class Card
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required]
        public int UserId { get; set; }
        [Required]
        [StringLength(16)]
        public string Number { get; set; } = null!;
        [Required]
        public string Pin { get; set; } = null!;
        [Required]
        public string Salt { get; set; }
        [Required]
        public bool IsLocked { get; set; }
        [Required]
        public int Attempts { get; set; }
        [Required]
        [Precision(18, 2)]
        public decimal Balance { get; set; }
        [Required]
        public DateTime Date { get; set; }

        [ForeignKey("UserId")]
        public User User { get; set; } = null!;
        public List<Operation> Operations { get; set; }
    }
}
