using DesafioOrigin.Models;
using Microsoft.EntityFrameworkCore;

namespace DesafioOrigin.Repositories
{
    public class CardRepository : ICardRepository
    {
        private readonly ApplicationDbContext _context;

        public CardRepository(ApplicationDbContext  context)
        {
            _context = context;
        }

        public async Task AddAsync(Card card)
        {
            await _context.Set<Card>().AddAsync(card);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(Card card)
        {
            _context.Set<Card>().Remove(card);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<Card>> GetAllAsync()
        {
            return await _context.Set<Card>().ToListAsync();
        }

        public async Task<Card> GetByIdAsync(int id)
        {
            return await _context.Set<Card>().FindAsync(id);
        }

        public async Task<Card> GetByNumberAsync(string number)
        {
            return await _context.Set<Card>()
                .Include(x => x.User)
                .Include(x => x.Operations)
                .ThenInclude(x => x.OperationType)
                .FirstOrDefaultAsync(x => x.Number == number);
        }

        public async Task UpdateAsync(Card card)
        {
            _context.Set<Card>().Update(card);
           await _context.SaveChangesAsync();
        }
    }
}
