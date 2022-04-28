class SignupSerializer < ActiveModel::Serializer
  attributes :id, :time
  has_one :camper
  has_one :activity
end
