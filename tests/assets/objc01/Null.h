//
//  Null.h
//
//  Created on 
//  Copyright (c) . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Null : NSObject <NSCoding>


+ (Null *)modelWithDictionary:(NSDictionary *)dict;
+ (Null *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
