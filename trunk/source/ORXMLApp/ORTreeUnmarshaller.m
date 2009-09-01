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

#import "ORTreeUnmarshaller.h"
#import "ORXMLReader.h"
#import "ORConverterLookup.h"

@implementation ORTreeUnmarshaller

- (id)initWithItem:(id)root xmlReader:(id<ORXMLReader>)reader converterLookup:(id<ORConverterLookup>)aConverterLookup mapper:(ORMapper *)aMapper
{
	if(self = [super init]) {
		[aMapper retain];
		_mapper = aMapper;
		
		[reader retain];
	    _reader = reader;
		
		[aConverterLookup retain];
	    _converterLookup = aConverterLookup;
		
		[root retain];
		_root = root;
	}
	
	return self;
}

- (void)dealloc
{
	[_mapper release];
	[_reader release];
	[_converterLookup release];
	[_root release];
	[super dealloc];
}

- (id)convertValue:(id)value ofType:(Class)type
{
	return nil;
}

- (id)convertValue:(id)value ofType:(Class)type withConverter:(id<ORConverter>)converter
{
	return nil;
}

- (id)startUnmarshallingWithContext:(id<ORContext>)context
{
	return nil;
}

@end
