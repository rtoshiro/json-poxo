//
//  PREFIXNull.h
//
//  Created on DATA_DE_HOJE
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PREFIXNull : NSObject <NSCoding>


+ (PREFIXNull *)modelWithDictionary:(NSDictionary *)dict;
+ (PREFIXNull *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
