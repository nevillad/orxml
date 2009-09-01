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
#import "ORDataContext.h"
#import "ORUnmarshallingContext.h"

@class ORMapper;
@protocol ORXMLReader, ORConverterLookup;

@interface ORTreeUnmarschaller : ORDataContext <ORUnmarshallingContext> {
	ORMapper *_mapper;
	id<ORXMLReader> _reader;
	id<ORConverterLookup> _converterLookup;
	id _root;
}

- (id)initWithItem:(id)root xmlReader:(id<ORXMLReader>)reader converterLookup:(id<ORConverterLookup>)aConverterLookup mapper:(ORMapper *)aMapper;
- (id)startUnmarshallingWithContext:(id<ORContext>)context;

@end
