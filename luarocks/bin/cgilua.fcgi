#!/bin/sh

LUAROCKS_SYSCONFDIR='/etc/luarocks' exec '/usr/bin/lua5.3' -e 'package.path="/home/geraldo/Dropbox/Código/Projects/atelievirtual/luarocks/share/lua/5.3/?.lua;/home/geraldo/Dropbox/Código/Projects/atelievirtual/luarocks/share/lua/5.3/?/init.lua;"..package.path;package.cpath="/home/geraldo/Dropbox/Código/Projects/atelievirtual/luarocks/lib/lua/5.3/?.so;"..package.cpath;local k,l,_=pcall(require,"luarocks.loader") _=k and l.add_context("cgilua","6.0.2-0")' '/home/geraldo/Dropbox/Código/Projects/atelievirtual/luarocks/lib/luarocks/rocks-5.3/cgilua/6.0.2-0/bin/cgilua.fcgi' "$@"
