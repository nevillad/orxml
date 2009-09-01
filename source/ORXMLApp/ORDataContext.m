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

#import "ORDataContext.h"
#import "ORDataDictionary.h"

@implementation ORDataContext

- (void)dealloc
{
	[_data release];
	[super dealloc];
}

- (void)lazyCreateDataDictionary
{
	if(_data == nil) {
		_data = [[ORDataDictionary alloc]init];
	}
}

- (void)putValue:(id)value forKey:(NSString *)key
{
	[self lazyCreateDataDictionary];
	[_data putValue:value forKey:key];
}

- (id)getValueForKey:(NSString *)key
{
	[self lazyCreateDataDictionary];
	return [_data getValueForKey:key];
}

- (NSArray *)keys
{
	[self lazyCreateDataDictionary];
	return [_data keys];
}

@end
