class CamperSerializer < ActiveModel::Serializer
  attributes :id, :name, :age
 
  def initialize(object, options = {})
    super(object, options)
    @exclude_activities = options[:exclude_activities]
  end

  has_many :activities, unless: -> { @exclude_activities }
end
