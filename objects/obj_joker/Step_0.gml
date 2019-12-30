/// @description Character Joker move control角色控制

//因为需要每帧检测输入事件，所以一般将角色控制在step事件中完成

//角色左右移动--Date--20170723
if ( keyboard_check(vk_right))
{
	x = x + 1; 	
	image_index -= image_index_speed;
}

if ( keyboard_check(vk_left))
{
	x = x - 1; 	
	image_index -= image_index_speed;
}


//人物跳跃--Date--20170723
if(keyboard_check_pressed(ord("J")) )
{	
	direction = 90;//内置变量，运动方向
	speed = 6;//内置变量，运动速度
	gravity = 0.14;//内置变量，重力
	jump = 1;//跳跃状态变为跳跃中
}


//移动限制--Date--20170723
//设置地平线位置为206
if (x < 16)
{
	x = 16
}

if (x > room_width-16)
{
	x = room_width-16
}

//落地处理--Date--20170725

if ((y + speed > 206) and (jump == 1) and (direction ==270))
{	
	//人物落地表现
	y = 206;
	speed = 0;//速度归0
	gravity = 0;//不受向下的力
	jump = 0; //处于落地状态
	image_index = 0;
	
}