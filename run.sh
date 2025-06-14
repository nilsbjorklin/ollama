#!/bin/bash

if [ -z "${OLLAMA_MODEL}" ]; then
  echo "OLLAMA_MODEL environment variable is not set."
  exit 1
else
  OLLAMA_MODEL="${OLLAMA_MODEL}"
  echo "Using OLLAMA_MODEL: ${OLLAMA_MODEL}"
fi

echo "Starting Ollama server..."
ollama serve &


until curl -s http://localhost:11434 > /dev/null; do
  echo "Waiting for Ollama to be ready..."
  sleep 1
done

echo "Ollama is running"

ollama run $OLLAMA_MODEL