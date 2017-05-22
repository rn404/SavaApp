class Style < ApplicationRecord
  class << self
    def type_of(str)
      Style.find_by(name: str).id rescue nil
    end

    def name_of(id)
      Style.find(id).name rescue nil
    end
  end
end
