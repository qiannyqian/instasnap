require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "new" do
    it "should render new" do
      get :new
      expect(subject).to render_template(:new)
    end
  end

end
