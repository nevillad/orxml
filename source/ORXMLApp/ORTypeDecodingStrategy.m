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
 
#import "ORTypeDecodingStrategy.h"
#import "ORPrimitiveTypeDecoder.h"

@interface ORTypeDecodingStrategy ( PrivateExtension )

- (id<ORTypeDecoding>)decoderForEncodedType:(NSString *)encodedType;

@end
 
@implementation ORTypeDecodingStrategy

- (id)init
{
	if(self = [super init]) {
		propertyTypeDecoders = [[NSMutableArray alloc] init];
		[propertyTypeDecoders addObject:[ORPrimitiveTypeDecoder decoder]];
	}
	
	return self;
}

- (void)dealloc
{
	[propertyTypeDecoders release];
	[super dealloc];
}

+ (ORTypeDecodingStrategy *)strategy
{
	return [[[ORTypeDecodingStrategy alloc] init] autorelease];
}

- (ORType *)decodeTypeString:(NSString *)encodedType
{
	id<ORTypeDecoding> decoder = [self decoderForEncodedType:encodedType];
	
	// TODO: throw an exception if no decoder has been returned

	return [decoder decodeTypeString:encodedType];
} 

- (BOOL)canDecodeTypeString:(NSString *)encodedType
{
	return [self decoderForEncodedType:encodedType] != nil;
}

- (id<ORTypeDecoding>)decoderForEncodedType:(NSString *)encodedType
{
	id<ORTypeDecoding> result = nil;
	
	for(id<ORTypeDecoding> decoder in propertyTypeDecoders) {
		if([decoder canDecodeTypeString:encodedType]) {
			result = decoder;
			break;
		}
	}
	
	return result;
}
 
@end