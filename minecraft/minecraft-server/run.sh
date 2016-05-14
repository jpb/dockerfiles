#!/bin/ash

MINECRAFT_MEMORY_MIN=${MINECRAFT_MEMORY_MIN:-1023} 
MINECRAFT_MEMORY_MAX=${MINECRAFT_MEMORY_MAX:-2048}

echo "# Starting minecraft-server..."
echo "# Minecraft minimum memory: $MINECRAFT_MEMORY_MIN"
echo "# Minecraft maximum memory: $MINECRAFT_MEMORY_MAX"

/usr/bin/java \
  -Xms"$MINECRAFT_MEMORY_MIN"m \
  -Xmx"$MINECRAFT_MEMORY_MAX"m \
  -XX:+UseConcMarkSweepGC \
  -jar '/data/minecraft/server.jar'
  
