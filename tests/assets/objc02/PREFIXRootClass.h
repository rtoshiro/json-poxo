//
//  PREFIXRootclass.h
//
//  Created on 2015/09/24
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PREFIXRootclass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString * _id;
@property (nonatomic, strong) NSString * str;
@property (nonatomic, strong) NSNumber * num;
@property (nonatomic, strong) NSNumber * flo;
@property (nonatomic, strong) NSNumber * boo;
@property (nonatomic, strong) Special * special;
@property (nonatomic, strong) NSMutableArray * arrdouble;
@property (nonatomic, strong) NSMutableArray * arrnum;
@property (nonatomic, strong) NSMutableArray * arrstr;
@property (nonatomic, strong) NSMutableArray * arrboo;
@property (nonatomic, strong) NSMutableArray * arrnull;
@property (nonatomic, strong) Obj * obj;
@property (nonatomic, strong) NSMutableArray * arrobj;

+ (PREFIXRootclass *)modelWithDictionary:(NSDictionary *)dict;
+ (PREFIXRootclass *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
