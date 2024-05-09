require "rails_helper"

describe Pokemon, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it {should belong_to :trainer}
  end

  describe "instance methods" do
    
  end
end