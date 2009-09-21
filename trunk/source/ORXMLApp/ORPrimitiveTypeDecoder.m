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
 
#import "ORPrimitiveTypeDecoder.h"
 
@implementation ORPrimitiveTypeDecoder

+ (ORPrimitiveTypeDecoder *)decoder
{
	return [[[ORPrimitiveTypeDecoder alloc] init] autorelease];
}

- (BOOL)canDecodeTypeString:(NSString *)encodedType
{
	// allowed encoded types: char, int, short, long, long long, 
	// unsigned char, unsigned int, unsigned short, unsigned long, unsigned long long, 
	// float, double, BOOL.
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES 'T(c|i|s|l|q|C|I|S|L|Q|f|d|B){1}'"];
	return [predicate evaluateWithObject:encodedType];
}

- (ORType *)decodeTypeString:(NSString *)encodedType
{
	// return the type of NSNumber, which can wrap all primitive data types.
	return [ORType typeWithClass:[NSNumber class]];
}
 
@end