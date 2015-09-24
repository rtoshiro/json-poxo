//
//  Rootclass.m
//
//  Created by on 2015/09/24
//  Copyright (c) 2015. All rights reserved.
//

#import "Rootclass.h"

#import "Special.h"
#import "Arrnull.h"
#import "Obj.h"
#import "Arrobj.h"

// Original names
NSString * const kRootclass_id = @"id";
NSString * const kRootclassStr = @"str";
NSString * const kRootclassNum = @"num";
NSString * const kRootclassFlo = @"flo";
NSString * const kRootclassBoo = @"boo";
NSString * const kRootclassSpecial = @"special";
NSString * const kRootclassArrdouble = @"arrdouble";
NSString * const kRootclassArrnum = @"arrnum";
NSString * const kRootclassArrstr = @"arrstr";
NSString * const kRootclassArrboo = @"arrboo";
NSString * const kRootclassArrnull = @"arrnull";
NSString * const kRootclassObj = @"obj";
NSString * const kRootclassArrobj = @"arrobj";

@interface Rootclass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Rootclass

+ (Rootclass *)modelWithDictionary:(NSDictionary *)dict
{
  Rootclass *instance = [[Rootclass alloc] initWithDictionary:dict];
  return instance;
}

+ (Rootclass *)modelWithString:(NSString *)json
{
  Rootclass *instance = [[Rootclass alloc] initWithString:json];
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
    self._id = [self objectOrNilForKey:kRootclass_id fromDictionary:dict];
    self.str = [self objectOrNilForKey:kRootclassStr fromDictionary:dict];
    self.num = [self objectOrNilForKey:kRootclassNum fromDictionary:dict];
    self.flo = [self objectOrNilForKey:kRootclassFlo fromDictionary:dict];
    self.boo = [self objectOrNilForKey:kRootclassBoo fromDictionary:dict];

    NSObject *objSpecial = [dict objectForKey:kRootclassSpecial];
    if ([objSpecial isKindOfClass:[NSDictionary class]])
    {
      self.special = [Special modelWithDictionary:(NSDictionary *)objSpecial];
    }
    self.arrdouble = [self objectOrNilForKey:kRootclassArrdouble fromDictionary:dict];
    self.arrnum = [self objectOrNilForKey:kRootclassArrnum fromDictionary:dict];
    self.arrstr = [self objectOrNilForKey:kRootclassArrstr fromDictionary:dict];
    self.arrboo = [self objectOrNilForKey:kRootclassArrboo fromDictionary:dict];

    NSObject *objArrnull = [dict objectForKey:kRootclassArrnull];
    if ([objArrnull isKindOfClass:[NSArray class]])
    {
      NSMutableArray *listArrnull = [NSMutableArray array];
      for (NSDictionary *item in (NSArray *)objArrnull) {
        if ([item isKindOfClass:[NSDictionary class]]) {
          [listArrnull addObject:[Arrnull modelWithDictionary:(NSDictionary *)item]];
        }
      }
      self.arrnull = listArrnull;
    }

    NSObject *objObj = [dict objectForKey:kRootclassObj];
    if ([objObj isKindOfClass:[NSDictionary class]])
    {
      self.obj = [Obj modelWithDictionary:(NSDictionary *)objObj];
    }

    NSObject *objArrobj = [dict objectForKey:kRootclassArrobj];
    if ([objArrobj isKindOfClass:[NSArray class]])
    {
      NSMutableArray *listArrobj = [NSMutableArray array];
      for (NSDictionary *item in (NSArray *)objArrobj) {
        if ([item isKindOfClass:[NSDictionary class]]) {
          [listArrobj addObject:[Arrobj modelWithDictionary:(NSDictionary *)item]];
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
  [mutableDict setValue:self._id forKey:kRootclass_id];
  [mutableDict setValue:self.str forKey:kRootclassStr];
  [mutableDict setValue:self.num forKey:kRootclassNum];
  [mutableDict setValue:self.flo forKey:kRootclassFlo];
  [mutableDict setValue:self.boo forKey:kRootclassBoo];
  if ([self.special respondsToSelector:@selector(dictionaryRepresentation)]) {
    [mutableDict setValue:[self.special performSelector:@selector(dictionaryRepresentation)] forKey:kRootclassSpecial];
  } else {
    [mutableDict setValue:self.special forKey:kRootclassSpecial];
  }
  [mutableDict setValue:self.arrdouble forKey:kRootclassArrdouble];
  [mutableDict setValue:self.arrnum forKey:kRootclassArrnum];
  [mutableDict setValue:self.arrstr forKey:kRootclassArrstr];
  [mutableDict setValue:self.arrboo forKey:kRootclassArrboo];
  NSMutableArray *tempArrayArrnull = [NSMutableArray array];
  for (NSObject *subArray in self.arrnull) {
    if ([subArray respondsToSelector:@selector(dictionaryRepresentation)]) {
       [tempArrayArrnull addObject:[subArray performSelector:@selector(dictionaryRepresentation)]];
    } else {
       [tempArrayArrnull addObject:subArray];
    }
  }
  [mutableDict setValue:[NSArray arrayWithArray:tempArrayArrnull] forKey:karrnullArrnull];
  if ([self.obj respondsToSelector:@selector(dictionaryRepresentation)]) {
    [mutableDict setValue:[self.obj performSelector:@selector(dictionaryRepresentation)] forKey:kRootclassObj];
  } else {
    [mutableDict setValue:self.obj forKey:kRootclassObj];
  }
  NSMutableArray *tempArrayArrobj = [NSMutableArray array];
  for (NSObject *subArray in self.arrobj) {
    if ([subArray respondsToSelector:@selector(dictionaryRepresentation)]) {
       [tempArrayArrobj addObject:[subArray performSelector:@selector(dictionaryRepresentation)]];
    } else {
       [tempArrayArrobj addObject:subArray];
    }
  }
  [mutableDict setValue:[NSArray arrayWithArray:tempArrayArrobj] forKey:karrobjArrobj];

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

  self._id = [aDecoder decodeObjectForKey:kRootclass_id];
  self.str = [aDecoder decodeObjectForKey:kRootclassStr];
  self.num = [aDecoder decodeObjectForKey:kRootclassNum];
  self.flo = [aDecoder decodeObjectForKey:kRootclassFlo];
  self.boo = [aDecoder decodeObjectForKey:kRootclassBoo];
  self.special = [aDecoder decodeObjectForKey:kRootclassSpecial];
  self.arrdouble = [aDecoder decodeObjectForKey:kRootclassArrdouble];
  self.arrnum = [aDecoder decodeObjectForKey:kRootclassArrnum];
  self.arrstr = [aDecoder decodeObjectForKey:kRootclassArrstr];
  self.arrboo = [aDecoder decodeObjectForKey:kRootclassArrboo];
  self.arrnull = [aDecoder decodeObjectForKey:kRootclassArrnull];
  self.obj = [aDecoder decodeObjectForKey:kRootclassObj];
  self.arrobj = [aDecoder decodeObjectForKey:kRootclassArrobj];

  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:__id forKey:kRootclass_id];
  [aCoder encodeObject:_str forKey:kRootclassStr];
  [aCoder encodeObject:_num forKey:kRootclassNum];
  [aCoder encodeObject:_flo forKey:kRootclassFlo];
  [aCoder encodeObject:_boo forKey:kRootclassBoo];
  [aCoder encodeObject:_special forKey:kRootclassSpecial];
  [aCoder encodeObject:_arrdouble forKey:kRootclassArrdouble];
  [aCoder encodeObject:_arrnum forKey:kRootclassArrnum];
  [aCoder encodeObject:_arrstr forKey:kRootclassArrstr];
  [aCoder encodeObject:_arrboo forKey:kRootclassArrboo];
  [aCoder encodeObject:_arrnull forKey:kRootclassArrnull];
  [aCoder encodeObject:_obj forKey:kRootclassObj];
  [aCoder encodeObject:_arrobj forKey:kRootclassArrobj];
}

- (id)copyWithZone:(NSZone *)zone
{
  Rootclass *copy = [[Rootclass alloc] init];
  if (copy)
  {
    copy._id = [self._id copyWithZone:zone];
    copy.str = [self.str copyWithZone:zone];
    copy.num = [self.num copyWithZone:zone];
    copy.flo = [self.flo copyWithZone:zone];
    copy.boo = [self.boo copyWithZone:zone];
    copy.special = [self.special copyWithZone:zone];
    copy.arrdouble = [self.arrdouble copyWithZone:zone];
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
