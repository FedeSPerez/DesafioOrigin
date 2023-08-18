using DesafioOrigin.Models;
using Microsoft.EntityFrameworkCore;

namespace DesafioOrigin.Repositories
{
    public class OperationRepository : IOperationRepository
    {
        private readonly ApplicationDbContext _context;

        public OperationRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task AddAsync(Operation operation)
        {
            await _context.Set<Operation>().AddAsync(operation);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(Operation operation)
        {
            _context.Set<Operation>().Remove(operation);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<Operation>> GetAllAsync()
        {
            return await _context.Set<Operation>().ToListAsync();
        }

        public async Task<Operation> GetByIdAsync(int id)
        {
            return await _context.Set<Operation>().FindAsync(id);
        }
        
        public async Task UpdateAsync(Operation operation)
        {
            _context.Set<Operation>().Update(operation);
            await _context.SaveChangesAsync();
        }
    }
}
