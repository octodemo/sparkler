#!/bin/bash

standalone=$1

pip install databricks-cli

if [ "$standalone" = "true" ]; then
  ~/.local/bin/databricks fs cp --recursive --overwrite build/ dbfs:/FileStore/sparkler-standalone/
else
  rm -rf build/sparkler-app-0.3.1-SNAPSHOT

  ~/.local/bin/databricks fs cp --recursive --overwrite build/ dbfs:/FileStore/sparkler-submit/
fi
