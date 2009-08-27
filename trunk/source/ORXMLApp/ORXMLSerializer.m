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
//#import <objc/runtime.h>


@implementation ORXMLSerializer

- (id)init
{
	if(self = [super init]) {
		_driver = [[[ORLibXmlDriver alloc] init] autorelease];
		_mapper = [[[ORMapper alloc] init] autorelease];
		_marshallingStrategy = [[[ORTreeMarshallingStrategy alloc] initWithMapper:_mapper] autorelease];
	}
	
	return self;
}

- (id)deserializeWithData:(NSData *)data error:(NSError **)outError
{
	id<ORXMLReader> xmlReader = [_driver xmlReaderForData:data];
	
	NSLog(@"%@", xmlReader);
	
	return [_marshallingStrategy unmarshalValue:nil
									  xmlReader:xmlReader 
								converterLookup:_converterLookup 
										context:nil];
}

- (NSData *)serializeTarget:(id)target
{
	id<ORXMLWriter> xmlWriter = [_driver xmlWriter];

	[_marshallingStrategy marshalValue:nil 
							 xmlWriter:xmlWriter 
					   converterLookup:_converterLookup 
							   context:nil];

	return [xmlWriter data];
}

- (void)dealloc
{
	[super dealloc];
}

@end
