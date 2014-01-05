require 'spec_helper'

describe "Nutrition fact pages" do

  subject { page }

  let(:admin) { FactoryGirl.create(:admin) }
  before do
    sign_in admin
    visit nutrition_facts_path
  end

  describe "index" do

    it { should have_title('All nutrition facts') }
    it { should have_content('All nutrition facts') }

    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:nutrition_fact) } }
      after(:all)  { NutritionFact.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each user" do
        NutritionFact.paginate(page: 1).each do |user|
          expect(page).to have_selector('li', text: nutrition_fact.name)
        end
      end
    end

    describe "delete links" do

      it { should_not have_link('delete') }

        it { should have_link('delete', href: nutrition_fact_path(NutritionFact.first)) }
        it "should be able to delete another nutrition fact" do
          expect do
            click_link('delete', match: :first)
          end.to change(NutritionFact, :count).by(-1)
        end
      end
    end
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_selector('h1', text: 'Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",             with: "Example User"
        fill_in "Email",            with: "user@example.com"
        fill_in "Password",         with: "foobar"
        fill_in "Confirm Password", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_content("Update your profile") }
      it { should have_title("Edit user") }
      it { should have_link('change', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_content('error') }
    end
    
    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save changes"
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
    
    describe "forbidden attributes" do
      let(:params) do
        { user: { admin: true, password: user.password,
                  password_confirmation: user.password } }
      end
      before { patch user_path(user), params }
      specify { expect(user.reload).not_to be_admin }
    end
  end

end
