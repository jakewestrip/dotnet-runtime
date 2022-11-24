#!/bin/bash

cd artifacts/packages/Release/Shipping
rm -rf zip
mkdir zip
cd zip
cp ../*dev.nupkg .

for file in *.nupkg
do
  mv "$file" "${file%.nupkg}.zip"
  unzip -o "${file%.nupkg}.zip"
done

cd runtimes/linux-x64
mkdir -p /home/int16/serenity/Build/x86_64/Root/usr/dotnet/lib
cp -r lib/* -t /home/int16/serenity/Build/x86_64/Root/usr/dotnet/lib
cp -r native/* -t /home/int16/serenity/Build/x86_64/Root/usr/dotnet/lib

cd ../../../../../../obj/mono/SerenityOS.x64.Release/out/lib
cp -r * -t /home/int16/serenity/Build/x86_64/Root/usr/dotnet/lib

cd ..
mkdir -p /home/int16/serenity/Build/x86_64/Root/usr/dotnet/bin
cp bin/mono-sgen /home/int16/serenity/Build/x86_64/Root/usr/dotnet/bin/mono
cp -r include -t /home/int16/serenity/Build/x86_64/Root/usr/dotnet

cp /home/int16/serenity/Build/x86_64/Root/usr/dotnet/lib/*.so /home/int16/serenity/Build/x86_64/Root/usr/dotnet/lib/net7.0/
