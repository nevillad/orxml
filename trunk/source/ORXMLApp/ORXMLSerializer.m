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

#import "ORXMLSerializer.h"
#import "ORLibXmlDriver.h"
#import "ORXMLWriter.h"
#import "ORXMLReader.h"
#import "ORTreeMarshallingStrategy.h"
#import "ORMapper.h"
#import "ORDefaultConverterProvider.h"
#import "ORConverterPriority.h"
#import "ORDefaultObjectConverter.h"
#import "ORSingleValueConverterContainer.h"
#import "ORNumberConverter.h"

@interface ORXMLSerializer ( PrivateExtension )

- (void)setupConverters;

@end

@implementation ORXMLSerializer

- (id)init
{
	if(self = [super init]) {
		_driver = [[ORLibXmlDriver alloc] init];
		_mapper = [[ORMapper alloc] init];
		_marshallingStrategy = [[ORTreeMarshallingStrategy alloc] initWithMapper:_mapper];
		_converterProvider = [[ORDefaultConverterProvider alloc] init];
		
		[self setupConverters];
	}
	
	return self;
}

- (void)dealloc
{
	[_driver release];
	[_mapper release];
	[_marshallingStrategy release];
	[_converterProvider release];
	[super dealloc];
}

- (id)deserializeWithData:(NSData *)data
{
	id<ORXMLReader> xmlReader = [_driver xmlReaderForData:data];
	
	NSLog(@"%@", xmlReader);
	
	return [_marshallingStrategy unmarshalValue:nil
									  xmlReader:xmlReader 
								converterProvider:_converterProvider 
										context:nil];
}

- (NSData *)serializeTarget:(id)target
{
	id<ORXMLWriter> xmlWriter = [_driver xmlWriter];

	[_marshallingStrategy marshalValue:target
							 xmlWriter:xmlWriter 
					   converterProvider:_converterProvider 
							   context:nil];

	return [xmlWriter data];
}

- (void)setupConverters
{
	[_converterProvider registerConverter:[ORDefaultObjectConverter converter] withPriority:ORConverterPriorityLowest];
	[_converterProvider registerConverter:[ORSingleValueConverterContainer containerWithConverter:[ORNumberConverter converter]] withPriority:ORConverterPriorityNormal];
}

@end
