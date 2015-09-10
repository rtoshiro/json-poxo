//
//  Arrnull.h
//
//  Created on 
//  Copyright (c) . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Arrnull : NSObject <NSCoding>


+ (Arrnull *)modelWithDictionary:(NSDictionary *)dict;
+ (Arrnull *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
