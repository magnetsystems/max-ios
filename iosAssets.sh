server=$1

echo Generating Assets...
curl -o ios.zip $server'/api/com.magnet.server/mainassets/download?platform=iOS&prefix=AT'
sleep 5
unzip -d assets ios.zip

echo Replacing Assets...
rm Tests/Tests/Services/*
rm Tests/Tests/Models/*
rm Tests/Tests/CommonTypes/*
cp assets/Source/Services/* Tests/Tests/Services/.
cp assets/Source/Models/* Tests/Tests/Models/.
cp assets/Source/CommonTypes/* Tests/Tests/CommonTypes/.
