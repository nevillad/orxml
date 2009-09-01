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

#import "ORTreeMarshaller.h"
#import "ORMapper.h"
#import "ORXMLWriter.h"
#import "ORConverterLookup.h"

@implementation ORTreeMarshaller

- (id)initWithXmlWriter:(id<ORXMLWriter>)aWriter converterLookup:(id<ORConverterLookup>)aConverterLookup mapper:(ORMapper *)aMapper;
{
	if(self = [super init]) {
		[aMapper retain];
		_mapper = aMapper;
		
		[aWriter retain];
		_writer = aWriter;
		
		[aConverterLookup retain];
		_converterLookup = aConverterLookup;
	}
	
	return self;
}

- (void)dealloc
{
	[_mapper release];
	[_writer release];
	[_converterLookup release];
	[super dealloc];
}

- (void)convertValue:(id)value
{
}

- (void)convertValue:(id)value withConverter:(id<ORConverter>)converter
{
}

- (void)startMarshallingItem:(id)item withContext:(id<ORContext>)context
{
	_data = context;
	
	if(item == nil) {
	}
	else {
	}
}

@end
