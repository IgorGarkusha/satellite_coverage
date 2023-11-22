#!/bin/bash

rm -Rf ./bin ./target
mkdir ./bin

mvn -DskipTests package assembly:single

cp -f ./target/satellite_coverage*-jar-with-dependencies.jar ./bin/

JAR_NAME=`ls -1 ./bin/satellite_coverage-*-jar-with-dependencies.jar | xargs -n 1 basename`

cat << EOF > ./bin/satellite_coverage
#!/bin/bash

DIRNAME=\`dirname \${BASH_SOURCE[0]}\`
java -jar \${DIRNAME}/${JAR_NAME}

EOF

chmod +x ./bin/satellite_coverage

echo ""
echo "Run satellite_coverage: java -jar ./bin/satellite_coverage.jar"
echo "                   or : ./bin/satellite_coverage"
echo ""

