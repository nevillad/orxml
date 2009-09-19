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

#import "ORSingleValueConverterContainer.h"

@implementation ORSingleValueConverterContainer

#pragma mark Initialization

- (id)initWithConverter:(id<ORSingleValueConverter>)aSingleValueConverter
{
	if(self = [super init]) {
		[aSingleValueConverter retain];
		singleValueConverter = aSingleValueConverter;
	}
	
	return self;
}

+ (ORSingleValueConverterContainer *)singleValueConverterContainerWithConverter:(id<ORSingleValueConverter>)aSingleValueConverter
{
	return [[[ORSingleValueConverterContainer alloc] initWithConverter:aSingleValueConverter] autorelease];
}

- (void) dealloc
{
	[singleValueConverter release];
	[super dealloc];
}

#pragma mark ORConverterMatcher Members

- (BOOL)canConvertType:(ORType *)type
{
	return [singleValueConverter canConvertType:type];
}

#pragma mark ORConverter Members

- (void)marshalValue:(id)value xmlWriter:(id<ORXMLWriter>)writer marshallingContext:(id<ORMarshallingContext>)context
{
	[writer setValue:[self convertToString:value]];
}

- (id)unmarshalFromXmlReader:(id<ORXMLReader>)reader unmarshallingContext:(id<ORUnmarshallingContext>)context
{
	return [self convertFromString:[reader value]];
}

#pragma ORSingleValueCnverter Members

- (id)convertFromString:(NSString *)aString
{
	return [singleValueConverter convertFromString:aString];
}

- (NSString *)convertToString:(id)value
{
	return [singleValueConverter convertToString:value];
}

@end
