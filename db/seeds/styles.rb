# -*- coding: utf-8 -*-
ActiveRecord::Base.connection.execute "TRUNCATE TABLE #{Style.table_name};"

Style.create(id: 1, name: "バランス")
Style.create(id: 2, name: "攻撃")
Style.create(id: 3, name: "防御")
Style.create(id: 4, name: "回復")
Style.create(id: 5, name: "特殊")

