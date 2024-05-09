require "rails_helper"

describe Trainer, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :pokemons}
  end

  describe "instance methods" do

  end
end
