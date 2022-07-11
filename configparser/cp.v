module configparser // this is the name of the module directory 

import os // needed for handling files 

const (
	kv_separator = `=` // key/values seperator
	mv_separator = `,` // multi-values seperator
	cs_marker = `#` // comment start marker
	sn_start = `[` // section name start marker
	sn_end = `]` // section name end marker
)

// init initializes the module
fn init() {
	// use compilation flag '-cg' to enable debug mode
	$if debug { println("DEBUG debug mode enabled...") }
}

// read_file processes the input file
fn read_file(cfg_file_name string) ?[]string { // reads actually the file if found
	$if debug { println("DEBUG try opening file '$cfg_file_name'") }
	f := os.read_lines(cfg_file_name) or { 
		return error("DEBUG failed to open file")
	}
	$if debug { println("DEBUG file found and opened sucessfully") }
	return f // returns the string array representing the text file
}

// read_config receives the file name and returns a map for saving the configuration
pub fn read_config(cfg_file_name string) map[string][]string {
	mut content := map[string][]string
	file := read_file(cfg_file_name) or { eprintln(err) return content}
	mut sec_begin := false
	mut section_number := 0 // keep track of each section
	mut section_title := "" // string to remember the current section title
	mut tokenized_line := []string {len: 1} // a parsed line will contain a key part and a values part
	for line in file { // go through the lines top down
		trimmed_line := line.trim_space() // remove leading and trailing whitespaces
		if trimmed_line.len == 0 || trimmed_line[0] == cs_marker { continue } // skip empty or comment lines, continue with next line
		sec_begin, section_title, tokenized_line = tokenize_line(trimmed_line, section_title)
		if  sec_begin == true { // new section begins
			section_number++
			continue
		}
		$if debug { println("DEBUG section number and name : $section_number - $section_title") }
		if tokenized_line[0] != "" { content[tokenized_line[0]] = tokenized_line[1..] } // seve the extracted values
		continue // go to next line
	}
	return content
}

// tokenize_line goes through each line which may contain relevant data and extracts keys, section names and matching values
fn tokenize_line(trimmed_line string, section_title string) (bool, string, []string) {
	mut line := []string {len: 1}
	if trimmed_line[0] == sn_start && trimmed_line[trimmed_line.len-1] == sn_end { // begin of a section found
		$if debug { println("DEBUG raw section line: " + trimmed_line) }
		return true, trimmed_line[1..trimmed_line.len-1].trim_space(), line // extract the section name
	} 
	else { // section entered
		mut val_begin, mut val_end := 0, 0 // initialize bounderies for pulling out the substrings
		for i, character in trimmed_line {
			if character == cs_marker {
				val_end = i-1
				line << trimmed_line[val_begin..val_end].trim_space()
				println(line)
				break
			}
			if character == kv_separator {
				val_end = i
				line[0] = trimmed_line[val_begin..val_end].trim_space() // set key
				val_begin = i+1
				line << section_title // add section title as first value
				println(line)
				continue
			}
			if character == mv_separator {
				val_end = i
				line << trimmed_line[val_begin..val_end].trim_space() // add seperated value
				println(line)
				val_begin = i+1
				continue
			}
		}	
	}
	return false, section_title, line // this line was not start of a new section
}