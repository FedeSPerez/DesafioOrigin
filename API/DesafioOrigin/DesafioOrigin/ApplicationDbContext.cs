using DesafioOrigin.Models;
using Microsoft.EntityFrameworkCore;

namespace DesafioOrigin
{
    public class ApplicationDbContext: DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {       
        }

        public DbSet<Card> Cards { get; set; } = null!;
        public DbSet<OperationType> OperationTypes { get; set; } = null!;
        public DbSet<Operation> Operations { get; set; } = null!;
        public DbSet<User> Users { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Card>().HasKey(a => a.Id);
            modelBuilder.Entity<OperationType>().HasKey(a => a.Id);
            modelBuilder.Entity<Operation>().HasKey(a => a.Id);
            modelBuilder.Entity<User>().HasKey(a => a.Id);
        }
    }
}
