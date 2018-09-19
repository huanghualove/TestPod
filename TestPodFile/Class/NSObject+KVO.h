//
//  NSObject+KVO.h
//  Hook
//
//  Created by 黄华 on 2018/5/18.
//  Copyright © 2018年 huanghua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)

- (void)HH_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
