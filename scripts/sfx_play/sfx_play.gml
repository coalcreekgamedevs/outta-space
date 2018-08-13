///@desc
///
var _loop = 0;
if (argument_count > 1) {
	_loop = 1;
}
if (all_sound) {
	audio_play_sound(argument[0], 10, _loop);
}