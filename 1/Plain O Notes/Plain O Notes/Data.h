//
//  Data.h
//  Plain O Notes
//
//  Created by Arnoldas on 8/16/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDefaultText @"New Note"
#define kAllNotes @"notes"
#define kDetailView @"showDetail"

@interface Data : NSObject

+(NSMutableDictionary *) getAllNotes;
+(void)setCurrentKey:(NSString *)key;
+(NSString *)getCurrentKey;
+(void)setNoteForCurrentKey:(NSString *)note;
+(void)setNote:(NSString *)note forKey:(NSString *)key;
+(void)removeNoteForKey:(NSString *)key;
+(void)saveNotes;
+(NSString *)filePath;

@end
