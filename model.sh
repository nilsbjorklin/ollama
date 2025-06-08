#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <model>"
    exit 1
fi
echo "Trying to add model: $1"; 
{
  docker exec -it ollama ollama show "$1" > /dev/null 2>&1 && 
  echo "Model $1 already exists."
  } || {
  docker exec -it ollama ollama pull "$1" || {
    echo "Failed to pull model: $1"
    exit 1
  }
  echo "Model $1 is now available."
  docker exec -it ollama ollama show "$1"
}