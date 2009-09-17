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

@synthesize name, declaringType, classOfType;
@dynamic superClass;

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

- (ORType *)superClass
{
	return [ORType typeWithClass: class_getSuperclass(self.classOfType)];
}

- (BOOL)isSubclassOfType:(ORType *)aType
{
	ORType *sc = [self superClass];
	return [self isEqual:aType] || [sc isSubclassOfClass:aType];
}

- (BOOL)isEqual:(id)anObject
{
	return classOfType == [anObject classOfType];
}

@end
