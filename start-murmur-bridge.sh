data=$(lpass show murmur-bridge)
docker run --network=host --name murmur-bridge \
-e MUMBLE_INSECURE=true \
-e MUMBLE_ADDRESS=0.0.0.0 \
-e DISCORD_TOKEN=$(echo "$data"|grep Password: | cut -d\  -f2) \
-e DISCORD_GID=$(echo "$data"|grep DISCORD_GID= | cut -d= -f2) \
-e DISCORD_CID=$(echo "$data"|grep DISCORD_CID= | cut -d= -f2) \
stieneee/mumble-discord-bridge
