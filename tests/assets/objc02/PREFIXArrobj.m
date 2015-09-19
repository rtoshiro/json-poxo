//
//  PREFIXArrobj.m
//
//  Created by on 2015/09/19
//  Copyright (c) 2015. All rights reserved.
//

#import "PREFIXArrobj.h"


// Original names
NSString * const kPREFIXArrobjStr = @"str";
NSString * const kPREFIXArrobjNum = @"num";
NSString * const kPREFIXArrobjFlo = @"flo";
NSString * const kPREFIXArrobjBoo = @"boo";
NSString * const kPREFIXArrobjNull = @"null";

@interface PREFIXArrobj ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PREFIXArrobj

+ (PREFIXArrobj *)modelWithDictionary:(NSDictionary *)dict
{
  PREFIXArrobj *instance = [[PREFIXArrobj alloc] initWithDictionary:dict];
  return instance;
}

+ (PREFIXArrobj *)modelWithString:(NSString *)json
{
  PREFIXArrobj *instance = [[PREFIXArrobj alloc] initWithString:json];
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
    self.str = [self objectOrNilForKey:kPREFIXArrobjStr fromDictionary:dict];
    self.num = [self objectOrNilForKey:kPREFIXArrobjNum fromDictionary:dict];
    self.flo = [self objectOrNilForKey:kPREFIXArrobjFlo fromDictionary:dict];
    self.boo = [self objectOrNilForKey:kPREFIXArrobjBoo fromDictionary:dict];
    self.null = [self objectOrNilForKey:kPREFIXArrobjNull fromDictionary:dict];
  }
  return self;
}

- (NSDictionary *)dictionaryRepresentation
{
  NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
  [mutableDict setValue:self.str forKey:kPREFIXArrobjStr];
  [mutableDict setValue:self.num forKey:kPREFIXArrobjNum];
  [mutableDict setValue:self.flo forKey:kPREFIXArrobjFlo];
  [mutableDict setValue:self.boo forKey:kPREFIXArrobjBoo];
  [mutableDict setValue:self.null forKey:kPREFIXArrobjNull];

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

  self.str = [aDecoder decodeObjectForKey:kPREFIXArrobjStr];
  self.num = [aDecoder decodeObjectForKey:kPREFIXArrobjNum];
  self.flo = [aDecoder decodeObjectForKey:kPREFIXArrobjFlo];
  self.boo = [aDecoder decodeObjectForKey:kPREFIXArrobjBoo];
  self.null = [aDecoder decodeObjectForKey:kPREFIXArrobjNull];

  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:_str forKey:kPREFIXArrobjStr];
  [aCoder encodeObject:_num forKey:kPREFIXArrobjNum];
  [aCoder encodeObject:_flo forKey:kPREFIXArrobjFlo];
  [aCoder encodeObject:_boo forKey:kPREFIXArrobjBoo];
  [aCoder encodeObject:_null forKey:kPREFIXArrobjNull];
}

- (id)copyWithZone:(NSZone *)zone
{
  PREFIXArrobj *copy = [[PREFIXArrobj alloc] init];
  if (copy)
  {
    copy.str = [self.str copyWithZone:zone];
    copy.num = [self.num copyWithZone:zone];
    copy.flo = [self.flo copyWithZone:zone];
    copy.boo = [self.boo copyWithZone:zone];
    copy.null = [self.null copyWithZone:zone];
  }

  return copy;
}

@end
