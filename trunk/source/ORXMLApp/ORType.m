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

@implementation ORType

@synthesize declaringType, classOfType;
@dynamic name, superClass, properties;

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
	return [NSString stringWithUTF8String:class_getName(classOfType)];
}

- (ORType *)superClass
{
	return [ORType typeWithClass: class_getSuperclass(self.classOfType)];
}

- (NSArray *)properties
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
