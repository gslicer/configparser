module main

import configparser as cp

fn main() {
	
	configuration := cp.read_config('test_cp_cfg.ini')

	println("Map content: ")
	print(configuration)

	println("\n\nConfiguration query for 'illegal key': ")
	println(configuration['illegal key'])
}