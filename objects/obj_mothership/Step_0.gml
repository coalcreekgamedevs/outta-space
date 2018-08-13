/// @description Insert description here
// You can write your code in this editor
if (control.dock) {
	hoob_index += hoob_spd;
	if (hoob_index >= 4) {
		hoob_index = 0;
	}
	hoob_pos = median(0, hoob_pos + ((1.1 - hoob_pos) * 0.1), 1);
} else {
	hoob_pos = median(0, hoob_pos - ((0.1 + hoob_pos) * 0.1), 1);
}