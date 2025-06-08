#!/bin/bash
if [ $# -lt 1 ]; then
    echo "Usage: $0 <ollama_command>"
    exit 1
fi
echo $ ollama $@
docker exec -it ollama ollama "$@"
if [ $? -ne 0 ]; then
    echo "Error: Command failed"
    exit 1
fi