//
//  PREFIXNull.h
//
//  Created on 
//  Copyright (c) . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PREFIXNull : NSObject <NSCoding>


+ (PREFIXNull *)modelWithDictionary:(NSDictionary *)dict;
+ (PREFIXNull *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
