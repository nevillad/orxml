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

#import "ORNumberConverter.h"

@implementation ORNumberConverter

#pragma mark Initialization Members

+ (ORNumberConverter *)converter
{
	return [[[ORNumberConverter alloc] init] autorelease];
}

#pragma mark ORConverterMatcher Members

- (BOOL)canConvertType:(ORType *)type
{
	return [[ORType typeWithClass:[NSNumber class]] isEqual:type];
}

#pragma ORSingleValueCnverter Members

- (id)convertFromString:(NSString *)aString
{
	long long scannedNumber;
	[[NSScanner scannerWithString:aString] scanLongLong:&scannedNumber];
	
	return [NSNumber  numberWithLongLong:scannedNumber];
}

- (NSString *)convertToString:(id)value
{
	return [value stringValue];
}

@end
