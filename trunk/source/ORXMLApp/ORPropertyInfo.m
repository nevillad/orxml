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

#import "ORPropertyInfo.h"
#import "ORType.h"

@implementation ORPropertyInfo

@synthesize declaringType;
@dynamic name, propertyType, isReadonly;

- (id)initWithProperty:(objc_property_t)aProperty declaringType:(ORType *)type;
{
	if(self = [super init]) {
		property = aProperty;
		declaringType = type;
	}
	
	return self;
}

- (void)dealloc
{
	[declaringType release];
	[super dealloc];
}

+ (ORPropertyInfo *)propertyInfoWithProperty:(objc_property_t)aProperty declaringType:(ORType *)type
{
	return [[[ORPropertyInfo alloc] initWithProperty:aProperty declaringType:type] autorelease];
}

- (NSString *)name
{
	return [NSString stringWithUTF8String:property_getName(property)];
}

- (ORType *)propertyType
{
	NSString *encodedType = [[[NSString stringWithUTF8String:property_getAttributes(property)] componentsSeparatedByString:@","] objectAtIndex:0];
	return nil;
}

- (BOOL)isReadonly
{
	NSArray *attributes = [[NSString stringWithUTF8String:property_getAttributes(property)] componentsSeparatedByString:@","];
	return [[attributes filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF == 'R'"]] count] > 0;
}

@end
