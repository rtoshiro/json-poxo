//
//  PREFIXObj.m
//
//  Created by on 2015/09/19
//  Copyright (c) 2015. All rights reserved.
//

#import "PREFIXObj.h"


// Original names
NSString * const kPREFIXObjStr = @"str";
NSString * const kPREFIXObjNum = @"num";
NSString * const kPREFIXObjFlo = @"flo";
NSString * const kPREFIXObjBoo = @"boo";

@interface PREFIXObj ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PREFIXObj

+ (PREFIXObj *)modelWithDictionary:(NSDictionary *)dict
{
  PREFIXObj *instance = [[PREFIXObj alloc] initWithDictionary:dict];
  return instance;
}

+ (PREFIXObj *)modelWithString:(NSString *)json
{
  PREFIXObj *instance = [[PREFIXObj alloc] initWithString:json];
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
    self.str = [self objectOrNilForKey:kPREFIXObjStr fromDictionary:dict];
    self.num = [self objectOrNilForKey:kPREFIXObjNum fromDictionary:dict];
    self.flo = [self objectOrNilForKey:kPREFIXObjFlo fromDictionary:dict];
    self.boo = [self objectOrNilForKey:kPREFIXObjBoo fromDictionary:dict];
  }
  return self;
}

- (NSDictionary *)dictionaryRepresentation
{
  NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
  [mutableDict setValue:self.str forKey:kPREFIXObjStr];
  [mutableDict setValue:self.num forKey:kPREFIXObjNum];
  [mutableDict setValue:self.flo forKey:kPREFIXObjFlo];
  [mutableDict setValue:self.boo forKey:kPREFIXObjBoo];

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

  self.str = [aDecoder decodeObjectForKey:kPREFIXObjStr];
  self.num = [aDecoder decodeObjectForKey:kPREFIXObjNum];
  self.flo = [aDecoder decodeObjectForKey:kPREFIXObjFlo];
  self.boo = [aDecoder decodeObjectForKey:kPREFIXObjBoo];

  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:_str forKey:kPREFIXObjStr];
  [aCoder encodeObject:_num forKey:kPREFIXObjNum];
  [aCoder encodeObject:_flo forKey:kPREFIXObjFlo];
  [aCoder encodeObject:_boo forKey:kPREFIXObjBoo];
}

- (id)copyWithZone:(NSZone *)zone
{
  PREFIXObj *copy = [[PREFIXObj alloc] init];
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
