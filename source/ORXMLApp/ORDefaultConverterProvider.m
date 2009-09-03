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

#import "ORDefaultConverterProvider.h"
#import "ORPriorizedItem.h"

@implementation ORDefaultConverterProvider

- (id)init
{
	if(self = [super init]) {
		_registeredConverters = [[NSMutableArray alloc] init];
	}
	
	return self;
}

- (void)dealloc
{
	[_registeredConverters release];
	[super dealloc];
}

- (id<ORConverter>)converterForType:(Class)type
{
	NSSortDescriptor *descriptor = [[[NSSortDescriptor alloc] initWithKey:@"priority" ascending:NO] autorelease];
	NSArray *sortedConverters = [_registeredConverters sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]];
	
	id<ORConverter> converter;
	
	for(id pi in sortedConverters) {
		if([[pi item] canConvertType:type]) {
			converter = [pi item];
			break;
		}
	}
	
	// throw an exception if no converter has been found
	
	return converter;
}

- (void)registerConverter:(id<ORConverter>)converter withPriority:(ORConverterPriority)priority;
{
	ORPriorizedItem *item = [ORPriorizedItem priorizedItemWithItemAndPriority:converter priority:priority];
	[_registeredConverters addObject:item];
}

@end
