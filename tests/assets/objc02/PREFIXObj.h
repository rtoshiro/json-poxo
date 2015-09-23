//
//  PREFIXObj.h
//
//  Created on 2015/09/23
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PREFIXObj : NSObject <NSCoding, NSCopying>

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
