/// @description Character Create
//  在控制器所在的房间内，创建一个实例
instance_create_depth(32,206,0,obj_joker);

timer = 100;//创建计时器

backsound = audio_emitter_create();
audio_play_sound_on(backsound, snd_Background, 11, true);