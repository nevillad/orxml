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

#import "ORTreeMarshallingStrategy.h"
#import "ORMapper.h"
#import "ORTreeMarshaller.h"
#import "ORTreeUnmarschaller.h"

@implementation ORTreeMarshallingStrategy

- (id)initWithMapper:(ORMapper *)mapper
{
	if(self = [super init]) {
		[mapper retain];
		_mapper = mapper;
	}
	
	return self;
}

- (void)dealloc
{
	[_mapper release];
	[super dealloc];
}

- (void)marshalValue:(id)value xmlWriter:(id<ORXMLWriter>)writer converterLookup:(id<ORConverterLookup>)aConverterLookup context:(id<ORContext>)aContext
{
	ORTreeMarshaller *marshaller = [[[ORTreeMarshaller alloc] initWithXmlWriter:writer converterLookup:aConverterLookup mapper:_mapper] autorelease];
	[marshaller startMarshallingItem:value withContext:aContext];
}

- (id)unmarshalValue:(id)value xmlReader:(id<ORXMLReader>)reader  converterLookup:(id<ORConverterLookup>)aConverterLookup context:(id<ORContext>)aContext
{
	ORTreeUnmarschaller *unmarshaller = [[[ORTreeUnmarschaller alloc] initWithItem:value xmlReader:reader converterLookup:aConverterLookup mapper:_mapper] autorelease];
	return [unmarshaller startUnmarshallingWithContext:aContext];
}

@end
