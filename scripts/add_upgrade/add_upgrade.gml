var _prior = -1;
if (argument_count > 3) {
	_prior = argument[3];
}
upgrade[upgrade_total] = 0;
upgrade_cost[upgrade_total] = argument[0];
upgrade_title[upgrade_total] = argument[1];
upgrade_desc[upgrade_total] = argument[2];
upgrade_prior[upgrade_total] = _prior;
upgrade_total += 1;
