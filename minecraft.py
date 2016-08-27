#!/usr/bin/python
#By Lance Zeligman
#Uses mcstatus python lib to determine status of a minecraft server
from mcstatus import MinecraftServer
server = MinecraftServer.lookup("warbase.xyz:25565")
latency = server.ping()
print("It's up and running, response time is {0} ms".format(latency))
