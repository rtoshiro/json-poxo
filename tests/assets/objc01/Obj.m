//
//  Obj.m
//
//  Created by on 
//  Copyright (c) . All rights reserved.
//

#import "Obj.h"

// Original names
NSString * const kStr = @"str";
NSString * const kNum = @"num";
NSString * const kFlo = @"flo";
NSString * const kBoo = @"boo";

@interface Obj ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Obj

+ (Obj *)modelWithDictionary:(NSDictionary *)dict
{
  Obj *instance = [[Obj alloc] initWithDictionary:dict];
  return instance;
}

+ (Obj *)modelWithString:(NSString *)json
{
  Obj *instance = [[Obj alloc] initWithString:json];
  return instance;
}

- (instancetype)initWithString:(NSString *)json
{
  self = [super init];

  NSError *jsonError = nil;
  NSData *objectData = [json dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:objectData
                                      options:NSJSONReadingMutableContainers
                                        error:&jsonError];
  if (!jsonError)
    self = [self initWithDictionary:dict];

  return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
  self = [super init];

  if (self && [dict isKindOfClass:[NSDictionary class]])
  {
    self.str = [self objectOrNilForKey:kStr fromDictionary:dict];
    self.num = [self objectOrNilForKey:kNum fromDictionary:dict];
    self.flo = [self objectOrNilForKey:kFlo fromDictionary:dict];
    self.boo = [self objectOrNilForKey:kBoo fromDictionary:dict];
  }
  return self;
}

- (NSDictionary *)dictionaryRepresentation
{
  NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
  [mutableDict setValue:self.str forKey:kStr];
  [mutableDict setValue:self.num forKey:kNum];
  [mutableDict setValue:self.flo forKey:kFlo];
  [mutableDict setValue:self.boo forKey:kBoo];

  return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
  id object = [dict objectForKey:aKey];
  return [object isEqual:[NSNull null]] ? nil : object;
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
  self = [super init];

  self.str = [aDecoder decodeObjectForKey:kStr];
  self.num = [aDecoder decodeObjectForKey:kNum];
  self.flo = [aDecoder decodeObjectForKey:kFlo];
  self.boo = [aDecoder decodeObjectForKey:kBoo];

  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:_str forKey:kStr];
  [aCoder encodeObject:_num forKey:kNum];
  [aCoder encodeObject:_flo forKey:kFlo];
  [aCoder encodeObject:_boo forKey:kBoo];
}

- (id)copyWithZone:(NSZone *)zone
{
  Obj *copy = [[Obj alloc] init];
  if (copy)
  {
    copy.str = [self.str copyWithZone:zone];
    copy.num = [self.num copyWithZone:zone];
    copy.flo = [self.flo copyWithZone:zone];
    copy.boo = [self.boo copyWithZone:zone];
  }

  return copy;
}

@end
