require 'spec_helper'

describe NutritionFact do

  let(:user) { FactoryGirl.create(:user) }
  let(:unit) { FactoryGirl.create(:unit) }
  before do
    @nutrition_fact = user.nutrition_facts.build(code: "6924187821989", name: "洽洽原味瓜子", 		
    									size_unit_id: 1, size: 285.0, 
    									serving_size: 100, servings: 2.85, 
    									energy: 2557.0, energy_percent: 30,
    									protein: 27.4, protein_percent: 46,
    									fat: 51.8, fat_percent: 86,
    									carbohydrate: 15.8, carbohydrate_percent: 5,
    									sodium: 8.0, sodium_percent: 0,
    									created_by: user.id, updated_by: user.id)
  end

  subject { @nutrition_fact }

  it { should respond_to(:code) }
  it { should respond_to(:name) }
  it { should respond_to(:size_unit_id) }
  it { should respond_to(:size_unit) }
  it { should respond_to(:size) }
  it { should respond_to(:serving_size) }
  it { should respond_to(:servings) }
  it { should respond_to(:energy_percent) }
  it { should respond_to(:protein) }
  it { should respond_to(:protein_percent) }
  it { should respond_to(:fat) }
  it { should respond_to(:fat_percent) }
  it { should respond_to(:carbohydrate) }
  it { should respond_to(:carbohydrate_percent) }
  it { should respond_to(:sodium) }
  it { should respond_to(:sodium_percent) }
  it { should respond_to(:created_by) }
  it { should respond_to(:updated_by) }
  it { should respond_to(:created_by_user) }
  it { should respond_to(:updated_by_user) }

  its(:size_unit) { should eq unit }
  its(:created_by_user) { should eq user }
  its(:updated_by_user) { should eq user }

  it { should be_valid }

  describe "when created_by is not present" do
    before { @nutrition_fact.created_by_user = nil }
    it { should_not be_valid }
  end

  describe "with blank code" do
    before { @nutrition_fact.code = " " }
    it { should_not be_valid }
  end

  describe "with code that is too long" do
    before { @nutrition_fact.code = "a" * 21 }
    it { should_not be_valid }
  end

  describe "when code is already taken" do
    before do
      nutrition_fact_with_same_code = @nutrition_fact.dup
      nutrition_fact_with_same_code.code = @nutrition_fact.code.upcase
      nutrition_fact_with_same_code.save
    end

    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @nutrition_fact.name = " " }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @nutrition_fact.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "with size less than or equal to zero" do
    before {@nutrition_fact.size = -1.0} 
    it { should_not be_valid }
  end

  describe "with serving_size less than or equal to zero" do
    before {@nutrition_fact.serving_size = 0.0}
    it { should_not be_valid }
  end

  describe "with size less than or equal to zero" do
    before {@nutrition_fact.servings = -1.0} 
    it { should_not be_valid }
  end

  describe "with energy less than zero" do
    before { @nutrition_fact.energy = -1.0 }
    it { should_not be_valid }
  end

  describe "with energy_percent less than zero" do
    before { @nutrition_fact.energy_percent = -1.0 }
    it { should_not be_valid }
  end

  describe "with energy_percent is float" do
    before { @nutrition_fact.energy_percent = 1.1 }
    it { should_not be_valid }
  end

end
