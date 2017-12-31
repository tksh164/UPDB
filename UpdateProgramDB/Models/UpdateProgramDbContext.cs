using System.Data.Entity;

namespace UpdateProgramDB.Models
{
    public class UpdateProgramDbContext : DbContext
    {
        public UpdateProgramDbContext()
            : base("name=UpdateProgramDbContext")
        {
        }

        public virtual DbSet<Log> Logs { get; set; }

        public virtual DbSet<ProcessTarget> ProcessTargets { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Log>()
                .Property(e => e.TimestampUtc)
                .HasPrecision(0);

            modelBuilder.Entity<ProcessTarget>()
                .Property(e => e.InsertedTimestampUtc)
                .HasPrecision(0);

            modelBuilder.Entity<ProcessTarget>()
                .Property(e => e.ProcessStartedTimestampUtc)
                .HasPrecision(0);

            modelBuilder.Entity<ProcessTarget>()
                .Property(e => e.ProcessCompletedTimestampUtc)
                .HasPrecision(0);
        }
    }
}
