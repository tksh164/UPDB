using System;
using UpdateProgramDB.Models;

namespace TargetPreparer
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var db = new UpdateProgramDbContext())
            {
                db.Database.Log = s => System.Diagnostics.Debug.WriteLine(s);

                var processTarget = new ProcessTarget
                {
                    FilePath = "FilePath",
                    AdditionalData = "AdditionalData",
                    InsertedTimestampUtc = DateTime.UtcNow,
                };

                db.ProcessTargets.Add(processTarget);
                db.SaveChanges();
            }
         }
    }
}
