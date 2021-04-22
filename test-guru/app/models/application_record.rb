class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.seed_create(*a)
    array = []
    a.each do |atributes|
      array.push(self.find_or_create_by!(atributes))
    end
    return array
  end
end
