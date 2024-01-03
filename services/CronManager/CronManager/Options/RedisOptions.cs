namespace CronManager.Options;

public static class RedisOptions
{
    private const string Host = "127.0.0.1";
    private const int Port = 6379;
    public const string Key = "CRON_JOB";
    public const string LogPath = "/Users/mac/Desktop/devops/utils/logs.log";

    public static string ConnectionString => $"{Host}:{Port}";
}