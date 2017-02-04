//
//  main.m
//  ADPower
//
//  Created by chengxc on 2016/10/29.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

//main = UIApplicationMain
/*
  UIApplicationMain 底层做的一些事情
 1. 创建UIApplication 对象（打电话，发短信，设置联网状态，修改状态栏，openurl应用程序间的跳转 ）
 2. UIApplication对象的代理（AppDelegate）
 3. 开启主运行循环（）runloop 
 4. 检查info.plist文件内有没有指定main 如果有加载main.storyboard
 
   加载 main.storyboard
   1. 创建window
   2. 指定window对象的根控制器
   3. 显示window
 */
int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
