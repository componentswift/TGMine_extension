#!/bin/bash

VersionString=`grep -E 's.version.*=' TGMine_extension.podspec`
VersionNumber=`tr -cd 0-9 <<<"$VersionString"`

NewVersionNumber=$(($VersionNumber + 1))
LineNumber=`grep -nE 's.version.*=' TGMine_extension.podspec | cut -d : -f1`
sed -i "" "${LineNumber}s/${VersionNumber}/${NewVersionNumber}/g" TGMine_extension.podspec

echo "current version is ${VersionNumber}, new version is ${NewVersionNumber}"

git add .
git commit -am ${NewVersionNumber}
git tag ${NewVersionNumber}
git push origin master --tags
pod repo push tg_cm_swift TGMine_extension.podspec --verbose --allow-warnings --use-libraries --use-modular-headers

