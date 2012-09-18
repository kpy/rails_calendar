require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "signup page" do 
    before { visit sign_up_path }
    it { should have_selector('h1', :text => 'Registrieren') }
    it { should have_selector('title', :text => full_title("Registrieren")) }
  end

  describe "profile page" do
  	# Mit FactoryGirl wird ein Testuser erzeugt
  	let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe "signup" do
  	before { visit sign_up_path }
  	let(:submit) { "Registrierung abschicken" }
  	describe "with invalid information" do
  	  it "should not create a user" do
  	  	expect { click_button submit }.not_to change(User, :count)
  	  end
  	end
  	describe "with valid information" do
  	  before do
  	  	fill_in "Name:", with: "Example User"
  	  	fill_in "Email:", with: "user@example.com"
  	  	fill_in "Passwort:", with: "foobar"
  	  	fill_in "Passwort Wiederholung:", with: "foobar"
  	  end
  	  it "should create a user" do
	    expect { click_button submit }.to change(User, :count).by(1)
  	  end
  	end
  end
end
