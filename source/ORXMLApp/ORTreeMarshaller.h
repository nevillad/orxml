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
#import "ORMarshallingContext.h"

@class ORMapper;
@protocol ORXMLWriter, ORConverterProvider;

@interface ORTreeMarshaller : ORDataContext <ORMarshallingContext> {
	ORMapper *_mapper;
	id<ORXMLWriter> _writer;
	id<ORConverterProvider> _converterProvider;
}

- (id)initWithXmlWriter:(id<ORXMLWriter>)writer converterProvider:(id<ORConverterProvider>)provider mapper:(ORMapper *)aMapper;
- (void)startMarshallingItem:(id)item withContext:(id<ORContext>)context;

@end
