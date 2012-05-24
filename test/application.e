note
	description: "HAL application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit

	SHARED_EJSON

create
	make
feature -- Initialization
	make
		do
			print("test data%N")
			test_data
			print("%Ntest error%N")
			test_error
			print("%Ntest link%N")
			test_link
			print("%Ntest template%N")
			test_template
			print("%Ntest item%N")
			test_item
			print("%Ntest queries%N")
			test_queries
			print("%Ntest collection%N")
			test_collection
			print("%Ntest document%N")
			test_document

		end

	test_data
		--{"name" : "full-name", "value" : "", "prompt" : "Full Name"}
		local
			l_data :CJ_DATA
			dc : JSON_DATA_CONVERTER
		do
			create dc.make
			json.add_converter (dc)
			create l_data.make
			l_data.set_name ("full-name")
			l_data.set_value ("test")
			l_data.set_prompt ("Full Name")
			if attached {JSON_VALUE} json.value (l_data) as jv then
				print (jv.representation)
			end
		end


	test_error
		-- {
      	--"title" : "Server Error",
      	--"code" : "X1C2",
      	--"message" : "The server have encountered an error, please wait and try again."
    	--}
		local
			l_error :CJ_ERROR
			ec : JSON_ERROR_CONVERTER
		do
			create ec.make
			json.add_converter (ec)
			create l_error.make
			l_error.set_code ("X1C2")
			l_error.set_message ("The server have encountered an error, please wait and try again.")
			l_error.set_title ("Server Error")
			if attached {JSON_VALUE} json.value (l_error) as jv then
				print (jv.representation)
			end
		end

	test_link
		--{"rel" : "avatar", "href" : "http://examples.org/images/jdoe", "prompt" : "Avatar", "render" : "image"}
		local
			l_link : CJ_LINK
			lc : JSON_LINK_CONVERTER
		do
			create lc.make
			json.add_converter (lc)
			create l_link.make
			l_link.set_href ("http://examples.org/images/jdoe")
			l_link.set_rel ("avatar")
			l_link.set_prompt ("Avatar")
			l_link.set_render ("image")
			if attached {JSON_VALUE} json.value (l_link) as jv then
				print (jv.representation)
			end
		end

	test_template
		--{
     	-- "data" : [
        --{"name" : "full-name", "value" : "", "prompt" : "Full Name"},
        --{"name" : "email", "value" : "", "prompt" : "Email"},
        --{"name" : "blog", "value" : "", "prompt" : "Blog"},
        --{"name" : "avatar", "value" : "", "prompt" : "Avatar"}
    	--]
   		-- }
   		local
   			l_template : CJ_TEMPLATE
   			tc: JSON_TEMPLATE_CONVERTER
   			dc: JSON_DATA_CONVERTER
   		do
   			create dc.make
   			create tc.make
   			json.add_converter (dc)
   			json.add_converter (tc)
   			create l_template.make
			l_template.add_data (data_fixture_factory ("full-name", "", "Full Name"))
			l_template.add_data (data_fixture_factory ("email", "", "Email"))
			l_template.add_data (data_fixture_factory ("blog", "", "Blog"))
			l_template.add_data (data_fixture_factory ("avatar", "", "Avatar"))
			if attached {JSON_VALUE} json.value (l_template) as jv then
				print (jv.representation)
			end

   		end

	test_item
		--      {
		--        "href" : "http://example.org/friends/jdoe",
		--        "data" : [
		--          {"name" : "full-name", "value" : "J. Doe", "prompt" : "Full Name"},
		--          {"name" : "email", "value" : "jdoe@example.org", "prompt" : "Email"}
		--        ],
		--        "links" : [
		--          {"rel" : "blog", "href" : "http://examples.org/blogs/jdoe", "prompt" : "Blog"},
		--          {"rel" : "avatar", "href" : "http://examples.org/images/jdoe", "prompt" : "Avatar", "render" : "image"}
		--        ]
		--      }
		local
			l_item : CJ_ITEM
			dc: JSON_DATA_CONVERTER
			lc: JSON_LINK_CONVERTER
		 	ic: JSON_ITEM_CONVERTER
		do
			create dc.make
			create lc.make
			create ic.make
			json.add_converter (dc)
			json.add_converter (lc)
			json.add_converter (ic)
			create l_item.make
			l_item.set_href ("http://example.org/friends/jdoe")
			l_item.add_data (data_fixture_factory ("full-name", "J. Doe", "Full Name"))
			l_item.add_data (data_fixture_factory ("email", "jdoe@example.org", "Email"))
			l_item.add_link (link_fixture_factory ("http://examples.org/blogs/jdoe", "blog", "Blog",Void,Void))
			l_item.add_link (link_fixture_factory ("http://examples.org/images/jdoe", "avatar", "Avatar", Void, "image"))
			if attached {JSON_VALUE} json.value (l_item) as jv then
				print (jv.representation)
			end

		end

	test_queries
			--		
			--      {"rel" : "search", "href" : "http://example.org/friends/search", "prompt" : "Search",
			--        "data" : [
			--          {"name" : "search", "value" : ""}
			--        ]
			--      }
			--
			local
				dc : JSON_DATA_CONVERTER
				qc : JSON_QUERY_CONVERTER
				l_query : CJ_QUERY
			do
				create dc.make
				create qc.make
				json.add_converter (dc)
				json.add_converter (qc)
				create l_query.make
				l_query.set_href ("http://example.org/friends/search")
				l_query.set_rel ("search")
				l_query.set_prompt ("Search")
				l_query.add_data (data_fixture_factory ("search", "", ""))
				if attached {JSON_VALUE} json.value (l_query) as jv then
					print (jv.representation)
				end
			end

		test_collection
			--		{
			--    "version" : "1.0",
			--    "href" : "http://example.org/friends/",
			--
			--    "links" : [
			--      {"rel" : "feed", "href" : "http://example.org/friends/rss"}
			--    ],
			--
			--    "items" : [
			--      {
			--        "href" : "http://example.org/friends/jdoe",
			--        "data" : [
			--          {"name" : "full-name", "value" : "J. Doe", "prompt" : "Full Name"},
			--          {"name" : "email", "value" : "jdoe@example.org", "prompt" : "Email"}
			--        ],
			--        "links" : [
			--          {"rel" : "blog", "href" : "http://examples.org/blogs/jdoe", "prompt" : "Blog"},
			--          {"rel" : "avatar", "href" : "http://examples.org/images/jdoe", "prompt" : "Avatar", "render" : "image"}
			--        ]
			--      },
			--
			--      {
			--        "href" : "http://example.org/friends/msmith",
			--        "data" : [
			--          {"name" : "full-name", "value" : "M. Smith", "prompt" : "Full Name"},
			--          {"name" : "email", "value" : "msmith@example.org", "prompt" : "Email"}
			--        ],
			--        "links" : [
			--          {"rel" : "blog", "href" : "http://examples.org/blogs/msmith", "prompt" : "Blog"},
			--          {"rel" : "avatar", "href" : "http://examples.org/images/msmith", "prompt" : "Avatar", "render" : "image"}
			--        ]
			--      },
			--
			--      {
			--        "href" : "http://example.org/friends/rwilliams",
			--        "data" : [
			--          {"name" : "full-name", "value" : "R. Williams", "prompt" : "Full Name"},
			--          {"name" : "email", "value" : "rwilliams@example.org", "prompt" : "Email"}
			--        ],
			--        "links" : [
			--          {"rel" : "blog", "href" : "http://examples.org/blogs/rwilliams", "prompt" : "Blog"},
			--          {"rel" : "avatar", "href" : "http://examples.org/images/rwilliams", "prompt" : "Avatar", "render" : "image"}
			--        ]
			--      }
			--    ],
			--
			--    "queries" : [
			--      {"rel" : "search", "href" : "http://example.org/friends/search", "prompt" : "Search",
			--        "data" : [
			--          {"name" : "search", "value" : ""}
			--        ]
			--      }
			--    ],
			--
			--    "template" : {
			--      "data" : [
			--        {"name" : "full-name", "value" : "", "prompt" : "Full Name"},
			--        {"name" : "email", "value" : "", "prompt" : "Email"},
			--        {"name" : "blog", "value" : "", "prompt" : "Blog"},
			--        {"name" : "avatar", "value" : "", "prompt" : "Avatar"}
			--
			--      ]
			--    },
			--
			--    "error" : {
			--          "title" : "Server Error",
			--          "code" : "X1C2",
			--          "message" : "The server have encountered an error, please wait and try again."
			--    }
			--  }
			local
				cc :  JSON_COLLECTION_CONVERTER
				dc :  JSON_DATA_CONVERTER
				ec :  JSON_ERROR_CONVERTER
				ic :  JSON_ITEM_CONVERTER
				qc :  JSON_QUERY_CONVERTER
				tc :  JSON_TEMPLATE_CONVERTER
				lc :  JSON_LINK_CONVERTER
				l_collection : CJ_COLLECTION
				l_item : CJ_ITEM
				l_query : CJ_QUERY
				l_template : CJ_TEMPLATE
				l_error : CJ_ERROR
			do
				create cc.make
				create dc.make
				create ec.make
				create ic.make
				create qc.make
				create tc.make
				create lc.make
				json.add_converter (cc)
				json.add_converter (dc)
				json.add_converter (ec)
				json.add_converter (ic)
				json.add_converter (qc)
				json.add_converter (tc)
				json.add_converter (lc)
				create l_collection.make
				l_collection.set_version ("1.0")
				l_collection.set_href ("http://example.org/friends/")
  				l_collection.add_link (link_fixture_factory ("http://example.org/friends/rss", "feed",Void,Void,Void))

  				-- Add items
  					create l_item.make
					l_item.set_href ("http://example.org/friends/jdoe")
					l_item.add_data (data_fixture_factory ("full-name", "J. Doe", "Full Name"))
					l_item.add_data (data_fixture_factory ("email", "jdoe@example.org", "Email"))
					l_item.add_link (link_fixture_factory ("http://examples.org/blogs/jdoe", "blog", "Blog",Void,Void))
					l_item.add_link (link_fixture_factory ("http://examples.org/images/jdoe", "avatar", "Avatar", Void, "image"))

				l_collection.add_item (l_item)

					create l_item.make
					l_item.set_href ("http://example.org/friends/msmith")
					l_item.add_data (data_fixture_factory ("full-name", "M. Smith", "Full Name"))
					l_item.add_data (data_fixture_factory ("email", "msmith@example.org", "Email"))
					l_item.add_link (link_fixture_factory ("http://examples.org/blogs/msmith", "blog", "Blog",Void,Void))
					l_item.add_link (link_fixture_factory ("http://examples.org/images/msmith", "avatar", "Avatar", Void, "image"))

				l_collection.add_item (l_item)

					create l_item.make
					l_item.set_href ("http://example.org/friends/rwilliams")
					l_item.add_data (data_fixture_factory ("full-name", "R. Williams", "Full Name"))
					l_item.add_data (data_fixture_factory ("email", "rwilliams@example.org", "Email"))
					l_item.add_link (link_fixture_factory ("http://examples.org/blogs/rwilliams", "blog", "Blog",Void,Void))
					l_item.add_link (link_fixture_factory ("http://examples.org/images/rwilliams", "avatar", "Avatar", Void, "image"))

				l_collection.add_item (l_item)


				-- Add Queries
					create l_query.make
					l_query.set_href ("http://example.org/friends/search")
					l_query.set_rel ("search")
					l_query.set_prompt ("Search")
					l_query.add_data (data_fixture_factory ("search", "", ""))

				l_collection.add_query (l_query)

				-- Add templates

					create l_template.make
					l_template.add_data (data_fixture_factory ("full-name", "", "Full Name"))
					l_template.add_data (data_fixture_factory ("email", "", "Email"))
					l_template.add_data (data_fixture_factory ("blog", "", "Blog"))
					l_template.add_data (data_fixture_factory ("avatar", "", "Avatar"))

				l_collection.set_template (l_template)

				--Add Error
					create l_error.make
					l_error.set_code ("X1C2")
					l_error.set_message ("The server have encountered an error, please wait and try again.")
					l_error.set_title ("Server Error")
				l_collection.set_error (l_error)

				if attached {JSON_VALUE} json.value (l_collection) as jv then
					print (jv.representation)
				end

			end


		test_document
			local
				jdc : JSON_DOCUMENT_CONVERTER
				cc :  JSON_COLLECTION_CONVERTER
				dc :  JSON_DATA_CONVERTER
				ec :  JSON_ERROR_CONVERTER
				ic :  JSON_ITEM_CONVERTER
				qc :  JSON_QUERY_CONVERTER
				tc :  JSON_TEMPLATE_CONVERTER
				lc :  JSON_LINK_CONVERTER
				l_collection : CJ_COLLECTION
				l_document   : CJ_DOCUMENT
				l_item : CJ_ITEM
				l_query : CJ_QUERY
				l_template : CJ_TEMPLATE
				l_error : CJ_ERROR
			do
				create jdc.make
				create cc.make
				create dc.make
				create ec.make
				create ic.make
				create qc.make
				create tc.make
				create lc.make
				json.add_converter (jdc)
				json.add_converter (cc)
				json.add_converter (dc)
				json.add_converter (ec)
				json.add_converter (ic)
				json.add_converter (qc)
				json.add_converter (tc)
				json.add_converter (lc)
				create l_collection.make
				l_collection.set_version ("1.0")
				l_collection.set_href ("http://example.org/friends/")
  				l_collection.add_link (link_fixture_factory ("http://example.org/friends/rss", "feed",Void,Void,Void))

  				-- Add items
  					create l_item.make
					l_item.set_href ("http://example.org/friends/jdoe")
					l_item.add_data (data_fixture_factory ("full-name", "J. Doe", "Full Name"))
					l_item.add_data (data_fixture_factory ("email", "jdoe@example.org", "Email"))
					l_item.add_link (link_fixture_factory ("http://examples.org/blogs/jdoe", "blog", "Blog",Void,Void))
					l_item.add_link (link_fixture_factory ("http://examples.org/images/jdoe", "avatar", "Avatar", Void, "image"))

				l_collection.add_item (l_item)

					create l_item.make
					l_item.set_href ("http://example.org/friends/msmith")
					l_item.add_data (data_fixture_factory ("full-name", "M. Smith", "Full Name"))
					l_item.add_data (data_fixture_factory ("email", "msmith@example.org", "Email"))
					l_item.add_link (link_fixture_factory ("http://examples.org/blogs/msmith", "blog", "Blog",Void,Void))
					l_item.add_link (link_fixture_factory ("http://examples.org/images/msmith", "avatar", "Avatar", Void, "image"))

				l_collection.add_item (l_item)

					create l_item.make
					l_item.set_href ("http://example.org/friends/rwilliams")
					l_item.add_data (data_fixture_factory ("full-name", "R. Williams", "Full Name"))
					l_item.add_data (data_fixture_factory ("email", "rwilliams@example.org", "Email"))
					l_item.add_link (link_fixture_factory ("http://examples.org/blogs/rwilliams", "blog", "Blog",Void,Void))
					l_item.add_link (link_fixture_factory ("http://examples.org/images/rwilliams", "avatar", "Avatar", Void, "image"))

				l_collection.add_item (l_item)


				-- Add Queries
					create l_query.make
					l_query.set_href ("http://example.org/friends/search")
					l_query.set_rel ("search")
					l_query.set_prompt ("Search")
					l_query.add_data (data_fixture_factory ("search", "", ""))

				l_collection.add_query (l_query)

				-- Add templates

					create l_template.make
					l_template.add_data (data_fixture_factory ("full-name", "", "Full Name"))
					l_template.add_data (data_fixture_factory ("email", "", "Email"))
					l_template.add_data (data_fixture_factory ("blog", "", "Blog"))
					l_template.add_data (data_fixture_factory ("avatar", "", "Avatar"))

				l_collection.set_template (l_template)

				--Add Error
					create l_error.make
					l_error.set_code ("X1C2")
					l_error.set_message ("The server have encountered an error, please wait and try again.")
					l_error.set_title ("Server Error")
				l_collection.set_error (l_error)

				create l_document.make
				l_document.set_collection(l_collection)

				if attached {JSON_VALUE} json.value (l_document) as jv then
					print (jv.representation)
				end

			end


   	feature {NONE} -- Implementation	
   		data_fixture_factory (  name: STRING; value: STRING; prompt: STRING) : CJ_DATA
   			do
   				create Result.make
				Result.set_name (name)
				Result.set_value (value)
				Result.set_prompt (prompt)
   			end

		link_fixture_factory (  href: STRING; rel: STRING; prompt: detachable STRING; name : detachable STRING; render: detachable STRING) : CJ_LINK
   			do
   				create Result.make
   				Result.set_href (href)
   				Result.set_rel (rel)
   				if attached name as l_name then
   					Result.set_name (l_name)
   				end
   				if attached render  as l_render then
   					Result.set_render (l_render)
   				end
   				if attached prompt as l_prompt then
   					Result.set_prompt (l_prompt)
   				end

   			end



end
