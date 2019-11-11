require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    describe "GET #index" do
        it "renders the index template" do
            get :index
            expect(response).to render_template :index
        end

    end

    describe "GET #show" do
        it "renders the show template" do
            post = FactoryBot.create(:post)
            # binding.pry
            get :show, :params => {:id => post.id}
            expect(response).to render_template :show

        end

    end

end
