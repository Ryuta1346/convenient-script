#!bin/bash

component=$1
if [ "$2" ]; then
  directory=$2
else
  directory="components"
fi
baseDir="./src/${directory}/${component}"
baseComp="${baseDir}/${component}"
sbDir="./src/stories/${component}"
sbComp="${sbDir}/${component}"

# component がない場合には dir から作成
CURRENT=$(cd $(dirname $0);pwd)
mkdir -p $baseDir
mkdir -p $sbDir
cp $CURRENT/component-template.tsx "${baseComp}.tsx"
cp $CURRENT/storybook-template.stories.tsx "${sbComp}.stories.tsx"

# 各ファイルにテンプレを書き込む
sed -i -e "s/Template/${component}/g" "${baseComp}.tsx"
sed -i -e "s/Template/${component}/g" "${sbComp}.stories.tsx"
