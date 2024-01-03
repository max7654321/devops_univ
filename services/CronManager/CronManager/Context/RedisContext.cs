using System.Text.Json;
using CronManager.Models;
using CronManager.Options;
using StackExchange.Redis;

namespace CronManager.Context;

public class RedisContext : IDisposable
{
    private readonly ConnectionMultiplexer Redis;
    private readonly IDatabase _db;

    public RedisContext()
    {
        Redis = ConnectionMultiplexer.Connect(RedisOptions.ConnectionString);
        _db = Redis.GetDatabase();
    }

    public CronItem Get()
    {
        var dbItem = JsonSerializer.Deserialize<CronItem>(_db.StringGet(RedisOptions.Key).ToString())
                     ?? throw new Exception("Deserialize ex");

        return dbItem;
    }

    public void Set(CronItem newItem)
    {
        _db.StringSet(RedisOptions.Key, JsonSerializer.Serialize(newItem));
    }

    public void Dispose()
    {
        Redis.Close();
    }
}