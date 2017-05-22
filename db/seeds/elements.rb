# -*- coding: utf-8 -*-
ActiveRecord::Base.connection.execute "TRUNCATE TABLE #{Element.table_name};"

Element.create(id: 1, name: "火")
Element.create(id: 2, name: "水")
Element.create(id: 3, name: "土")
Element.create(id: 4, name: "風")
Element.create(id: 5, name: "光")
Element.create(id: 6, name: "闇")

