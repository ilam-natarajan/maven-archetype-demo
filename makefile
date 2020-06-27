help:
	@echo make all
	@echo make create-archetype
	@echo make install-archetype
	@echo make generate-project-from-archetype
all: create-archetype install-archetype generate-project-from-archetype

create-archetype:
	rm -rf test
	mvn clean archetype:create-from-project -s settings.xml
install-archetype:
	cd target/generated-sources/archetype; \
	mvn install -f pom.xml; \
	cd ../../..
generate-project-from-archetype:
	rm -rf test
	rm -rf application
	mkdir test
	cp settings.xml test/settings.xml
	cd test ; \
	pwd; \
	mvn -B archetype:generate \
	 -DarchetypeGroupId=com.archetypetraining \
	  -DarchetypeArtifactId=demo-archetype \
	  -DarchetypeCalalog=local \
	  -DgroupId=com.mycompany.appy \
	  -DartifactId=application \
	  -s settings.xml; \
	cd application; \
	mvn clean test -s settings.xml;
