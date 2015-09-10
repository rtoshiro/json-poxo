//
//  PREFIXRootClass.h
//
//  Created on 
//  Copyright (c) . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PREFIXRootClass : NSObject <NSCoding>

@property (nonatomic, strong) NSString * _id;
@property (nonatomic, strong) NSString * str;
@property (nonatomic, strong) NSNumber * num;
@property (nonatomic, strong) NSNumber * flo;
@property (nonatomic, strong) NSNumber * boo;
@property (nonatomic, strong) NSMutableArray * arrnum;
@property (nonatomic, strong) NSMutableArray * arrstr;
@property (nonatomic, strong) NSMutableArray * arrboo;
@property (nonatomic, strong) NSMutableArray * arrnull;
@property (nonatomic, strong) Obj * obj;
@property (nonatomic, strong) NSMutableArray * arrobj;

+ (PREFIXRootClass *)modelWithDictionary:(NSDictionary *)dict;
+ (PREFIXRootClass *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
