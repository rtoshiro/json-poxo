//
//  PREFIXNull.m
//
//  Created by on 
//  Copyright (c) . All rights reserved.
//

#import "PREFIXNull.h"

// Original names

@interface PREFIXNull ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PREFIXNull

+ (PREFIXNull *)modelWithDictionary:(NSDictionary *)dict
{
  PREFIXNull *instance = [[PREFIXNull alloc] initWithDictionary:dict];
  return instance;
}

+ (PREFIXNull *)modelWithString:(NSString *)json
{
  PREFIXNull *instance = [[PREFIXNull alloc] initWithString:json];
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
  }
  return self;
}

- (NSDictionary *)dictionaryRepresentation
{
  NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];

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


  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
}

- (id)copyWithZone:(NSZone *)zone
{
  PREFIXNull *copy = [[PREFIXNull alloc] init];
  if (copy)
  {
  }

  return copy;
}

@end
