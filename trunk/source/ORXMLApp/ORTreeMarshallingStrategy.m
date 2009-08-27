//
//  ORTreeMarshallingStrategy.m
//  ORXmlApp
//
//  Created by Michael Lehmann on 27.08.09.
//  Copyright 2009 Mettler Toledo. All rights reserved.
//

#import "ORTreeMarshallingStrategy.h"
#import "ORMapper.h"


@implementation ORTreeMarshallingStrategy

- (id)initWithMapper:(ORMapper *)mapper
{
	if(self = [super init]) {
		[mapper retain];
		_mapper = mapper;
	}
	
	return self;
}

- (void)marshalValue:(id)value xmlWriter:(id<ORXMLWriter>)writer converterLookup:(id<ORConverterLookup>)aConverterLookup context:(id<ORContext>)aContext
{
}

- (id)unmarshalValue:(id)value xmlReader:(id<ORXMLReader>)reader  converterLookup:(id<ORConverterLookup>)aConverterLookup context:(id<ORContext>)aContext
{
	return nil;
}

@end
