//
//  PREFIXArrobj.h
//
//  Created on 
//  Copyright (c) . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PREFIXArrobj : NSObject <NSCoding>

@property (nonatomic, strong) NSString * str;
@property (nonatomic, strong) NSNumber * num;
@property (nonatomic, strong) NSNumber * flo;
@property (nonatomic, strong) NSNumber * boo;
@property (nonatomic, strong) Null * null;

+ (PREFIXArrobj *)modelWithDictionary:(NSDictionary *)dict;
+ (PREFIXArrobj *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
