# configparser

Module for reading plain text INI-like configuration files written in V

CONVENTIONS (for the configuration file format)
- config file name is case sensitive
- lines can be delimited by any combination of LF and CR (for cross OS compatibility)
- file character encoding is unicode
- lines starting with # are treated entirely as comments, anything following a # is treated as a comment
- file must contain at least one or multiple sections
- section names are surrounded by []
- keys and are on the left side of the separator = (they must be unique, not to be overwritten)
- values are on the right side of the seperator =
- section names, keys as well as values are case sensitive and can contain white spaces, outer whitespaces however will be trimmed
- multiple values of the same type belonging to the same key can be separeted by a comma
- section names are always the first value

USAGE
- call the public function having all arguments provided: config file name
- the result is string array map having all values populated which were found in the coniguration file 
- see example .ini file and example test file