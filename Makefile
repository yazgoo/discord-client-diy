murmur-bridge: murmur-bridge-stop murmur-bridge-start
	echo murmur-bridge
murmur-bridge-start: murmur-start start-murmur-bridge.sh
	./start-murmur-bridge.sh
murmur-bridge-stop: murmur-stop murmur-bridge-stop
murmur-start: murmur-static_x86-1.3.3
	murmur-static_x86-1.3.3/murmur.x86
murmur-static_x86-1.3.3: murmur-static_x86-1.3.3.tar.bz2
	tar xjf murmur-static_x86-1.3.3.tar.bz2
murmur-static_x86-1.3.3.tar.bz2:
	wget https://github.com/mumble-voip/mumble/releases/download/1.3.3/murmur-static_x86-1.3.3.tar.bz2
murmur-stop:
	- pkill -f murmur.x86
murmur-bridge-stop:
	- docker kill murmur-bridge
	- docker rm murmur-bridge
list-voice:
	ruby list-voice.rb
