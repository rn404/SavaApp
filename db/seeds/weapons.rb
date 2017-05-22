# -*- coding: utf-8 -*-
ActiveRecord::Base.connection.execute "TRUNCATE TABLE #{Weapon.table_name};"

Weapon.create(id: 1, name: "短剣")
Weapon.create(id: 2, name: "剣")
Weapon.create(id: 3, name: "槍")
Weapon.create(id: 4, name: "斧")
Weapon.create(id: 5, name: "杖")
Weapon.create(id: 6, name: "銃")
Weapon.create(id: 7, name: "格闘")
Weapon.create(id: 8, name: "弓")
Weapon.create(id: 9, name: "楽器")
Weapon.create(id: 10, name: "刀")

