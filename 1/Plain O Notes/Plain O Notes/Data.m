//
//  Data.m
//  Plain O Notes
//
//  Created by Arnoldas on 8/16/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "Data.h"

@implementation Data

static NSMutableDictionary *allNotes;
static NSString *currentKey;


+(NSMutableDictionary *) getAllNotes{
    if(allNotes == nil){
        allNotes = [[NSMutableDictionary alloc] initWithDictionary:
                    [[NSUserDefaults standardUserDefaults] dictionaryForKey:kAllNotes]];
        //allNotes = [[NSMutableDictionary alloc] initWithDictionary:
        //           [NSDictionary dictionaryWithContentsOfFile:[self filePath]]];
    }
    return allNotes;
}

+(void)setCurrentKey:(NSString *)key{
    currentKey = key;
}

+(NSString *)getCurrentKey{
    return currentKey;
}
+(void)setNoteForCurrentKey:(NSString *)note{
    [self setNote:note forKey:currentKey];
}

+(void)setNote:(NSString *)note forKey:(NSString *)key{
    [allNotes setObject:note forKey:key];
}

+(void)removeNoteForKey:(NSString *)key{
    [allNotes removeObjectForKey:key];
}

+(void)saveNotes{
    [[NSUserDefaults standardUserDefaults] setObject:allNotes forKey:kAllNotes];
    //[allNotes writeToFile:[self filePath] atomically:YES];
}

+(NSString *)filePath{
    NSArray *directorys = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documents = [directorys objectAtIndex:0];
    return [documents stringByAppendingPathComponent:kAllNotes];
}

@end
