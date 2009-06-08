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


@implementation ORLibXmlReader

- (id)initWithData:(NSData *) data
{
	if(self = [super init])
	{
		_doc = [self parseDocumentWithData:data];
			
			
//			// get the root node
//			xmlNodePtr root = xmlDocGetRootElement(_doc);
//			if(root == NULL && outError) {
//				*outError = [NSError errorWithDomain:@"ORXMLErrorDomain" code:ENOROO userInfo:NULL];
//				xmlFreeDoc(_doc);
//				return nil;
//			}
	}
	return self;
}

- (void)dealloc
{
	[self close];
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
	
	return [[[ORLibXmlNode alloc] initWithNode:root] autorelease];
}
	
- (NSString *)name
{
	return nil;
}

- (NSString *)value
{
	return nil;
}

- (int)attributeCount
{
	return 0;
}

- (NSString *)attributeAtIndex:(int)index
{
	return nil;
}

- (NSString *)attributeForName:(int)index
{
	return nil;
}

- (NSArray *)attributeNames
{
	return nil;
}

- (BOOL)readNext
{
	return NO;
}

- (BOOL)readParent
{
	return NO;
}

- (void)close
{
	xmlFreeDoc(_doc);
}

@end
