#!/bin/bash
set -e

# Start Munge
/usr/sbin/munged -f -c -D &

# Start Slurm daemons based on ROLE
if [ "$ROLE" = "controller" ]; then
    /usr/sbin/slurmctld -Dvvv &
else
    /usr/sbin/slurmd -Dvvv &
fi

# Keep container alive
tail -f /dev/null