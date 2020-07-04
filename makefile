help:
	@echo make all
	@echo make create-archetype
	@echo make install-archetype
	@echo make generate-project-from-archetype
all: create-archetype install-archetype generate-project-from-archetype

create-archetype:
	./mvnw -v
	rm -rf test
	MAVEN_OPTS=-Dorg.slf4j.simpleLogger.defaultLogLevel=warn ./mvnw -q clean archetype:create-from-project -s settings.xml
	ls -R target/generated-sources/archetype/src/main/resources/archetype-resources/src/main/java
install-archetype:
	cd target/generated-sources/archetype; \
	mvn -B -q install -f pom.xml; \
	cd ../../..
generate-project-from-archetype:
	rm -rf test
	rm -rf application
	mkdir test
	cp settings.xml test/settings.xml
	cd test ; \
	pwd; \
	mvn -B -q archetype:generate \
	 -DarchetypeGroupId=com.archetypetraining \
	  -DarchetypeArtifactId=demo-archetype \
	  -DarchetypeCalalog=local \
	  -DgroupId=com.mycompany.appy \
	  -DartifactId=application \
	  -s settings.xml; \
	cd application; \
	ls -R src/main/java/com/mycompany/appy; \
	ls src/main/java/com/mycompany/appy/app; \
	cat src/main/java/com/mycompany/appy/app/HelloController.java; \
	mvn -B -q clean test -s settings.xml;
