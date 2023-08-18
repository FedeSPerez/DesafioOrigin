using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DesafioOrigin.Models
{
    public class Operation
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required]
        public int CardId { get; set; }
        [Required]
        public int OperationTypeId { get; set; }
        [Required]
        public DateTime CreatedAt { get; set; }
        [Precision(18, 2)]
        public decimal? Amount { get; set; }

        [ForeignKey("CardId")]
        public Card Card { get; set; } = null!;
        public OperationType OperationType { get; set; } = null!;
    }
}
