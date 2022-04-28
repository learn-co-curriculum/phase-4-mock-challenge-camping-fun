class CampersActivitiesSerializer < ActiveModel::Serializer
  attributes :id, :name, :age
  has_many :activities
end
