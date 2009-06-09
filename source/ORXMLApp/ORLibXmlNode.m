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

#import "ORLibXmlNode.h"


@implementation ORLibXmlNode

- (id)initWithDocument:(xmlDocPtr)doc node:(xmlNodePtr)node
{
	if(self = [super init]) {
		_node = node;
		_doc = doc;
	}
	
	return self;
}

- (ORLibXmlNode *)parent
{
	return [[[ORLibXmlNode alloc] initWithDocument:_doc node:_node->parent] autorelease];
}

- (ORLibXmlNode *)nextChild
{
	if(_currentChild == NULL) {
		_currentChild = _node->xmlChildrenNode;
	}
	else {
		_currentChild = _currentChild->next;
	}
	
	return _currentChild != NULL ? [[[ORLibXmlNode alloc] initWithDocument:_doc node:_currentChild] autorelease] : nil;
}

- (NSString *)value
{
	xmlChar *value = xmlNodeListGetString(_doc, _node->children, YES);
	return [NSString stringWithUTF8String:(const char *)value];
}

- (NSString *)name
{
	return [NSString stringWithUTF8String:(const char *)_node->name];
}

@end
