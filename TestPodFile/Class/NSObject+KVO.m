//
//  NSObject+KVO.m
//  Hook
//
//  Created by 黄华 on 2018/5/18.
//  Copyright © 2018年 huanghua. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/message.h>

@implementation NSObject (KVO)

- (void)HH_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    
    //动态添加一个类
    NSString *oldClass = NSStringFromClass([self class]);
    
    NSString *newClass = [@"HHKVO_" stringByAppendingString:oldClass];
    
    const char *newName = [newClass UTF8String];
    
//    const char *name = [newClass UTF8String];
//    Class clsssss = objc_allocateClassPair([self class], name, 0);
    
    //定义一个类
    Class kvo_class = objc_allocateClassPair([self class], newName, 0);
    
    //重写set方法
    class_addMethod(kvo_class, @selector(setName:), (IMP)setName, "");
    
    //注册类
    objc_registerClassPair(kvo_class);
    
    //改变 isa 指针指向
    object_setClass(self, kvo_class);
}



void setName(id self,SEL _cmd, NSString *name){
   
    id class = [self class];
    
    //指向父类
    object_setClass(self, class_getSuperclass([self class]));
    
    //objc_msgSend(self ,@selector(setName:),name);
    
    object_setClass(self, class);
}


@end
