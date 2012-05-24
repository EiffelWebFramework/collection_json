note
	description: "Summary description for {JSON_COLLECTION_CONVERTER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	JSON_COLLECTION_CONVERTER

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

	object: CJ_COLLECTION

feature -- Conversion

	from_json (j: like to_json): detachable like object
		local
			i: INTEGER
		do
			create Result.make
			if attached {STRING_32} json.object (j.item (version_key), Void) as l_ucs then
				Result.set_version (l_ucs)
			else
				Result.set_version ("1.0")
			end
			if attached {STRING_32} json.object (j.item (href_key), Void) as l_ucs then
				Result.set_href (l_ucs)
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
			if attached {JSON_ARRAY} j.item (items_key) as ja then
				from
					i := 1
				until
					i > ja.count
				loop
					if attached {CJ_ITEM} json.object (ja [i], "CJ_ITEM") as b then
						Result.add_item (b)
					end
					i := i + 1
				end
			end
			if attached {JSON_ARRAY} j.item (queries_key) as ja then
				from
					i := 1
				until
					i > ja.count
				loop
					if attached {CJ_QUERY} json.object (ja [i], "CJ_QUERY") as b then
						Result.add_query (b)
					end
					i := i + 1
				end
			end
			if attached {CJ_TEMPLATE} json.object (J.item (template_key), "CJ_TEMPLATE") as b then
				Result.set_template (b)
			end
			if attached {CJ_ERROR} json.object (J.item (error_key), "CJ_ERROR") as b then
				Result.set_error (b)
			end
		end

	to_json (o: like object): JSON_OBJECT
		do
			create Result.make
			Result.put (json.value (o.version), version_key)
			Result.put (json.value (o.href), href_key)
			Result.put (json.value (o.links), links_key)
			Result.put (json.value (o.items), items_key)
			Result.put (json.value (o.queries), queries_key)
			Result.put (json.value (o.template), template_key)
			Result.put (json.value (o.error), error_key)
		end

feature {NONE} -- Implementation

	version_key: JSON_STRING
		once
			create Result.make_json ("version")
		end

	href_key: JSON_STRING
		once
			create Result.make_json ("href")
		end

	links_key: JSON_STRING
		once
			create Result.make_json ("links")
		end

	items_key: JSON_STRING
		once
			create Result.make_json ("items")
		end

	queries_key: JSON_STRING
		once
			create Result.make_json ("queries")
		end

	template_key: JSON_STRING
		once
			create Result.make_json ("template")
		end

	error_key: JSON_STRING
		once
			create Result.make_json ("error")
		end

end
