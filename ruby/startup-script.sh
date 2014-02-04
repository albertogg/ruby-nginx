# Start cron in the background.
cron -f &

# start ssh daemon in the background.
/usr/sbin/sshd -D
