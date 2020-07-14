module main

import configparser as cp

struct General {
mut:
	max_inst []string
	name     []string
}

struct Network {
mut:
	url   []string
	ports []string
	email []string
}

struct UserInterface {
mut:
	dark_mode   []string
	screen_res  []string
	button_size []string
	dpi_scaling []string
}

fn main() {
	// configuration section "Network"
	mut cfg_net := map[string][]string{}
	cfg_net['complexURL'] = ['']
	cfg_net['port_list'] = ['6666,7777']
	cfg_net['email'] = ['']
	cp.read_config_section('test_cp_cfg.ini', 'Network', mut cfg_net)
	mut net := Network{}
	net.url = cfg_net['complexURL']
	net.ports = cfg_net['port_list']
	net.email = cfg_net['email']
	println(net)
	
	// configuration section "General"
	mut cfg_gen := map[string][]string{}
	cfg_gen['max no of instances'] = ['']
	cfg_gen['name'] = ['']
	cp.read_config_section('test_cp_cfg.ini', 'General', mut cfg_gen)
	mut gen := General{}
	gen.max_inst = cfg_gen['max no of instances']
	gen.name = cfg_gen['name']
	println(gen)
	
	// configuration section "User Interface"
	mut cfg_ui := map[string][]string{}
	cfg_ui['dark-mode'] = ['']
	cfg_ui['supported.screen.resolutions'] = ['']
	cfg_ui['button_size'] = ['']
	cfg_ui['DPIscaling'] = ['']
	cp.read_config_section('test_cp_cfg.ini', 'User Interface', mut cfg_ui)
	mut ui := UserInterface{}
	ui.dark_mode = cfg_ui['dark-mode']
	ui.screen_res = cfg_ui['supported.screen.resolutions']
	ui.button_size = cfg_ui['button_size']
	ui.dpi_scaling = cfg_ui['DPIscaling']
	println(ui)

}