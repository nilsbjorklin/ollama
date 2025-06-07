#!/bin/bash

echo "Starting Ollama server..."
ollama serve &


until curl -s http://localhost:11434 > /dev/null; do
  echo "Waiting for Ollama to be ready..."
  sleep 1
done

echo "Ollama is ready, creating model gemma3..."

ollama run gemma3

echo "Ollama is running"
