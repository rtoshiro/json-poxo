//
//  PREFIXArrnull.h
//
//  Created on 2015/09/19
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PREFIXArrnull : NSObject <NSCoding, NSCopying>


+ (PREFIXArrnull *)modelWithDictionary:(NSDictionary *)dict;
+ (PREFIXArrnull *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
