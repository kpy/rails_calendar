require 'spec_helper'

describe TerminController do

  describe "GET 'ansehen'" do
    it "returns http success" do
      get 'ansehen'
      response.should be_success
    end
  end

  describe "GET 'hinzufuegen'" do
    it "returns http success" do
      get 'hinzufuegen'
      response.should be_success
    end
  end

  describe "GET 'bearbeiten'" do
    it "returns http success" do
      get 'bearbeiten'
      response.should be_success
    end
  end

  describe "GET 'loeschen'" do
    it "returns http success" do
      get 'loeschen'
      response.should be_success
    end
  end

  describe "GET 'freigeben'" do
    it "returns http success" do
      get 'freigeben'
      response.should be_success
    end
  end

end
