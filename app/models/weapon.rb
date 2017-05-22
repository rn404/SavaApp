class Weapon < ApplicationRecord
  belongs_to :chara_weapon

  class << self

    def type_of(str)
      Weapon.find_by(name: str).id rescue nil
    end

    def name_of(id)
      Weapon.find(id).name rescue nil
    end

  end

end
