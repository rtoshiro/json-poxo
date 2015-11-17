//
//  PREFIXSpa_ce.m
//
//  Created by on 2015/11/17
//  Copyright (c) 2015. All rights reserved.
//

#import "PREFIXSpa_ce.h"


// Original names
NSString * const kPREFIXSpa_ce_1one = @"1one";

@interface PREFIXSpa_ce ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PREFIXSpa_ce

+ (PREFIXSpa_ce *)modelWithDictionary:(NSDictionary *)dict
{
  PREFIXSpa_ce *instance = [[PREFIXSpa_ce alloc] initWithDictionary:dict];
  return instance;
}

+ (PREFIXSpa_ce *)modelWithString:(NSString *)json
{
  PREFIXSpa_ce *instance = [[PREFIXSpa_ce alloc] initWithString:json];
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
    self._1one = [self objectOrNilForKey:kPREFIXSpa_ce_1one fromDictionary:dict];
  }
  return self;
}

- (NSDictionary *)dictionaryRepresentation
{
  NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
  [mutableDict setValue:self._1one forKey:kPREFIXSpa_ce_1one];

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

  self._1one = [aDecoder decodeObjectForKey:kPREFIXSpa_ce_1one];

  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:__1one forKey:kPREFIXSpa_ce_1one];
}

- (id)copyWithZone:(NSZone *)zone
{
  PREFIXSpa_ce *copy = [[PREFIXSpa_ce alloc] init];
  if (copy)
  {
    copy._1one = [self._1one copyWithZone:zone];
  }

  return copy;
}

@end
