note
	description: "Summary description for {JSON_ITEM_CONVERTER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	JSON_ITEM_CONVERTER

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

	object: CJ_ITEM

feature -- Conversion

	from_json (j: like to_json): detachable like object
		local
			i: INTEGER
		do
			create Result.make
			if attached {STRING_32} json.object (j.item (href_key), Void) as l_ucs then
				Result.set_href (l_ucs)
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
			if attached {JSON_ARRAY} j.item (links_key) as ja then
				from
					i := 1
				until
					i > ja.count
				loop
					if attached {CJ_LINK} json.object (ja [i], "CJ_LINK") as b then
						Result.add_link (b)
					end
					i := i + 1
				end
			end
		end

	to_json (o: like object): JSON_OBJECT
		do
			create Result.make
			Result.put (json.value (o.href), href_key)
			Result.put (json.value (o.data), data_key)
			Result.put (json.value (o.links), links_key)
		end

feature {NONE} -- Implementation

	href_key: JSON_STRING
		once
			create Result.make_json ("href")
		end

	data_key: JSON_STRING
		once
			create Result.make_json ("data")
		end

	links_key: JSON_STRING
		once
			create Result.make_json ("links")
		end

end
