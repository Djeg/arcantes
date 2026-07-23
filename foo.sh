curl https://isdm-chat.crocc.meso.umontpellier.fr/openai/chat/completions \
 -X POST \
 -H 'Authorization: Bearer sk-1744fcc06e614c2b9c4646af8a7a32fb' \
 -H 'Content-Type: application/json' \
 -d '{
  "messages": [
    {
      "content": "Test ?"
    }
  ],
  "model": "devstral-2507"
}'
