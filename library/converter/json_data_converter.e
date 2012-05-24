note
	description: "A JSON converter for CJ_DATA"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	JSON_DATA_CONVERTER

inherit

	JSON_CONVERTER

create
	make

feature {NONE} -- Initialization

	make
		do
			create object.make
		end

feature -- Access

	object: CJ_DATA

feature -- Conversion

	from_json (j: like to_json): detachable like object
		local
			l_name: detachable STRING_32
			l_prompt: detachable STRING_32
			l_value: detachable STRING_32
		do
			if attached {STRING_32} json.object (j.item (name_key), Void) as l_ucs then
				l_name := l_ucs
			end
			if attached {STRING_32} json.object (j.item (prompt_key), Void) as l_ucs then
				l_prompt := l_ucs
			end
			if attached {STRING_32} json.object (j.item (value_key), Void) as l_ucs then
				l_value := l_ucs
			end
			--|TODO improve this code
			--|is there a better way to write this?
			--|is a good idea create the Result object at the first line and then set the value
			--|if it is attached?
			create Result.make
			if l_name /= Void then
				Result.set_name (l_name)
			end
			if l_prompt /= Void then
				Result.set_prompt (l_prompt)
			end
			if l_value /= Void then
				Result.set_value (l_value)
			end
		end

	to_json (o: like object): JSON_OBJECT
		do
			create Result.make
			Result.put (json.value (o.name), name_key)
			Result.put (json.value (o.prompt), prompt_key)
			Result.put (json.value (o.value), value_key)
		end

feature {NONE} -- Implementation

	prompt_key: JSON_STRING
		once
			create Result.make_json ("prompt")
		end

	name_key: JSON_STRING
		once
			create Result.make_json ("name")
		end

	value_key: JSON_STRING
		once
			create Result.make_json ("value")
		end

end -- class JSON_DATA_CONVERTER
