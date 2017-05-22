class Element < ApplicationRecord
  class << self
    def type_of(str)
      Element.find_by(name: str).id rescue nil
    end

    def name_of(id)
      Element.find(id).name rescue nil
    end
  end
end
