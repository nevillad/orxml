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
#import "ORConverterProvider.h"
#import "NSObject+ReflectionCategory.h"

@implementation ORTreeMarshaller

- (id)initWithXmlWriter:(id<ORXMLWriter>)aWriter converterProvider:(id<ORConverterProvider>)provider mapper:(ORMapper *)aMapper;
{
	if(self = [super init]) {
		[aMapper retain];
		_mapper = aMapper;
		
		[aWriter retain];
		_writer = aWriter;
		
		[provider retain];
		_converterProvider = provider;
	}
	
	return self;
}

- (void)dealloc
{
	[_mapper release];
	[_writer release];
	[_converterProvider release];
	[super dealloc];
}

- (void)convertValue:(id)value
{
	[self convertValue:value withConverter:nil];
}

- (void)convertValue:(id)value withConverter:(id<ORConverter>)converter
{
	id<ORConverter> valueConverter = (converter != nil) ? converter : [_converterProvider converterForType:[value typeOfObject]];
	
	if(![valueConverter canConvertType:[value typeOfObject]]) {
		// throw an exception
	}
	
	[valueConverter marshalValue:value xmlWriter:_writer marshallingContext:self];
}

- (void)startMarshallingItem:(id)item withContext:(id<ORContext>)context
{
	_data = context;
	if(item == nil) {
		[_writer startNodeWithName:[_mapper aliasForType:nil]];
		[_writer endNode];
	}
	else {
		[_writer startNodeWithName:[_mapper aliasForType:[item typeOfObject]]];
		[self convertValue:item];
		[_writer endNode];
	}
}

@end
