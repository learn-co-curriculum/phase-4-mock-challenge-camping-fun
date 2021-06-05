require 'rails_helper'

RSpec.describe Activity, type: :model do

  describe "relationships" do
      
    let(:camper) { Camper.create(name: 'Caitlin', age: 8) }
    let(:activity) { Activity.create(name: 'Archery', difficulty: 2) }

    it 'has many Signups' do
      signup = Signup.create(camper_id: camper.id, activity_id: activity.id, time: 11)

      expect(activity.signups).to include(signup)
    end

    it 'has many Campers through Signups' do
      Signup.create(camper_id: camper.id, activity_id: activity.id, time: 11)

      expect(activity.campers).to include(camper)
    end
  
  end

end
