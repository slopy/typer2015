require 'rails_helper'
# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
  # module MyEngine
  #   class Engine < ::Rails::Engine
  #     isolate_namespace MyEngine
  #   end

  #   Engine.routes.draw do

  #     scope 'api' do
  #         namespace :v1 do 
  #             resources :groups, except: [:new, :edit]
  #         end
  #     end
  #   end

  # end

RSpec.describe V1::GroupsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Group. As you add validations to Group, be sure to
  # adjust the attributes here as well.

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GroupsController. Be sure to keep this updated too.

  context "logged user" do 
    let(:valid_attributes) { {name: "test"} }
    let(:invalid_attributes) { { name: "" } }
    let(:valid_session) {}
    login_user

    describe "GET #index" do
      it "assigns all groups as @groups" do
        group = Group.create! valid_attributes
        get :index, { format: :json}
        expect(assigns(:groups)).to include(group)
        expect(json.last['name']).to eq(group.name)
        expect(response.status).to be 200
      end
    end

    describe "GET #show" do
      it "assigns the requested group as @group" do
        group = Group.create! valid_attributes
        get :show, {:id => group.to_param}
        expect(assigns(:group)).to eq(group)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Group" do
          expect {
            post :create, {:group => valid_attributes, format: :json}
          }.to change(Group, :count).by(1)
        end

        it "assigns a newly created group as @group" do
          post :create, {:group => valid_attributes, format: :json}
          expect(assigns(:group)).to be_a(Group)
          expect(assigns(:group)).to be_persisted
        end

        it "redirects to the created group" do
          post :create, {:group => valid_attributes}
          expect(response).to have_http_status(:created)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved group as @group" do
          post :create, {:group => invalid_attributes}
          expect(assigns(:group)).to be_a_new(Group)
        end

        it "re-renders the 'new' template" do
          post :create, {:group => invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {name: "test_new"}
        }

        it "updates the requested group" do
          group = Group.create! valid_attributes
          put :update, {:id => group.to_param, :group => new_attributes}, valid_session
          group.reload
          expect(response).to have_http_status(:ok)
        end

        it "assigns the requested group as @group" do
          group = Group.create! valid_attributes
          put :update, {:id => group.to_param, :group => valid_attributes}, valid_session
          expect(assigns(:group)).to eq(group)
        end

        it "redirects to the group" do
          group = Group.create! valid_attributes
          put :update, {:id => group.to_param, :group => valid_attributes}, valid_session
          expect(response).to have_http_status(:success)
        end
      end

      context "with invalid params" do
        it "assigns the group as @group" do
          group = Group.create! valid_attributes
          put :update, {:id => group.to_param, :group => invalid_attributes}, valid_session
          expect(assigns(:group)).to eq(group)
        end

        it "re-renders the 'edit' template" do
          group = Group.create! valid_attributes
          put :update, {:id => group.to_param, :group => invalid_attributes}, valid_session
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested group" do
        group = Group.create! valid_attributes
        expect {
          delete :destroy, {:id => group.to_param}, valid_session
        }.to change(Group, :count).by(-1)
      end

      it "redirects to the groups list" do
        group = Group.create! valid_attributes
        delete :destroy, {:id => group.to_param}, valid_session
        expect(response).to have_http_status(:success)
      end
    end

  end  
  # end of context

  context "user not logged" do 
    let(:valid_attributes) { {name: "test"} }
    let(:invalid_attributes) { { name: "" } }
    let(:valid_session) {}
    let(:new_attributes) { {name: "test_new"} }

    describe "CRUD" do
      it 'GET return status 401' do 
        get :index, {}
        expect(response.status).to eq(401)
      end

      it 'POST return status 401' do 
        post :create, {:group => valid_attributes, format: :json}
        expect(response.status).to eq(401)
      end

      it 'PUT return status 401' do 
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param,:group => new_attributes, format: :json}
        expect(response.status).to eq(401)
      end

      it "DELETE return status 401" do
        group = Group.create! valid_attributes
        delete :destroy, {:id => group.to_param, format: :json}
        expect(response.status).to eq(401)
      end
    end

  end


end