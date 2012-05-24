note
	description: "[
				The Collection Object contains all the records in the representations. This is a required object.
				Should have a version property. The value MUST be set to 1.0, if there is no version property present
				set it to 1.0.
				Should have an href property, it should contain a valid URI
	]"
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	example: "[
		{
			"collection":
			{
			 "version":1.0,
			 "href":URI,
			 "links": [ARRAY],
			 "items": [ARRAY],
			 "queries":[ARRAY],
			 "template":{OBJECT},
			 "error":{OBJECT}
			}
		}
	]"

class
	CJ_COLLECTION

create
	make

feature {NONE} -- Initialization

	make
		do
			version := ""
			href := ""
		end

feature -- Access

	version: STRING
			-- The value should be set to 1.0

	href: STRING
			-- Must contain a valid URI

	links: detachable LINKED_LIST [CJ_LINK]
			-- may have a links array

	items: detachable LINKED_LIST [CJ_ITEM]
			-- may have an items array

	queries: detachable LINKED_LIST [CJ_QUERY]
			-- may have a queries array

	template: detachable CJ_TEMPLATE
			-- may have a template object

	error: detachable CJ_ERROR
			-- may have an error object

feature -- Element Change

	set_version (a_version: STRING)
		do
			version := a_version
		ensure
			version_set: version ~ a_version
		end

	set_href (a_href: STRING)
		do
			href := a_href
		ensure
			href_set: href ~ a_href
		end

	add_link (a_link: CJ_LINK)
		local
			l_links: like links
		do
			l_links := links
			if l_links = Void then
				create l_links.make
				links := l_links
			end
			l_links.force (a_link)
		end

	add_item (a_item: CJ_ITEM)
		local
			l_items: like items
		do
			l_items := items
			if l_items = Void then
				create l_items.make
				items := l_items
			end
			l_items.force (a_item)
		end

	add_query (a_query: CJ_QUERY)
		local
			l_queries: like queries
		do
			l_queries := queries
			if l_queries = Void then
				create l_queries.make
				queries := l_queries
			end
			l_queries.force (a_query)
		end

	set_template (a_template: CJ_TEMPLATE)
		do
			template := a_template
		end

	set_error (an_error: CJ_ERROR)
		do
			error := an_error
		end

end
