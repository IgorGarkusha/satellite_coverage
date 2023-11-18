#!/bin/bash

mvn -DskipTests package assembly:single

rm -Rf ./bin
mkdir ./bin
cp -f ./target/satellite_coverage*-jar-with-dependencies.jar ./bin/

JAR_NAME=`ls -1 ./bin/satellite_coverage-*-jar-with-dependencies.jar`

cat <<EOF > ./bin/satellite_coverage
#!/bin/bash

java -jar ${JAR_NAME}

EOF

chmod +x ./bin/satellite_coverage

echo ""
echo "Run satellite_coverage: java -jar ./bin/satellite_coverage.jar"
echo "                   or : ./bin/satellite_coverage"
echo ""

