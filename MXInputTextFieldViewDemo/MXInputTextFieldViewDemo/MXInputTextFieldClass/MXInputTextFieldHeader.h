//
//  MXInputTextFieldHeader.h
//  MXInputTextFieldViewDemo
//
//  Created by msxf on 2017/6/12.
//  Copyright © 2017年 yellow. All rights reserved.
//

#ifndef MXInputTextFieldHeader_h
#define MXInputTextFieldHeader_h

//title高度
#define MXTitleLabelHeight 20
//icon宽高
#define MXIconWidthAndHeight 20
//动画时长
#define MXAnimationDuration 0.375
//weakSelf & strongSelf
#define MXWeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define MXStrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

#endif /* MXInputTextFieldHeader_h */
