//Shuffle spawns

for(i = 0; i < spawn_total; i++) {
	var _temp_loc = spawn_loc[i],
		_rand = irandom(spawn_total - 1);
		
	spawn_loc[i] = spawn_loc[_rand];
	spawn_loc[_rand] = _temp_loc;
}