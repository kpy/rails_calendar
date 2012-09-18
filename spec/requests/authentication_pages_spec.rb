require 'spec_helper'

describe "Authentication" do 
  subject { page }
  describe "login page" do
	before { visit signin_path }
	it { should have_selector('h1', :text => 'Login') }
	it { should have_selector('title', :text => 'Login') }
  end

  describe "login" do
  	before { visit signin_path }
  	describe "with invalid information" do
  	  before { click_button "Login" }
  	  it { should have_selector('title', :text => 'Login') }
  	  it { should have_selector('div.alert.alert-error', :text => 'Invalid') }

  	  describe "after visiting another page" do
		before { click_link "Home" }
		it { should_not have_selector('div.alert.alert-error') }
	  end
  	end

  	describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email:",    with: user.email
        fill_in "Passwort:", with: user.password
        click_button "Login"
      end
  	  it { should have_selector('title', :text => user.name) }
  	  it { should have_link('Profile', :href => user_path(user)) }
  	  it { should have_link('Logout', :text => signout_path) }
	    it { should_not have_link('Login', :href => signin_path) }
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }

        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Logout') }
      end
      describe "followed by logout" do
        before { click_link "Logout" }
        it { should have_link('Logout') }
      end
  	end
  end
end
