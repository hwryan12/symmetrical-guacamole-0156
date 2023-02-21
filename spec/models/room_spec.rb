require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it {should belong_to :hotel}
    it {should have_many :guest_rooms}
    it {should have_many(:guests).through(:guest_rooms)}
  end

  describe "class methods" do
    let!(:king) { Room.create!(rate: 125, suite: "King Bed Room") }
    let!(:jimmy) { Guest.create!(name: "Jimmy", nights: 3) }
    let!(:naomi) { Guest.create!(name: "Naomi", nights: 2) }
    
    before do
      GuestRoom.create!(guest: jimmy, room: king)
      GuestRoom.create!(guest: naomi, room: king)
    end

    describe "#guest_count" do
      it "returns the total amount of guest that have stayed in that room" do
        expect(king.guest_count).to eq(2)
      end
    end
  end
end 