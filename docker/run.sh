LOCUST="locust"
LOCUST_OPTS="-f /locust-tasks/test-case.py --host=$TARGET_HOST"
LOCUST_MODE=${LOCUST_MODE:-standalone}

if [[ "$LOCUST_MODE" = "master" ]]; then
    LOCUST_OPTS="$LOCUST_OPTS --master --master-port=5557"

elif [[ "$LOCUST_MODE" = "worker" ]]; then
    LOCUST_OPTS="$LOCUST_OPTS --worker --master-port=5557 --master-host=$LOCUST_MASTER_URL"
fi

echo "$LOCUST $LOCUST_OPTS"

$LOCUST $LOCUST_OPTS
