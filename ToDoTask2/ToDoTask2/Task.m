//
//  Task.m
//  ToDoTask2
//
//  Created by Arnoldas on 7/11/13.
//  Copyright (c) 2013 moze. All rights reserved.
//

#import "Task.h"

@implementation Task

@synthesize  name = _name;
@synthesize done = _done;

-(id) initWithName:(NSString *)name done:(BOOL)done{
    self = [super init];
    if (self) {
        self.name = name;
        self.done = done;
    }
    return self;
}

@end
