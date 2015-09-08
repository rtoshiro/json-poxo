//
//  Obj.h
//
//  Created on DATA_DE_HOJE
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Obj : NSObject <NSCoding>

@property (nonatomic, strong) NSString * str;
@property (nonatomic, strong) NSNumber * num;
@property (nonatomic, strong) NSNumber * flo;
@property (nonatomic, strong) NSNumber * boo;

+ (Obj *)modelWithDictionary:(NSDictionary *)dict;
+ (Obj *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
