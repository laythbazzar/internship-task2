crontab -l > cron.tmp

echo "0 * * * * sh task2/cpu.sh" >> cron.tmp
echo "0 * * * * sh task2/disk.sh" >> cron.tmp
echo "0 * * * * sh task2/memory.sh" >> cron.tmp

crontab cron.tmp
rm cron.tmp
