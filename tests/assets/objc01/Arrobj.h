//
//  Arrobj.h
//
//  Created on 2015/11/17
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Arrobj : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString * str;
@property (nonatomic, strong) NSNumber * num;
@property (nonatomic, strong) NSNumber * flo;
@property (nonatomic, strong) NSNumber * boo;
@property (nonatomic, strong) id null;

+ (Arrobj *)modelWithDictionary:(NSDictionary *)dict;
+ (Arrobj *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
