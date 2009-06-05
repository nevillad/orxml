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
#import "ORLibXmlReader.h"
//#import <objc/runtime.h>


@implementation ORXMLSerializer

- (id)deserializeWithData:(NSData *)data error:(NSError **)outError
{
	ORLibXmlReader *xmlReader = [[ORLibXmlReader alloc] initWithData:data];
	
//	// parse the document
//	_doc = NULL;
//	
//	// parse xml file if some data is available
//	if (data && data.length > 0)
//	{
//		_doc = xmlParseMemory([data bytes], [data length]);
//	}
//	
//	// check errors
//	if(_doc == NULL && outError) {
//		*outError = [NSError errorWithDomain:@"ORXMLErrorDomain" code:ENOVAL userInfo:NULL];
//		return nil;
//	}
//	
//	// get the root node
//	xmlNodePtr root = xmlDocGetRootElement(_doc);
//	if(root == NULL && outError) {
//		*outError = [NSError errorWithDomain:@"ORXMLErrorDomain" code:ENOROO userInfo:NULL];
//		xmlFreeDoc(_doc);
//		return nil;
//	}
//	
//	// deserialize the object
//	id result = [self createObjectFromNode:root error:outError];
//	
//	// free the resources
//	xmlFreeDoc(_doc);
//	
//	// return the created instance
//	return result;
	
	[xmlReader release];
	
	return nil;
}

- (NSData *)serializeTarget:(id)target
{
	return nil;
}


//- (id)createObjectFromNode:(xmlNodePtr)node error:(NSError **)outError
//{
//	// create the class object from the node name
//	Class class = NSClassFromString([NSString stringWithUTF8String:(const char *)node->name]);
//	if(class == nil && outError) {
//		*outError = [NSError errorWithDomain:@"ORXMLErrorDomain" code:ECLANF userInfo:NULL];
//		return nil;
//	}
//	
//	// create the instance
//	id result = [[[class alloc] init] autorelease];
//	if(result == nil) {
//		*outError = [NSError errorWithDomain:@"ORXMLErrorDomain" code:ECNCI userInfo:NULL];
//		return nil;
//	}
//	
//	// fill in the attribute values
//	[self processAttributesFromNode:node target:result];
//	
//	// process the children nodes
//	[self processChildrenFromNode:node target:result error:outError];
//	
//	return result;
//}
//
//- (void)processAttributesFromNode:(xmlNodePtr)node target:(id)target
//{
//	xmlAttrPtr attr = node->properties;
//	
//	// iterate thru the attributes and set the object properties
//	while (attr != NULL) {
//		xmlChar *value = xmlNodeListGetString(_doc, attr->children, YES);
//		[self fillPropertyOfTarget:target 
//						 withValue:[NSString stringWithUTF8String:(const char *)value] 
//							forKey:[NSString stringWithUTF8String:(const char *)attr->name]];
//		xmlFree(value);
//		
//		attr = attr->next;
//	}
//}
//
//- (void)processChildrenFromNode:(xmlNodePtr)node target:(id)target error:(NSError **)outError
//{
//	xmlNodePtr child = node->xmlChildrenNode;
//	while(child != NULL) {
//		
//		// check if the node is an xml element
//		if(child->type == XML_ELEMENT_NODE) {
//			
//			NSString *elementName = [NSString stringWithUTF8String:(const char *)child->name];
//			NSString *parentElementName = [NSString stringWithUTF8String:(const char *)child->parent->name];
//			
//			if([self classWithNameExists:elementName]) {
//				// create instance from the node
//				id childObject = [self createObjectFromNode:child error:outError];
//			
//				// don't process further children if an error occured
//				if(childObject == nil) break;
//			
//				// add the object, if the direct property is an array
//				if([self valueForKeyIsArray:elementName fromTagret:target]) {
//					NSMutableArray *array = [self arrayFromPropertyWithKey:elementName fromTarget:target];
//					[array addObject:childObject];
//				}
//				
//				// add the object if the parent node property is an array
//				else if([self valueForKeyIsArray:parentElementName fromTagret:target]) {
//					NSMutableArray *array = [self arrayFromPropertyWithKey:parentElementName fromTarget:target];
//					[array addObject:childObject];
//				}
//				
//				// set object property, if not
//				else {
//					[self fillPropertyOfTarget:target 
//									 withValue:childObject 
//										forKey:elementName];
//				}
//			}
//			else if([self valueForKeyIsArray:elementName fromTagret:target]) {
//				[self processChildrenFromNode:child target:target error:outError];
//			}
//		}
//		
//		child = child->next;
//	}
//}
//
//- (void)fillPropertyOfTarget:(id)target withValue:(id)value forKey:(NSString *)key
//{
//	NSString *lowerCaseKey = [self convertToKVCKey:key];	
//	
//	// fill the property only, if the object supports the provided key
//	@try {
//		[target setValue:value forKey:lowerCaseKey];
//	}
//	@catch (NSException * e) {
//		// swallow the exception, it just should not fill teh property if it does not exists
//	}
//}
//
//- (NSInteger)elementCountForName:(NSString *)name fromNode:(xmlNodePtr)node;
//{
//	int count = 0;
//	
//	// utf8 node name string
//	const xmlChar *theName = (const xmlChar *)[name UTF8String];
//	
//	// iterate thru the children and add all nodes with the provided name
//	xmlNodePtr child = node->children;
//	while (child != NULL)
//	{
//		if (child->type == XML_ELEMENT_NODE && xmlStrcmp(theName, child->name) == 0)
//		{
//			count++;
//		}
//		child = child->next;
//	}
//	return count;
//}
//
//- (BOOL)valueForKeyIsArray:(NSString *)key fromTagret:(id)target
//{
//	NSString *lowerCaseKey = [self convertToKVCKey:key];
//	objc_property_t property = class_getProperty([target class], [lowerCaseKey UTF8String]);
//	if(property != NULL) {
//		NSString *propertyAttrs = [NSString stringWithUTF8String:property_getAttributes(property)];
//		//NSString *encodedType = [NSString stringWithUTF8String:@encode(NSArray *)];
//		NSString *encodedType = @"@\"NSArray\"";
//	
//		NSRange range = [propertyAttrs rangeOfString:encodedType options:NSLiteralSearch];
//		return range.location != NSNotFound;
//	}
//	return NO;
//}
//
//- (NSString *)convertToKVCKey:(NSString *)xmlKey
//{
//	return [[[xmlKey substringToIndex:1] lowercaseString] stringByAppendingString:[xmlKey substringFromIndex:1]];	
//}
//
//- (BOOL)classWithNameExists:(NSString *)name
//{
//	NSString *classConformName = [self convertToClassName:name];
//	Class class = NSClassFromString(classConformName);
//	
//	return class != nil;
//}
//
//- (NSString *)convertToClassName:(NSString *)xmlClassName
//{
//	return [[[xmlClassName substringToIndex:1] uppercaseString] stringByAppendingString:[xmlClassName substringFromIndex:1]];	
//}
//
//- (NSMutableArray *)arrayFromPropertyWithKey:(NSString *)key fromTarget:(id)target
//{
//	NSString *lowerCaseKey = [self convertToKVCKey:key];
//	NSMutableArray *array = [target valueForKey:lowerCaseKey];
//	
//	if(array == nil) {
//		array = [NSMutableArray array];
//		[target setValue:array forKey:lowerCaseKey];
//	}
//	return array;
//}

@end
