/*****************************************************************************
 * ORXml. An easy to use xml serializer.
 * Copyright (C) 2009  Michael Lehmann 
 ******************************************************************************
 * This file is part of ORXml.
 *
 * ORXml is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * ORXml is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with ORXml.  If not, see <http://www.gnu.org/licenses/>.
 *****************************************************************************/

#import "ORLibXmlReader.h"
#import "ORXmlException.h"
#import "ORLibXmlNode.h"
#import "ORStack.h"


@implementation ORLibXmlReader

- (id)init
{
	if(self = [super init]) {
		_pointerStack = [[ORStack alloc] init];
	}
	
	return self;
}

- (id)initWithData:(NSData *) data
{
	if(self = [self init])
	{
		_doc = [self parseDocumentWithData:data];
		ORLibXmlNode *root = [self rootNodeFromDocument:_doc];		
		[_pointerStack push:root];
	}
	
	return self;
}

- (void)dealloc
{
	[self close];
	[_pointerStack release];
	[super dealloc];
}

- (xmlDocPtr)parseDocumentWithData:(NSData *)data
{
	xmlDocPtr document = NULL;
	
	// parse xml file if some data is available
	if (data && data.length > 0)
	{
		document = xmlParseMemory([data bytes], [data length]);
	}
	
	// check errors
	if(document == NULL) {
		NSException *exception = [ORXmlException exceptionWithName:@"XmlDocumentNotValid" reason:@"The xml document is not valid." userInfo:nil];
		@throw exception;
	}
	
	return document;
}

- (ORLibXmlNode *)rootNodeFromDocument:(xmlDocPtr)document
{
	// get the root node
	xmlNodePtr root = xmlDocGetRootElement(_doc);
	if(root == NULL) {
		xmlFreeDoc(_doc);
		
		NSException *exception = [ORXmlException exceptionWithName:@"XmlDocumentNotValid" reason:@"The xml document is not valid." userInfo:nil];
		@throw exception;
	}
	
	return [[[ORLibXmlNode alloc] initWithDocument:_doc node:root] autorelease];
}

- (NSString *)name
{
	NSString *name;
	
	if([_pointerStack count]) {
		ORLibXmlNode *currentNode = [_pointerStack peek];
		name = [currentNode name];
	}
	
	return name;
}

- (NSString *)value
{
	NSString *value;
	
	if ([_pointerStack count]) {
		ORLibXmlNode *currentNode = [_pointerStack peek];
		value = [currentNode value];
	}
		
	return value;
}

- (int)attributeCount
{
	int count = 0;
	
	if ([_pointerStack count]) {
		ORLibXmlNode *currentNode = [_pointerStack peek];
		count = [currentNode attributeCount];
	}
	
	return count;
}

- (NSString *)attributeAtIndex:(int)index
{
	NSString *attribute;
	
	if ([_pointerStack count]) {
		ORLibXmlNode *currentNode = [_pointerStack peek];
		attribute = [currentNode attributeAtIndex:index];
	}
	
	return attribute;
}

- (NSString *)attributeForName:(NSString *)name;
{
	return nil;
}

- (NSArray *)attributeNames
{
	NSArray *names;
	
	if ([_pointerStack count]) {
		ORLibXmlNode *currentNode = [_pointerStack peek];
		names = [currentNode attributeNames];
	}
	
	return names;
}

- (BOOL)readNext
{
	BOOL sucessfully = NO;
	
	// get the current node
	ORLibXmlNode *currentNode = [_pointerStack peek];
	
	// get the next children of the current node
	ORLibXmlNode *nextNode = [currentNode nextChild];
	
	// push the next child onto the stack -> set as current node
	if(nextNode != nil) {
		[_pointerStack push:nextNode];
		
		sucessfully = YES;
	}
	
	return sucessfully;
}

- (BOOL)readParent
{
	BOOL sucessfully = NO;
	
	// remove the last node from the stack -> setthe parent node as current node
	if([_pointerStack count] > 0) {
		[_pointerStack peek];
		
		sucessfully = YES;
	}
	
	return sucessfully;
}

- (void)close
{
	[_pointerStack clear];
	xmlFreeDoc(_doc);
}

@end
