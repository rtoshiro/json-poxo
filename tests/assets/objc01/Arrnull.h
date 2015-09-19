//
//  Arrnull.h
//
//  Created on 2015/09/19
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Arrnull : NSObject <NSCoding, NSCopying>


+ (Arrnull *)modelWithDictionary:(NSDictionary *)dict;
+ (Arrnull *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
