note
	description: "Data objects may have three possible properties, name(REQUIRED), value(OPTIONAL), prompt(OPTIONAL)"
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	example: "[
		{
		  "prompt" : STRING,
		  "name" : STRING,
		  "value" : VALUE
		  
		}
	]"

class
	CJ_DATA

create
	make

feature {NONE} -- Initialization

	make
		do
			name := ""
		end

feature -- Access

	name: STRING

	prompt: detachable STRING

	value: detachable STRING
			-- this propertie May contain
			-- one of the following data types, STRING, NUMBER, Boolean(true,false), null

feature -- Element Change

	set_name (a_name: STRING)
		do
			name := a_name
		ensure
			name_set: name ~ a_name
		end

	set_prompt (a_prompt: STRING)
		do
			prompt := a_prompt
		ensure
			prompt_set: prompt ~ a_prompt
		end

	set_value (a_value: STRING)
		do
			value := a_value
		ensure
			value_set: value ~ a_value
		end

end
