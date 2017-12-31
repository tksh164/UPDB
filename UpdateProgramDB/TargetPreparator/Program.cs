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

            // Retrieve the additional data from the command-line parameter.
            var additionalData = string.Empty;
            if (args.Length != 0)
            {
                additionalData = args[0];
            }

            while (true)
            {
                // Retrieve the file path from console.
                var filePath = Console.ReadLine();

                // Exit loop when blank line entered.
                if (string.IsNullOrWhiteSpace(filePath)) break;

                try
                {
                    // Add a process target.
                    AddProcessTarget(NormalizeFilePath(filePath), NormalizeAdditionalData(additionalData));
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine(@"Exception: ", filePath);
                    var exceptionStackText = BuildExceptionStackText(ex);
                    Console.Error.WriteLine(exceptionStackText);
                }
            }
        }

        private static string NormalizeFilePath(string filePath)
        {
            return filePath.Trim(new Char[] { '"', ' ', '\t' });
        }

        private static string NormalizeAdditionalData(string additionalData)
        {
            return additionalData.Trim(new Char[] { '"', ' ', '\t' });
        }

        private static void AddProcessTarget(string filePath, string additionalData)
        {
            using (var db = new UpdateProgramDbContext())
            {
                // Debug log.
                db.Database.Log = s => System.Diagnostics.Debug.WriteLine(s);

                // Create and insert an entity.
                db.ProcessTargets.Add(new ProcessTarget
                {
                    FilePath = filePath,
                    AdditionalData = additionalData,
                    IsProcessStarted = false,
                    IsProcessCompleted = false,
                    InsertedTimestampUtc = DateTime.UtcNow,
                    ProcessStartedTimestampUtc = DateTime.MinValue,
                    ProcessCompletedTimestampUtc = DateTime.MinValue,
                });
                db.SaveChanges();
            }
        }

        private static void UnhandledExceptionTrapper(object sender, UnhandledExceptionEventArgs e)
        {
            var ex = (Exception)e.ExceptionObject;
            var exceptionStackText = BuildExceptionStackText(ex);
            Console.Error.WriteLine(exceptionStackText);
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
