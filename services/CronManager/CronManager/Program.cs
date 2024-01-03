using CronManager.Context;
using CronManager.Options;

namespace CronManager;

class Program
{
    private static void Main()
    {
        var db = new RedisContext();

        using var writer = File.AppendText(RedisOptions.LogPath);
        try
        {
            var file = new FileInfo(RedisOptions.LogPath);

            var dbItem = db.Get();
            writer.WriteLine($"**************** Hello 🧑‍🚀❤️🔥 Today: {DateTime.Now}");
            if (dbItem.Size < file.Length)
            {
                writer.WriteLine($"**************** File was changed from {dbItem.Size} => {file.Length}");
                Console.WriteLine($"File was changed from {dbItem.Size} => {file.Length}");
                dbItem.Update(file.Length);
                db.Set(dbItem);
            }
            else
            {
                Console.WriteLine("File not changed!");
            }

        }
        catch (Exception ex)
        {
            Console.WriteLine($"Something happened in CronManager {ex}");
        }
        finally
        {
            writer.WriteLine("**************** Thanks GOODBYE Bro❤️");
            db.Dispose();
        }
    }
}