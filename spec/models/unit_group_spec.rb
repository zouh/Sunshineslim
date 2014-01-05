require 'spec_helper'

describe UnitGroup do

  before { @unit_group = UnitGroup.new(code:"weight", name: "重量") }

  subject { @unit_group }

  it { should respond_to(:code) }
  it { should respond_to(:name) }
  it { should respond_to(:units) }

  it { should be_valid }

  describe "with blank code" do
    before { @unit_group.code = " " }
    it { should_not be_valid }
  end

  describe "with code that is too long" do
    before { @unit_group.code = "a" * 21 }
    it { should_not be_valid }
  end

  describe "when code is already taken" do
    before do
      unit_group_with_same_code = @unit_group.dup
      unit_group_with_same_code.code = @unit_group.code.upcase
      unit_group_with_same_code.save
    end

    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @unit_group.name = " " }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @unit_group.name = "a" * 51 }
    it { should_not be_valid }
  end

end