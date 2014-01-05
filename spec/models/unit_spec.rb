require 'spec_helper'

describe Unit do

  let(:unit_group) { FactoryGirl.create(:unit_group) }
  before { @unit = unit_group.units.build(code:"g", name: "克") }

  subject { @unit }

  it { should respond_to(:code) }
  it { should respond_to(:name) }
  it { should respond_to(:unit_group_id) }
  it { should respond_to(:unit_group) }
  its(:unit_group) { should eq unit_group }

  it { should be_valid }

  describe "when unit_group_id is not present" do
    before { @unit.unit_group_id = nil }
    it { should_not be_valid }
  end

  describe "with blank code" do
    before { @unit.code = " " }
    it { should_not be_valid }
  end

  describe "with code that is too long" do
    before { @unit.code = "a" * 21 }
    it { should_not be_valid }
  end

  describe "when code is already taken" do
    before do
      unit_with_same_code = @unit.dup
      unit_with_same_code.save
    end

    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @unit.name = " " }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @unit.name = "a" * 51 }
    it { should_not be_valid }
  end

end
