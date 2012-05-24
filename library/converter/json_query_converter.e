note
	description: "A JSON CONVERTER for CJ_QUERY"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	JSON_QUERY_CONVERTER

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

	object: CJ_QUERY

feature -- Conversion

	from_json (j: like to_json): detachable like object
		local
			i: INTEGER
		do
			create Result.make
			if attached {STRING_32} json.object (j.item (href_key), Void) as l_ucs then
				Result.set_href (l_ucs)
			end
			if attached {STRING_32} json.object (j.item (rel_key), Void) as l_ucs then
				Result.set_rel (l_ucs)
			end
			if attached {STRING_32} json.object (j.item (name_key), Void) as l_ucs then
				Result.set_name (l_ucs)
			end
			if attached {STRING_32} json.object (j.item (prompt_key), Void) as l_ucs then
				Result.set_prompt (l_ucs)
			end
			if attached {JSON_ARRAY} j.item (data_key) as ja then
				from
					i := 1
				until
					i > ja.count
				loop
					if attached {CJ_DATA} json.object (ja [i], "CJ_DATA") as b then
						Result.add_data (b)
					end
					i := i + 1
				end
			end
		end

	to_json (o: like object): JSON_OBJECT
		do
			create Result.make
			Result.put (json.value (o.href), href_key)
			Result.put (json.value (o.rel), rel_key)
			Result.put (json.value (o.prompt), prompt_key)
			Result.put (json.value (o.name), name_key)
			Result.put (json.value (o.data), data_key)
		end

feature {NONE} -- Implementation

	href_key: JSON_STRING
		once
			create Result.make_json ("href")
		end

	rel_key: JSON_STRING
		once
			create Result.make_json ("rel")
		end

	prompt_key: JSON_STRING
		once
			create Result.make_json ("prompt")
		end

	name_key: JSON_STRING
		once
			create Result.make_json ("name")
		end

	data_key: JSON_STRING
		once
			create Result.make_json ("data")
		end

end
