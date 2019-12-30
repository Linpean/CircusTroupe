/// @description Insert description here
// You can write your code in this editor
timer += 1;
if(timer * 0.25 > 100 && irandom(100)<2 && obj_joker.dead ==0)
{
	//当timer经过400个step后，如果1个step=1帧，那么60帧=1秒
	//即当经过6秒多点，并且随机数小于2时，创建一个新的火圈实例
	//timer * 0.25 > 100设定两个火圈的最少的间隔，然后的irandom可以在这个基础上，增加一些间隔距离
	instance_create_depth(room_width + 16,97,1,obj_fire);
	//将背景层火圈的深度值设定为1
	timer = 0;//在创建一次火圈后，将timer重新归0，再次进行计时
}