using System;
using System.Text;
using UpdateProgramDB.Models;
using UpdateProgramDB.Logging;

namespace UpdateProgramDB.TargetPreparator
{
    class Program
    {
        static void Main(string[] args)
        {
            Logger.WriteLog("Start");

            // Set unhandled exception trapper.
            AppDomain.CurrentDomain.UnhandledException += new UnhandledExceptionEventHandler(ExceptionHelper.UnhandledExceptionTrapper);

            // Retrieve the additional data from the command-line parameter.
            var additionalData = string.Empty;
            if (args.Length != 0)
            {
                additionalData = args[0];
            }

            // Add process targets from stdin.
            AddProcessTargetsFromStdin(additionalData);

            Logger.WriteLog("End");
        }

        private static void AddProcessTargetsFromStdin(string additionalData)
        {
            while (true)
            {
                // Retrieve the file path from console.
                var filePath = Console.ReadLine();

                // Exit loop when blank line entered.
                if (string.IsNullOrWhiteSpace(filePath)) break;

                try
                {
                    // Add a process target.
                    var normalizedFilePath = NormalizeFilePath(filePath);
                    var normalizedAdditionalData = NormalizeAdditionalData(additionalData);
                    AddProcessTarget(normalizedFilePath, normalizedAdditionalData);

                    Logger.WriteLog(LogClassification.Information, "Added a process target.", string.Format(@"FilePath:""{0}"", AdditinalData:""{1}""", normalizedFilePath, normalizedAdditionalData));
                }
                catch (Exception ex)
                {
                    StringBuilder builder = new StringBuilder();
                    builder.AppendLine(string.Format(@"Exception on ""{0}""", filePath));
                    builder.AppendLine();
                    builder.AppendLine(ExceptionHelper.BuildExceptionStackTraceText(ex));
                    Logger.WriteLog(LogClassification.Error, "An exception was thrown on adding a process target.", builder.ToString());
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
    }
}
