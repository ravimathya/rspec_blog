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
                post :create, :params => {:post => FactoryBot.attributes_for(:post) }
                expect(response).to redirect_to root_path :new

            end
        end

        context "with invalid attributes" do
            it "doesn't create a new post" do

            end
            it "render the new template" do 

            end
        end
    end

    describe "VERB #edit" do
        it "edit post" do
            post = FactoryBot.create(:post)
            get :edit, :params => {:id => post.id}
            expect(response).to render_template :edit
        end
    end

    describe "PUT #update" do
        context "when attributes are valid" do
            it "updates the post" do
                post = FactoryBot.create(:post)
                put :update, :params => { :id => post.id, :post => FactoryBot.attributes_for(:post, :title => 'New Title', :author => 'Larry')}
                post.reload
                expect(post.title).to eq("New Title")
                expect(post.author).to eq("Larry")
            end

            it "redirect to root_path" do
                post = FactoryBot.create(:post)

                put :update, :params => { :id => post.id, :post => FactoryBot.attributes_for(:post, :title => 'New Title', :author => 'Larry' ) }
                expect(response).to redirect_to root_path
            end
        end

        context "when attributes are invalid" do
            it "doesn't updates the post" do
                post = FactoryBot.create(:post)
                put :update, :params => { :id => post.id, :post => FactoryBot.attributes_for(:post, :title => "New Title", :author => "Larry", :content => "hi" ) }
                post.reload
                expect(post.title).to_not eq("New Title")
                expect(post.author).to_not eq("Larry")
            end

            it "renders the edit template" do
                post = FactoryBot.create(:post)
                put :update, :params => {:id => post.id, :post => FactoryBot.attributes_for(:invalid_post)}
                expect(response).to render_template :edit
            end
        end
    end
end
