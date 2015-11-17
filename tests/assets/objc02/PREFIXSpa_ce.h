//
//  PREFIXSpa_ce.h
//
//  Created on 2015/11/17
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PREFIXSpa_ce : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString * _1one;

+ (PREFIXSpa_ce *)modelWithDictionary:(NSDictionary *)dict;
+ (PREFIXSpa_ce *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
