# configparser

V module for reading plain text INI-like configuration files

CONVENTIONS (for the file format)
- config file name is case sensitive
- file can be delimited by any combination of LF and CR (for cross OS compatibility)
- file character encoding is ASCII or UTF-8
- lines starting with # are treated entirely as comments, anything following a # is treated as a comment
- file can contain one or multiple sections
- section names are surrounded by [], white spaces are allowed but not encouraged
- keys are on the left side of the separator = on the right side are the values
- keys as well as values are case sensitive and can contain white spaces, outer whitespaces however will be trimmed
- multiple values of the same type belonging to the same key can be separeted by a ,

USAGE (from V)
- create a string map of string-arrayw: map[string][]string{} for each section having the keys set (and empty or default) values
- call the public function having all arguments provided: config file name, section name, the map
- the result is the same map having all values populated, which were found in the coniguration file 
