//
//  PREFIXRootclass.m
//
//  Created by on 2015/09/23
//  Copyright (c) 2015. All rights reserved.
//

#import "PREFIXRootclass.h"

#import "Special.h"
#import "Arrnull.h"
#import "Obj.h"
#import "Arrobj.h"

// Original names
NSString * const kPREFIXRootclass_id = @"id";
NSString * const kPREFIXRootclassStr = @"str";
NSString * const kPREFIXRootclassNum = @"num";
NSString * const kPREFIXRootclassFlo = @"flo";
NSString * const kPREFIXRootclassBoo = @"boo";
NSString * const kPREFIXRootclassSpecial = @"special";
NSString * const kPREFIXRootclassArrdouble = @"arrdouble";
NSString * const kPREFIXRootclassArrnum = @"arrnum";
NSString * const kPREFIXRootclassArrstr = @"arrstr";
NSString * const kPREFIXRootclassArrboo = @"arrboo";
NSString * const kPREFIXRootclassArrnull = @"arrnull";
NSString * const kPREFIXRootclassObj = @"obj";
NSString * const kPREFIXRootclassArrobj = @"arrobj";

@interface PREFIXRootclass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PREFIXRootclass

+ (PREFIXRootclass *)modelWithDictionary:(NSDictionary *)dict
{
  PREFIXRootclass *instance = [[PREFIXRootclass alloc] initWithDictionary:dict];
  return instance;
}

+ (PREFIXRootclass *)modelWithString:(NSString *)json
{
  PREFIXRootclass *instance = [[PREFIXRootclass alloc] initWithString:json];
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
    self._id = [self objectOrNilForKey:kPREFIXRootclass_id fromDictionary:dict];
    self.str = [self objectOrNilForKey:kPREFIXRootclassStr fromDictionary:dict];
    self.num = [self objectOrNilForKey:kPREFIXRootclassNum fromDictionary:dict];
    self.flo = [self objectOrNilForKey:kPREFIXRootclassFlo fromDictionary:dict];
    self.boo = [self objectOrNilForKey:kPREFIXRootclassBoo fromDictionary:dict];

    NSObject *objSpecial = [dict objectForKey:kPREFIXRootclassSpecial];
    if ([objSpecial isKindOfClass:[NSDictionary class]])
    {
      self.special = [Special modelWithDictionary:(NSDictionary *)objSpecial];
    }
    self.arrdouble = [self objectOrNilForKey:kPREFIXRootclassArrdouble fromDictionary:dict];
    self.arrnum = [self objectOrNilForKey:kPREFIXRootclassArrnum fromDictionary:dict];
    self.arrstr = [self objectOrNilForKey:kPREFIXRootclassArrstr fromDictionary:dict];
    self.arrboo = [self objectOrNilForKey:kPREFIXRootclassArrboo fromDictionary:dict];

    NSObject *objArrnull = [dict objectForKey:kPREFIXRootclassArrnull];
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

    NSObject *objObj = [dict objectForKey:kPREFIXRootclassObj];
    if ([objObj isKindOfClass:[NSDictionary class]])
    {
      self.obj = [Obj modelWithDictionary:(NSDictionary *)objObj];
    }

    NSObject *objArrobj = [dict objectForKey:kPREFIXRootclassArrobj];
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
  [mutableDict setValue:self._id forKey:kPREFIXRootclass_id];
  [mutableDict setValue:self.str forKey:kPREFIXRootclassStr];
  [mutableDict setValue:self.num forKey:kPREFIXRootclassNum];
  [mutableDict setValue:self.flo forKey:kPREFIXRootclassFlo];
  [mutableDict setValue:self.boo forKey:kPREFIXRootclassBoo];
  if ([self.special respondsToSelector:@selector(dictionaryRepresentation)]) {
    [mutableDict setValue:[self.special performSelector:@selector(dictionaryRepresentation)] forKey:kPREFIXRootclassSpecial];
  } else {
    [mutableDict setValue:self.special forKey:kPREFIXRootclassSpecial];
  }
  [mutableDict setValue:self.arrdouble forKey:kPREFIXRootclassArrdouble];
  [mutableDict setValue:self.arrnum forKey:kPREFIXRootclassArrnum];
  [mutableDict setValue:self.arrstr forKey:kPREFIXRootclassArrstr];
  [mutableDict setValue:self.arrboo forKey:kPREFIXRootclassArrboo];
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
    [mutableDict setValue:[self.obj performSelector:@selector(dictionaryRepresentation)] forKey:kPREFIXRootclassObj];
  } else {
    [mutableDict setValue:self.obj forKey:kPREFIXRootclassObj];
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

  self._id = [aDecoder decodeObjectForKey:kPREFIXRootclass_id];
  self.str = [aDecoder decodeObjectForKey:kPREFIXRootclassStr];
  self.num = [aDecoder decodeObjectForKey:kPREFIXRootclassNum];
  self.flo = [aDecoder decodeObjectForKey:kPREFIXRootclassFlo];
  self.boo = [aDecoder decodeObjectForKey:kPREFIXRootclassBoo];
  self.special = [aDecoder decodeObjectForKey:kPREFIXRootclassSpecial];
  self.arrdouble = [aDecoder decodeObjectForKey:kPREFIXRootclassArrdouble];
  self.arrnum = [aDecoder decodeObjectForKey:kPREFIXRootclassArrnum];
  self.arrstr = [aDecoder decodeObjectForKey:kPREFIXRootclassArrstr];
  self.arrboo = [aDecoder decodeObjectForKey:kPREFIXRootclassArrboo];
  self.arrnull = [aDecoder decodeObjectForKey:kPREFIXRootclassArrnull];
  self.obj = [aDecoder decodeObjectForKey:kPREFIXRootclassObj];
  self.arrobj = [aDecoder decodeObjectForKey:kPREFIXRootclassArrobj];

  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:__id forKey:kPREFIXRootclass_id];
  [aCoder encodeObject:_str forKey:kPREFIXRootclassStr];
  [aCoder encodeObject:_num forKey:kPREFIXRootclassNum];
  [aCoder encodeObject:_flo forKey:kPREFIXRootclassFlo];
  [aCoder encodeObject:_boo forKey:kPREFIXRootclassBoo];
  [aCoder encodeObject:_special forKey:kPREFIXRootclassSpecial];
  [aCoder encodeObject:_arrdouble forKey:kPREFIXRootclassArrdouble];
  [aCoder encodeObject:_arrnum forKey:kPREFIXRootclassArrnum];
  [aCoder encodeObject:_arrstr forKey:kPREFIXRootclassArrstr];
  [aCoder encodeObject:_arrboo forKey:kPREFIXRootclassArrboo];
  [aCoder encodeObject:_arrnull forKey:kPREFIXRootclassArrnull];
  [aCoder encodeObject:_obj forKey:kPREFIXRootclassObj];
  [aCoder encodeObject:_arrobj forKey:kPREFIXRootclassArrobj];
}

- (id)copyWithZone:(NSZone *)zone
{
  PREFIXRootclass *copy = [[PREFIXRootclass alloc] init];
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
