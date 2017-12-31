using System;
using System.Reflection;
using UpdateProgramDB.Models;

namespace UpdateProgramDB.Logging
{
    public enum LogClassification : short
    {
        Information = 0,
        Warning = 1,
        Error = 2,
        Debug = 3,
    }

    public static class Logger
    {
        public static void WriteLog(string message)
        {
            WriteLog(LogClassification.Information, message, null);
        }

        public static void WriteLog(LogClassification logClassification, string message)
        {
            WriteLog(logClassification, message, null);
        }

        public static void WriteLog(LogClassification logClassification, string message, string data)
        {
            using (var db = new UpdateProgramDbContext())
            {
                db.Logs.Add(new Log()
                {
                    TimestampUtc = DateTime.UtcNow,
                    Source = Assembly.GetEntryAssembly().GetName().Name,
                    ClassificationId = (short)logClassification,
                    Message = message,
                    Data = data,
                });

                db.SaveChanges();
            }
        }
    }
}
