note
	description: "[
		The Error object, contains aditional information on the latest error reported by the SERVER.
		It's an optional object, if it exist, there is only one object of this type. 
	]"
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	example :"[
		{
		 "error":
		 {
		 	"title" : STRING,
		 	"code"  : STRING,
		 	"message" : STRING
		 }
		}
	]"

class
	CJ_ERROR
create
	make

feature {NONE} -- Initialization
	make
		do
			title := ""
			code := ""
			message := ""

		end

feature -- Access
	title : STRING
	code  : STRING
	message : STRING

feature -- Element Change
	set_title (a_title : STRING)
		do
			title := a_title
		ensure
			title_set : title ~ a_title
		end

	set_code (a_code : STRING)
		do
			code := a_code
		ensure
			code_set : code ~ a_code
		end

	set_message (a_message : STRING)
		do
			message := a_message
		ensure
			message_set : message ~ a_message
		end
end
