# discord-client-diy

breaking free from discord client using several open source projects.

1. voice: use mumble (bridged)
2. text: just use [weechat-discord](https://github.com/terminal-discord/weechat-discord) 

# configuration

to use voice, you need first to configure lastpass, and to have lpass.

You then need to add a password named 'murmur-bridge'

your discord token in password field
and descprition being:

```
DISCORD_GID=<your server id>
DISCORD_CID=<your voice channel id>
```

# running

`make murmur-bridge`

This will start murmur locally as well as mumble-discord-bridge

You will just have run mumble and connect to your local server.

# cleanup

`make murmur-bridge-stop`
