#!/usr/bin/bash


if [ -f 'gradlew' ]
then
	echo 'checked gradle file'
else
	echo 'Error: Such Script Can Only Run On The Root Of Android Application'
	exit 127
fi

if [ -x 'gradlew' ]
then
	echo 'gradle wapper exits'
else
	chmod u+x './gradlew'
fi

PACKAGE_NAME=$(./gradlew packageName | grep -oE 'packageName: _[a-zA-Z_.]+_' | grep -oE '_[a-zA-Z_.]+_' | grep -oE '[a-zA-Z.]+')
  
if [ -z "${PACKAGE_NAME}" ]
then
	echo 'please you have to add printPN task in your gradle'
else
	echo "package name detected as $PACKAGE_NAME"
fi

java -jar app/build/libs/app-all.jar $@ packageName=$PACKAGE_NAME

