//
//  RootClass.m
//
//  Created by on 
//  Copyright (c) . All rights reserved.
//

#import "RootClass.h"

// Original names
NSString * const k_id = @"id";
NSString * const kStr = @"str";
NSString * const kNum = @"num";
NSString * const kFlo = @"flo";
NSString * const kBoo = @"boo";
NSString * const kArrnum = @"arrnum";
NSString * const kArrstr = @"arrstr";
NSString * const kArrboo = @"arrboo";
NSString * const kArrnull = @"arrnull";
NSString * const kObj = @"obj";
NSString * const kArrobj = @"arrobj";

@interface RootClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RootClass

+ (RootClass *)modelWithDictionary:(NSDictionary *)dict
{
  RootClass *instance = [[RootClass alloc] initWithDictionary:dict];
  return instance;
}

+ (RootClass *)modelWithString:(NSString *)json
{
  RootClass *instance = [[RootClass alloc] initWithString:json];
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
    self._id = [self objectOrNilForKey:k_id fromDictionary:dict];
    self.str = [self objectOrNilForKey:kStr fromDictionary:dict];
    self.num = [self objectOrNilForKey:kNum fromDictionary:dict];
    self.flo = [self objectOrNilForKey:kFlo fromDictionary:dict];
    self.boo = [self objectOrNilForKey:kBoo fromDictionary:dict];
    self.arrnum = [self objectOrNilForKey:kArrnum fromDictionary:dict];
    self.arrstr = [self objectOrNilForKey:kArrstr fromDictionary:dict];
    self.arrboo = [self objectOrNilForKey:kArrboo fromDictionary:dict];

    NSObject *objArrnull = [dict objectForKey:kArrnull];
    if ([objArrnull isKindOfClass:[NSArray class]])
    {
      NSMutableArray *listArrnull = [NSMutableArray array];
      for (NSDictionary *item in (NSArray *)objArrnull) {
        if ([item isKindOfClass:[NSDictionary class]]) {
          [listArrnull addObject:[Arrnull modelObjectWithDictionary:item]];
        }
      }
      self.arrnull = listArrnull;
    }

    NSObject *objObj = [dict objectForKey:kObj];
    if ([objObj isKindOfClass:[NSDictionary class]])
    {
      self.obj = [Obj modelObjectWithDictionary:objObj];
    }

    NSObject *objArrobj = [dict objectForKey:kArrobj];
    if ([objArrobj isKindOfClass:[NSArray class]])
    {
      NSMutableArray *listArrobj = [NSMutableArray array];
      for (NSDictionary *item in (NSArray *)objArrobj) {
        if ([item isKindOfClass:[NSDictionary class]]) {
          [listArrobj addObject:[Arrobj modelObjectWithDictionary:item]];
        }
      }
      self.arrobj = listArrobj;
    }
  }
  return self;
}

- (NSDictionary *)dictionaryRepresentation
{
  NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
  [mutableDict setValue:self._id forKey:k_id];
  [mutableDict setValue:self.str forKey:kStr];
  [mutableDict setValue:self.num forKey:kNum];
  [mutableDict setValue:self.flo forKey:kFlo];
  [mutableDict setValue:self.boo forKey:kBoo];
  [mutableDict setValue:self.arrnum forKey:kArrnum];
  [mutableDict setValue:self.arrstr forKey:kArrstr];
  [mutableDict setValue:self.arrboo forKey:kArrboo];
  NSMutableArray *tempArrayArrnull = [NSMutableArray array];
  for (NSObject *subArray in self.arrnull) {
    if ([subArray respondsToSelector:@selector(dictionaryRepresentation)]) {
       [tempArrayArrnull addObject:[subArray performSelector:@selector(dictionaryRepresentation)]];
    } else {
       [tempArrayArrnull addObject:subArray];
    }
  }
  [mutableDict setValue:[NSArray arrayWithArray:tempArrayArrnull] forKey:kArrnull];
  if ([self.obj respondsToSelector:@selector(dictionaryRepresentation)]) {
    [mutableDict setValue:[self.obj performSelector:@selector(dictionaryRepresentation)] forKey:kObj];
  } else {
    [mutableDict setValue:self.obj forKey:kObj];
  }
  NSMutableArray *tempArrayArrobj = [NSMutableArray array];
  for (NSObject *subArray in self.arrobj) {
    if ([subArray respondsToSelector:@selector(dictionaryRepresentation)]) {
       [tempArrayArrobj addObject:[subArray performSelector:@selector(dictionaryRepresentation)]];
    } else {
       [tempArrayArrobj addObject:subArray];
    }
  }
  [mutableDict setValue:[NSArray arrayWithArray:tempArrayArrobj] forKey:kArrobj];

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

  self._id = [aDecoder decodeObjectForKey:k_id];
  self.str = [aDecoder decodeObjectForKey:kStr];
  self.num = [aDecoder decodeObjectForKey:kNum];
  self.flo = [aDecoder decodeObjectForKey:kFlo];
  self.boo = [aDecoder decodeObjectForKey:kBoo];
  self.arrnum = [aDecoder decodeObjectForKey:kArrnum];
  self.arrstr = [aDecoder decodeObjectForKey:kArrstr];
  self.arrboo = [aDecoder decodeObjectForKey:kArrboo];
  self.arrnull = [aDecoder decodeObjectForKey:kArrnull];
  self.obj = [aDecoder decodeObjectForKey:kObj];
  self.arrobj = [aDecoder decodeObjectForKey:kArrobj];

  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:__id forKey:k_id];
  [aCoder encodeObject:_str forKey:kStr];
  [aCoder encodeObject:_num forKey:kNum];
  [aCoder encodeObject:_flo forKey:kFlo];
  [aCoder encodeObject:_boo forKey:kBoo];
  [aCoder encodeObject:_arrnum forKey:kArrnum];
  [aCoder encodeObject:_arrstr forKey:kArrstr];
  [aCoder encodeObject:_arrboo forKey:kArrboo];
  [aCoder encodeObject:_arrnull forKey:kArrnull];
  [aCoder encodeObject:_obj forKey:kObj];
  [aCoder encodeObject:_arrobj forKey:kArrobj];
}

- (id)copyWithZone:(NSZone *)zone
{
  RootClass *copy = [[RootClass alloc] init];
  if (copy)
  {
    copy._id = [self._id copyWithZone:zone];
    copy.str = [self.str copyWithZone:zone];
    copy.num = [self.num copyWithZone:zone];
    copy.flo = [self.flo copyWithZone:zone];
    copy.boo = [self.boo copyWithZone:zone];
    copy.arrnum = [self.arrnum copyWithZone:zone];
    copy.arrstr = [self.arrstr copyWithZone:zone];
    copy.arrboo = [self.arrboo copyWithZone:zone];
    copy.arrnull = [self.arrnull copyWithZone:zone];
    copy.obj = [self.obj copyWithZone:zone];
    copy.arrobj = [self.arrobj copyWithZone:zone];
  }

  return copy;
}

@end
