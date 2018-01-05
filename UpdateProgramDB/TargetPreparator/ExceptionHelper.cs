using System;
using System.Text;

namespace UpdateProgramDB.TargetPreparator
{
    internal static class ExceptionHelper
    {
        public static string BuildExceptionStackTraceText(Exception exception)
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

        public static void UnhandledExceptionTrapper(object sender, UnhandledExceptionEventArgs e)
        {
            var ex = (Exception)e.ExceptionObject;
            var exceptionStackText = BuildExceptionStackTraceText(ex);
            Console.Error.WriteLine(exceptionStackText);
        }
    }
}
