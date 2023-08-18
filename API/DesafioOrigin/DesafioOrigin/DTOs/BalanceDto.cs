namespace DesafioOrigin.DTOs
{
    public class BalanceDto
    {
        public string CardNumber { get; set; } = null!;
        public DateTime Date { get; set; }
        public decimal Balance { get; set; }
    }
}
