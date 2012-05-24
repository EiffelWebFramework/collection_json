note
	description: "[
		A link shoud contain the following properties hrer(REQUIRED), rel (REQUIRED), name(OPTIONAL)
		render(OPTIONAL), prompt (OPTIONAL).
	]"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CJ_LINK

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

	render: detachable STRING

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

	set_prompt (a_prompt: STRING)
		do
			prompt := a_prompt
		ensure
			prompt_set: prompt ~ a_prompt
		end

	set_name (a_name: STRING)
		do
			name := a_name
		ensure
			name_set: name ~ a_name
		end

	set_render (a_render: STRING)
		do
			render := a_render
		ensure
			render_set: render ~ a_render
		end

end
