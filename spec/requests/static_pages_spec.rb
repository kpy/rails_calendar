require 'spec_helper'

describe "Static pages" do

  subject { page }
  describe "Home page" do
    before { visit root_path }
    it { should have_selector('h1', :text => 'Willkommen beim RailsCalendar') }
    it { should have_selector('title', :text => full_title('')) }
    it { should have_selector('title', :text => '| Home') }
  end

  describe "Help page" do
    before { visit help_path }
    it { should have_selector('h1', :text => 'Help') }
    it { should have_selector('title', :text => full_title('Help')) }
  end

  describe "Impressum page" do
    before { visit impressum_path }
    it { should have_selector('h1', :text => 'Impressum') }
    it { should have_selector('title', :text => full_title('Impressum')) }
  end

  describe "Contact page" do
    before { visit contact_path }
    it { should have_selector('h1', :text => 'Kontakt') }
    it { should have_selector('title', :text => full_title('Kontakt')) }
  end
end