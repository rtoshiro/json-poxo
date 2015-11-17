//
//  Special.h
//
//  Created on 2015/11/17
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Special : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) id a;
@property (nonatomic, strong) NSString * _b______;
@property (nonatomic, strong) NSString * with_some_spaces;
@property (nonatomic, strong) NSNumber * new;

+ (Special *)modelWithDictionary:(NSDictionary *)dict;
+ (Special *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
