//
//  PREFIXSpecial.m
//
//  Created by on 2015/11/17
//  Copyright (c) 2015. All rights reserved.
//

#import "PREFIXSpecial.h"


// Original names
NSString * const kPREFIXSpecialA = @"A";
NSString * const kPREFIXSpecial_b______ = @"[B]\"\"&^ ";
NSString * const kPREFIXSpecialWith_some_spaces = @"with some spaces";
NSString * const kPREFIXSpecialNew = @"new";

@interface PREFIXSpecial ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PREFIXSpecial

+ (PREFIXSpecial *)modelWithDictionary:(NSDictionary *)dict
{
  PREFIXSpecial *instance = [[PREFIXSpecial alloc] initWithDictionary:dict];
  return instance;
}

+ (PREFIXSpecial *)modelWithString:(NSString *)json
{
  PREFIXSpecial *instance = [[PREFIXSpecial alloc] initWithString:json];
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
    self.a = [self objectOrNilForKey:kPREFIXSpecialA fromDictionary:dict];
    self._b______ = [self objectOrNilForKey:kPREFIXSpecial_b______ fromDictionary:dict];
    self.with_some_spaces = [self objectOrNilForKey:kPREFIXSpecialWith_some_spaces fromDictionary:dict];
    self.new = [self objectOrNilForKey:kPREFIXSpecialNew fromDictionary:dict];
  }
  return self;
}

- (NSDictionary *)dictionaryRepresentation
{
  NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
  [mutableDict setValue:self.a forKey:kPREFIXSpecialA];
  [mutableDict setValue:self._b______ forKey:kPREFIXSpecial_b______];
  [mutableDict setValue:self.with_some_spaces forKey:kPREFIXSpecialWith_some_spaces];
  [mutableDict setValue:self.new forKey:kPREFIXSpecialNew];

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

  self.a = [aDecoder decodeObjectForKey:kPREFIXSpecialA];
  self._b______ = [aDecoder decodeObjectForKey:kPREFIXSpecial_b______];
  self.with_some_spaces = [aDecoder decodeObjectForKey:kPREFIXSpecialWith_some_spaces];
  self.new = [aDecoder decodeObjectForKey:kPREFIXSpecialNew];

  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:_a forKey:kPREFIXSpecialA];
  [aCoder encodeObject:__b______ forKey:kPREFIXSpecial_b______];
  [aCoder encodeObject:_with_some_spaces forKey:kPREFIXSpecialWith_some_spaces];
  [aCoder encodeObject:_new forKey:kPREFIXSpecialNew];
}

- (id)copyWithZone:(NSZone *)zone
{
  PREFIXSpecial *copy = [[PREFIXSpecial alloc] init];
  if (copy)
  {
    copy.a = [self.a copyWithZone:zone];
    copy._b______ = [self._b______ copyWithZone:zone];
    copy.with_some_spaces = [self.with_some_spaces copyWithZone:zone];
    copy.new = [self.new copyWithZone:zone];
  }

  return copy;
}

@end
