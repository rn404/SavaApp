class Chara < ApplicationRecord
  validates :name, presence: true
  has_many :chara_weapons, dependent: :destroy

  REALITY_STR = ["R", "SR", "SSR"]
  RACE_STR = ["ヒューマン", "エルーン", "ドラフ", "ハーヴィン", "星晶獣", "不明" ]

  REALITY_OF = {
    :R => 0,
    :SR => 1,
    :SSR => 2
  }

  RACE_OF = {
    :HUMAN => 0,
    :ERUNE => 1,
    :DRAPH => 2,
    :HARVIN => 3,
    :PRIMAL => 4,
    :NONE => 5
  }

  class << self

    def race_groups
      race_groups = {}
      RACE_OF.each_value do |val|
        key = RACE_STR[val]
        race_groups[key] = val
      end
      race_groups
    end

    def reality_groups
      reality_groups = {}
      REALITY_OF.each_value do |val|
        key = REALITY_STR[val]
        reality_groups[key] = val
      end
    end

    def reality_type_of(str)
      res = nil
      REALITY_STR.each_index do |idx|
        if str == REALITY_STR[idx]
          res = idx
        end
      end
      res
    end

    def race_type_of(str)
      res = nil
      RACE_STR.each_index do |idx|
        if str == RACE_STR[idx]
          res = idx
        end
      end
      res
    end

  end


  def race_name
    RACE_STR[self.race]
  end

  def reality_name
    REALITY_STR[self.reality]
  end

  def style_name
    Style.name_of(self.style)
  end

  def element_name
    Element.name_of(self.element)
  end

  def weapon_name
    Weapon.name_of(self.weapon)
  end

  def weapons
    weapons = []
    chara_weapons.each do |idx|
      weapons.push weapon_type_of idx
    end
    weapons
  end
end
