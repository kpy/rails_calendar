require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'impressum'" do
    it "returns http success" do
      get 'impressum'
      response.should be_success
    end
  end

  describe "GET 'kontakt'" do
    it "returns http success" do
      get 'kontakt'
      response.should be_success
    end
  end

end
