
//Check your inventory
if (inv_total > 0) {
	for(i = 0; i < control.list_items_total; i++) {
		for(j = 0; j < inv_total; j++) {
			if (scr_find_instance(inv[j]) = control.pickup[control.list_items_num[i]]) {
				control.list_items_col[i] = 1;
				break;
			} else {
			control.list_items_col[i] = 0;
			}
		}
	}
} else {
	for(i = 0; i < inv_max; i++) {
		control.list_items_col[i] = 0;
	}
}