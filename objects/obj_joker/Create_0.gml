/// @description 初始化属性
// You can write your code in this editor

//自定义属性
face = 0;//人物朝向，0=静止，1=向右，-1=向左
jump = 0;//跳跃状态，0=没有跳跃，1=处于跳跃中
dead = 0;//死亡状态，0=没有死亡，1=已经死亡
timer= 0;//计时器
image_index_speed = 0.15;
//内置属性(引擎自带的属性）
image_speed = 0;//使对象的精灵不随时间播放动画，因为这里希望使用代码手动控制