
with(par_pickup) {
	instance_destroy();
}


list_items_total = inv_max;
for(i = 0; i < list_items_total; i++) {
	list_items_num[i] = median(0 + median(0, (difficulty - 4), 6), (irandom(difficulty + 4)), 14);
	}

scr_shuffle_spawns();


spawns_hit = 0;
for(i = 0; i < list_items_total; i++) {
	repeat(2) {
		instance_create_depth(spawn_loc[spawns_hit].x - (spawn_loc[spawns_hit].sprite_width / 2) + irandom(spawn_loc[spawns_hit].sprite_width), spawn_loc[spawns_hit].y, -100, pickup[list_items_num[i]]);
		spawns_hit += 1;
		}
	}
	

for(i = 0; i < spawn_total; i++) {
	repeat(1 + irandom(3)) {
		instance_create_depth(spawn_loc[i].x - (spawn_loc[i].sprite_width / 2) + irandom(spawn_loc[i].sprite_width), spawn_loc[i].y, -100, pickup[irandom(14)]);
	}
	repeat(irandom(10)) {
		instance_create_depth(spawn_loc[i].x - (spawn_loc[i].sprite_width / 2) + irandom(spawn_loc[i].sprite_width), spawn_loc[i].y, -100, obj_rock);
	}
}
