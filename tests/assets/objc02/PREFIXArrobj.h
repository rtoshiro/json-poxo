//
//  PREFIXArrobj.h
//
//  Created on 2015/11/17
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PREFIXArrobj : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString * str;
@property (nonatomic, strong) NSNumber * num;
@property (nonatomic, strong) NSNumber * flo;
@property (nonatomic, strong) NSNumber * boo;
@property (nonatomic, strong) id null;

+ (PREFIXArrobj *)modelWithDictionary:(NSDictionary *)dict;
+ (PREFIXArrobj *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
