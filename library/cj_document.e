note
	description: "Summary description for {CJ_DOCUMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CJ_DOCUMENT
create
	make
feature{NONE} -- Initialization
	make
		do
			create collection.make
		end
feature -- Access		
	collection : CJ_COLLECTION

feature -- Element Change
	set_collection (a_collection : CJ_COLLECTION)
		do
			collection := a_collection
		end
end
