using DesafioOrigin.Models;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DesafioOrigin.DTOs
{
    public class OperationDto
    {
        [Required]
        public int Id { get; set; }
        [Required]        
        public DateTime CreatedAt { get; set; }
        [Precision(18, 2)]
        public decimal? Amount { get; set; }        
        public string OperationType { get; set; }
    }
}
