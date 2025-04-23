#!/bin/bash
set -e

if [ -e "/opt/airflow/requirements.txt" ]; then
  python -m pip install --upgrade pip
  pip install --no-cache-dir -r /opt/airflow/requirements.txt
fi

# Initialize DB and create user (optional: you can make it conditional)
airflow db init
airflow users create \
    --username admin \
    --firstname admin \
    --lastname admin \
    --role Admin \
    --email admin@example.com \
    --password admin

# Upgrade DB (in case it’s already initialized)
airflow db upgrade

# Launch the webserver
exec airflow webserver
