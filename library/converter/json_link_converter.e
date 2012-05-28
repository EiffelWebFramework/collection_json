note
	description: "Summary description for {JSON_LINK_CONVERTER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	JSON_LINK_CONVERTER

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

	object: CJ_LINK

feature -- Conversion

	from_json (j: like to_json): detachable like object
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
			if attached {STRING_32} json.object (j.item (render_key), Void) as l_ucs then
				Result.set_render (l_ucs)
			end
		end

	to_json (o: like object): JSON_OBJECT
		do
			create Result.make
			Result.put (json.value (o.href), href_key)
			Result.put (json.value (o.rel), rel_key)
			Result.put (json.value (o.prompt), prompt_key)
			Result.put (json.value (o.name), name_key)
			Result.put (json.value (o.render), render_key)
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

	render_key: JSON_STRING
		once
			create Result.make_json ("render")
		end

end
