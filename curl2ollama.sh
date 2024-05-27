#!/bin/bash
# Expected: 
#      - environment variable: OLLAMAHOST
#	     - jq and curl installed
# run: ./curl2ollama.sh "What you want to ask"


QUERY=$1
MSG=$(curl http://${OLLAMAHOST}:11434/api/chat -d '{
  "model": "llama3",
  "stream": false,
  "messages": [
    { "role": "user", "content": "'"${QUERY}"'" }
  ]
}' 2>/dev/null)
MSG2=$(echo $MSG | jq .message | jq .content|cat ); 
echo "${MSG2@E}"
