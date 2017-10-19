require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "new" do
    it "should render new" do
      get :new
      expect(subject).to render_template(:new)
    end
  end

  describe "index" do
    it "should render user search" do
      get :index
      expect(subject).to render_template(:index)
    end
  end

end
