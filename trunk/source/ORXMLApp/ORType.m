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

#import "ORType.h"
#import "ORPropertyInfo.h"

@implementation ORType

@synthesize classOfType;
@dynamic name, superClass, properties, declaringType;

- (id)initWithClass:(Class)aClass
{
	if(self = [super init]) {
		classOfType = aClass;
	}
	
	return self;
}

+ (ORType *)typeWithClass:(Class)aClass
{
	return [[[ORType alloc] initWithClass:aClass] autorelease];
}

- (NSString *)name
{
	return [NSString stringWithUTF8String:class_getName(self.classOfType)];
}

- (ORType *)superClass
{
	return [ORType typeWithClass: class_getSuperclass(self.classOfType)];
}

- (NSArray *)properties
{
	NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
	unsigned int outCount = 0;
	objc_property_t *propertyList = class_copyPropertyList(self.classOfType, &outCount);
	
	for(int i=0; i<outCount; i++) {
		objc_property_t property = propertyList[i];
		ORPropertyInfo *propertyInfo = [ORPropertyInfo propertyInfoWithProperty:property declaringType:self];
		[array addObject:propertyInfo];
	}
	
	free(propertyList);
	return array;
}

- (ORType *)declaringType
{
	return nil;
}

- (BOOL)isSubclassOfType:(ORType *)aType
{
	ORType *sc = [self superClass];
	return (sc != nil && [sc isEqual:aType]) || (sc != nil && [sc isSubclassOfType:aType]);
}

- (BOOL)isEqual:(id)anObject
{
	return classOfType == [anObject classOfType];
}

@end
