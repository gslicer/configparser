module main

import configparser as cp

fn main() {
	
	configuration := cp.read_config('test_cp_cfg.ini')

	config_item := "max no of instances"
	println("\nConfiguration query for '$config_item': ")
	println(configuration[config_item])
	println("\nThe whole map: ")

	println(configuration)
}