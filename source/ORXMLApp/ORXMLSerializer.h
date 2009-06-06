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
#import "ORXMLDriver.h"

@interface ORXMLSerializer : NSObject {
	id<ORXMLDriver> _driver;
	//xmlDocPtr _doc;
}
- (id)deserializeWithData:(NSData *)data error:(NSError **)outError;
- (NSData *)serializeTarget:(id)target;

//- (id)createObjectFromNode:(xmlNodePtr)node error:(NSError **)outError;
//- (void)processAttributesFromNode:(xmlNodePtr)node target:(id)target;
//- (void)processChildrenFromNode:(xmlNodePtr)node target:(id)target error:(NSError **)outError;
//- (void)fillPropertyOfTarget:(id)target withValue:(id)value forKey:(NSString *)key;
//- (NSInteger)elementCountForName:(NSString *)name fromNode:(xmlNodePtr)node;
//- (BOOL)valueForKeyIsArray:(NSString *)key fromTagret:(id)target;
//- (NSString *)convertToKVCKey:(NSString *)xmlKey;
//- (BOOL)classWithNameExists:(NSString *)name;
//- (NSString *)convertToClassName:(NSString *)xmlClassName;
//- (NSMutableArray *)arrayFromPropertyWithKey:(NSString *)key fromTarget:(id)target;
@end
