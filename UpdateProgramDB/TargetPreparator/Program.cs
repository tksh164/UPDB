using System;
using System.Text;
using UpdateProgramDB.Models;

namespace UpdateProgramDB.TargetPreparator
{
    class Program
    {
        static void Main(string[] args)
        {
            // Set unhandled exception trapper.
            AppDomain.CurrentDomain.UnhandledException += new UnhandledExceptionEventHandler(UnhandledExceptionTrapper);

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

        private static void UnhandledExceptionTrapper(object sender, UnhandledExceptionEventArgs e)
        {
            var ex = (Exception)e.ExceptionObject;
            var exceptionStackText = BuildExceptionStackText(ex);
            Console.WriteLine(exceptionStackText);
        }

        private static string BuildExceptionStackText(Exception exception)
        {
            var builder = new StringBuilder();

            var ex = exception;
            while (true)
            {
                builder.AppendFormat(@"{0}: {1}", ex.GetType().FullName, ex.Message);
                builder.AppendLine();
                builder.AppendLine(ex.StackTrace);

                if (ex.InnerException == null) break;

                ex = ex.InnerException;
                builder.AppendLine(@"--- Inner exception is below ---");
            }

            return builder.ToString();
        }
    }
}
