#!/bin/bash
# 启动 yunxi-agent-platform：从同目录 .evn 逐行加载环境变量后运行
cd "$(dirname "$0")" || exit 1
export JAVA_HOME=/Users/yangwenchang/Documents/trae_projects/demo/tools/jdk-21.0.12.1+1/Contents/Home
export PATH="$JAVA_HOME/bin:/Users/yangwenchang/Documents/trae_projects/demo/tools/apache-maven-3.9.9/bin:$PATH"
while IFS='=' read -r k v; do
  case "$k" in ''|\#*) continue ;; esac
  export "$k=$v"
done < .evn
exec mvn spring-boot:run -pl agent-app -DskipTests \
  -s /Users/yangwenchang/Documents/trae_projects/demo/tools/settings.xml \
  -Dspring-boot.run.jvmArguments="-Xmx2g -Duser.home=/Users/yangwenchang/Documents/trae_projects/demo/yunxi-agent-platform"
