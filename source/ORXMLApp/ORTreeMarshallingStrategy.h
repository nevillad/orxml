//
//  ORTreeMarshallingStrategy.h
//  ORXmlApp
//
//  Created by Michael Lehmann on 27.08.09.
//  Copyright 2009 Mettler Toledo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ORMarshallingStrategy.h"

@class ORMapper;

@interface ORTreeMarshallingStrategy : NSObject <ORMarshallingStrategy>{
	ORMapper *_mapper;
}

- (id)initWithMapper:(ORMapper *)mapper;

@end
