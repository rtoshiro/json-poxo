//
//  Null.h
//
//  Created on DATA_DE_HOJE
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Null : NSObject <NSCoding>


+ (Null *)modelWithDictionary:(NSDictionary *)dict;
+ (Null *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
