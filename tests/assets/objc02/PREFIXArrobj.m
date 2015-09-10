//
//  PREFIXArrobj.m
//
//  Created by on 
//  Copyright (c) . All rights reserved.
//

#import "PREFIXArrobj.h"

// Original names
NSString * const kStr = @"str";
NSString * const kNum = @"num";
NSString * const kFlo = @"flo";
NSString * const kBoo = @"boo";
NSString * const kNull = @"null";

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
    self.str = [self objectOrNilForKey:kStr fromDictionary:dict];
    self.num = [self objectOrNilForKey:kNum fromDictionary:dict];
    self.flo = [self objectOrNilForKey:kFlo fromDictionary:dict];
    self.boo = [self objectOrNilForKey:kBoo fromDictionary:dict];

    NSObject *objNull = [dict objectForKey:kNull];
    if ([objNull isKindOfClass:[NSDictionary class]])
    {
      self.null = [Null modelObjectWithDictionary:objNull];
    }
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
  if ([self.null respondsToSelector:@selector(dictionaryRepresentation)]) {
    [mutableDict setValue:[self.null performSelector:@selector(dictionaryRepresentation)] forKey:kNull];
  } else {
    [mutableDict setValue:self.null forKey:kNull];
  }

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
  self.null = [aDecoder decodeObjectForKey:kNull];

  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:_str forKey:kStr];
  [aCoder encodeObject:_num forKey:kNum];
  [aCoder encodeObject:_flo forKey:kFlo];
  [aCoder encodeObject:_boo forKey:kBoo];
  [aCoder encodeObject:_null forKey:kNull];
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
