//
//  PREFIXArrnull.h
//
//  Created on 
//  Copyright (c) . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PREFIXArrnull : NSObject <NSCoding>


+ (PREFIXArrnull *)modelWithDictionary:(NSDictionary *)dict;
+ (PREFIXArrnull *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
