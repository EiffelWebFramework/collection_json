note
	description: "Summary description for {CJ_QUERY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	example: "[
		{
			""href": URI,
			"rel": STRING,
			"prompt": STRING,
			"name": STRING
			"data : [ARRAY]
		}
	]"

class
	CJ_QUERY

create
	make

feature {NONE} -- Initialization

	make
		do
			href := ""
			rel := ""
		end

feature -- Access

	href: STRING

	rel: STRING

	prompt: detachable STRING

	name: detachable STRING

	data: detachable LINKED_LIST [CJ_DATA]

feature -- Element Change

	set_href (a_href: STRING)
		do
			href := a_href
		ensure
			href_set: href ~ a_href
		end

	set_rel (a_rel: STRING)
		do
			rel := a_rel
		ensure
			rel_set: rel ~ a_rel
		end

	set_name (a_name: STRING)
		do
			name := a_name
		ensure
			name_set: name ~ a_name
		end

	add_data (a_data: CJ_DATA)
		local
			l_data: like data
		do
			l_data := data
			if l_data = Void then
				create l_data.make
				data := l_data
			end
			l_data.force (a_data)
		end

end
