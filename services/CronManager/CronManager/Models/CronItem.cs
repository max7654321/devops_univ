namespace CronManager.Models;

public class CronItem
{
    public long Size { get; set; }
    public DateTime? UpdatedAt { get; set; }

    public void Update(long size)
    {
        UpdatedAt = DateTime.UtcNow;
        Size = size;
    }
}