//
//  Spa_ce.h
//
//  Created on 2015/11/05
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Spa_ce : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString * _1one;

+ (Spa_ce *)modelWithDictionary:(NSDictionary *)dict;
+ (Spa_ce *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
