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

#import <Foundation/Foundation.h>
#import "ORType.h"
#import "ORMemberInfo.h"

@interface ORType : NSObject <ORMemberInfo> {
	Class classOfType;
}

@property (nonatomic, readonly) Class classOfType;
@property (nonatomic, readonly) ORType *superClass;
@property (nonatomic, readonly) NSArray *properties;

- (id)initWithClass:(Class)aClass;
- (BOOL)isSubclassOfType:(ORType *)aType;
+ (ORType *)typeWithClass:(Class)aClass;

@end
