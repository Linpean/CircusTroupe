/// @description Character Joker move control角色控制

//因为需要每帧检测输入事件，所以一般将角色控制在step事件中完成

//角色左右移动--Date--20170723
//死亡状态--Date--20170725
if (dead == 1)
{
	sprite_index = spr_charater_joker_dead;
	speed = 0;
	gravity = 0;
	//如果角色处于死亡状态，将它的精灵索引改为角色死亡精灵,速度和重力加速度都归0，然后在控制器内停止火圈移动

	if(timer == 24)
	{
		audio_play_sound(snd_Lose,10,false);
		//在24帧时播放失败音效
	}
	if(timer ==100)
	{
		game_restart();
		//游戏重=重新开始
	}
	timer +=1;
	exit;
	//step事件的代码，从exit处后面的所有代码都将跳过并不再执行
}

if (jump == 0)
{	
	
	{//角色左右移动--Date--20170723
		if ( keyboard_check(vk_right))
		{
			x = x + 1; 	
			image_index -= image_index_speed;
			face = 1;//向右
		}

		else if ( keyboard_check(vk_left))
		{
			x = x - 1; 	
			image_index -= image_index_speed;
			face = -1;//向左
		}
	
		else
		{
			face = 0;
			//为0，即在非跳跃状态，左右移动会设置一个向左还是向右的朝向
			//注意代码的顺序，是每帧都根据玩家的输入来设置一个朝向，然后才来执行跳跃或者不跳跃
			//所以只要在左右移动时按下了跳跃按键，都会朝着当前的左右运动方向进行跳跃 
		}
	}
	
	//人物跳跃--Date--20170723
	if(keyboard_check_pressed(ord("J")) )
	{	
		direction = 90;//内置变量，运动方向
		speed = 3.8;//内置变量，运动速度
		gravity = 0.14;//内置变量，重力
		jump = 1;//跳跃状态变为跳跃中
		image_index = 1;
		audio_play_sound(snd_Jump,10,false);
	}

	
}

if (jump == 1)
{	
	x += face;
	//如果是跳跃状态下，玩家不能通过按键来控制人物的移动，只能通过face来控制
	//如果face = 0就不变，如果face=1就向右移动，如果face=-1就向左移动
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