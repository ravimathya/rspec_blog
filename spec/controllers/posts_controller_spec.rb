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

    describe "GET #new" do
        it "renders the new template" do
            get :new
            expect(response).to render_template :new

        end
    end

    describe "POST #create" do
        context "with valid attributes" do
            it "create a new post" do
                expect {
                    post :create, :params => {:post => FactoryBot.attributes_for(:post) }
                }.to change(Post, :count).by(1)  

            end

            it "redirect to root_path" do

            end
        end

        context "with invalid attributes" do
            it "doesn't create a new post" do

            end
            it "render the new template" do 

            end
        end
    end
end
