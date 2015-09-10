//
//  PREFIXObj.h
//
//  Created on 
//  Copyright (c) . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PREFIXObj : NSObject <NSCoding>

@property (nonatomic, strong) NSString * str;
@property (nonatomic, strong) NSNumber * num;
@property (nonatomic, strong) NSNumber * flo;
@property (nonatomic, strong) NSNumber * boo;

+ (PREFIXObj *)modelWithDictionary:(NSDictionary *)dict;
+ (PREFIXObj *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
