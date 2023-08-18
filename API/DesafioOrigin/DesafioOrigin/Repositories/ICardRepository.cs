using DesafioOrigin.Models;

namespace DesafioOrigin.Repositories
{
    public interface ICardRepository : IBaseRepository<Card>
    {
        Task<Card> GetByNumberAsync(string number);
    }
}

