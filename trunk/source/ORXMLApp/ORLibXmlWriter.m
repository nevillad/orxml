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

#import "ORLibXmlWriter.h"


@implementation ORLibXmlWriter

#pragma mark Initialization Members

- (id)init
{
	if(self = [super init]) {
		_doc = xmlNewDoc((const xmlChar *)"1.0");
	}
	
	return self;
}

- (void)dealloc
{
	[self close];
	[super dealloc];
}

#pragma mark ORXMLWriter Members

- (void)addAttributeWithName:(NSString *)name forValue:(NSString *)value
{
	if(_cur != NULL && name != nil) {
		NSString *nonNilValue = (value != nil) ? value : [NSString stringWithString:@""];
		
		xmlNewProp(_cur, BAD_CAST [name UTF8String], BAD_CAST [nonNilValue UTF8String]);
	}
}

- (void)close
{
	xmlFreeDoc(_doc);
}

- (void)endNode
{
	if(_cur != NULL && _cur != xmlDocGetRootElement(_doc)) {
		_cur = _cur->parent;
	}
}

- (void)setValue:(NSString *)value
{
	if(_cur != NULL && value != nil) {
		xmlNodePtr textContent = xmlNewText(BAD_CAST [value UTF8String]);
		xmlAddChild(_cur, textContent);
	}
}

- (void)startNodeWithName:(NSString *)name
{
	xmlNodePtr node = xmlNewNode(NULL, BAD_CAST [name UTF8String]);
	
	if(_cur == NULL) {
		xmlDocSetRootElement(_doc, node);
	}
	else {
		xmlAddChild(_cur, node);
	}
	
	_cur = node;
}

- (NSData *)data
{
	xmlChar *xmlbuff;
	int buffersize;
	
	xmlDocDumpFormatMemory(_doc, &xmlbuff, &buffersize, 1);
	
	NSString *xmlString = [NSString stringWithUTF8String:(const char *)xmlbuff];
	NSLog(xmlString);
	
	return [NSData dataWithBytes:xmlbuff length:buffersize];
}

@end
