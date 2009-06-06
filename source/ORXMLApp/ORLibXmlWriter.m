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

#pragma mark ORXMLWriter Members

- (void)addAttributeWithName:(NSString *)name forValue:(NSString *)value
{
}

- (void)close
{
}

- (void)endNode
{
}

- (void)setValue:(NSString *)value
{
}

- (void)startNodeWithName:(NSString *)name
{
}

- (NSData *)data
{
	return nil;
}

@end
