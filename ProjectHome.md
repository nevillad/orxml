ORXml (Object Relationship Xml) is a framework for Mac OS X and iPhone OS.

Apple provides the NSCoding API for object serialization, but this works only with the specific plist xml files. If any custom xml schema has to be used, the object serialization / deserialization has to be done manually with the available xml parsing API's like NSXMLDocument, NSXMLParser or the c based libxml and this is hard work.

ORXml is very easy to use. If an object structure according to a xml schema exists, ORXml can serialize / deserialize the objects without any configuration.

An object serialization would be three simple lines of code:
```
ORXmlSerializer *serializer = [[[ORXmlSerializer alloc] init] autorelease];

Test *test = [[[Test alloc] init]autorelease];
NSData *data = [serializer serializeTarget:test]; 
```

And the object deserialization is very similar:
```
ORXmlSerializer *serializer = [[[ORXmlSerializer alloc] init] autorelease];

NSData *data = [NSData dataWithContentsOfFile:@"~/Documents/somefile.xml"];
Test *test = [serializer deserializeWithData:data];
```

The project has started, [here](http://code.google.com/p/orxml/wiki/ProjectStatus) you can see the progress.