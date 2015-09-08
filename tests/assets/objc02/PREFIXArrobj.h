//
//  PREFIXArrobj.h
//
//  Created on DATA_DE_HOJE
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PREFIXArrobj : NSObject <NSCoding>

@property (nonatomic, strong) NSString * str;
@property (nonatomic, strong) NSNumber * num;
@property (nonatomic, strong) NSNumber * flo;
@property (nonatomic, assign) BOOL boo;

+ (PREFIXArrobj *)modelWithDictionary:(NSDictionary *)dict;
+ (PREFIXArrobj *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
