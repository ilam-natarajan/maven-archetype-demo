help:
	@echo make create-archetype
	@echo make install-archetype
	@echo make generate-project-from-archetype
create-archetype:
	mvn archetype:create-from-project -s settings.xml
install-archetype:
	cd target/generated-sources/archetype; \
	mvn install -f pom.xml; \
	cd ../../..
generate-project-from-archetype:
	rm -rf test
	rm -rf my-app
	mkdir test
	cp settings.xml test/.
	cd test ; \
	pwd; \
	mvn -B archetype:generate \
	 -DarchetypeGroupId=com.archetypetraining \
	  -DarchetypeArtifactId=demo-archetype \
	  -DarchetypeCalalog=local \
	  -DgroupId=com.mycompany.app \
	  -DartifactId=my-app \
	  -s settings.xml; \
	cd my-app; \
	pwd; \
	find src -type f \
	cat src/main/java/com/mycompany/app/DemoApplication.java; \ 
	mvn clean test -s settings.xml;
