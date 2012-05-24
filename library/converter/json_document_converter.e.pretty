note
	description: "Summary description for {JSON_DOCUMENT_CONVERTER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	JSON_DOCUMENT_CONVERTER

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

	object: CJ_DOCUMENT

feature -- Conversion

	from_json (j: like to_json): detachable like object
		do
			create Result.make
			if attached {CJ_COLLECTION} json.object (j.item (collection_key), "CJ_COLLECTION") as l_ucs then
				Result.set_collection (l_ucs)
			end
		end

	to_json (o: like object): JSON_OBJECT
		do
			create Result.make
			Result.put (json.value (o.collection), collection_key)
		end

feature {NONE} -- Implementation

	collection_key: JSON_STRING
		once
			create Result.make_json ("collection")
		end

end
