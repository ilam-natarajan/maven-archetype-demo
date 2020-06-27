# maven-archetype-demo
Generate maven archetype from a project and publish the archetype


Four things happen when you push to this repo:
1. creates an archetype from this repo `mvn clean archetype:create-from-project`
2. installs the archetype to local m2. `mvn install -f pom.xml` from  target/generated-sources/archetype
3. generate a new maven project from the archetype we just created & installed 
```
  mvn -B archetype:generate \
	 -DarchetypeGroupId=com.archetypetraining \
	  -DarchetypeArtifactId=demo-archetype \
	  -DarchetypeCalalog=local \
	  -DgroupId=com.mycompany.appy \
	  -DartifactId=application \
	  -s settings.xml; \
 ```
    
4. test the newly created repo `mvn clean test -s settings.xml`

If the github action is green, it means all four steps have finished successfully.

all the steps are automated in makefile
