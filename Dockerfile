FROM ghcr.io/linuxserver/minetest

RUN set -e; \
	apk add --no-cache build-base lua-dev luarocks; \
	luarocks-5.1 install luasocket; \
	apk del --purge build-base;

RUN set -e; \
	apk add --no-cache git; \
	cd /defaults/games/minetest/mods; \
	git clone --recursive https://github.com/minetest-mods/irc.git; \
	git clone https://github.com/ShadowNinja/minetest-irc_commands.git irc_commands; \
	git clone https://github.com/minetest-mods/signs_api.git; \
	git clone https://github.com/timcu/irc_builder.git; \
	cd /; \
	apk del --purge git; \
