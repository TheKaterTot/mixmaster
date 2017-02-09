require 'rails_helper'

describe PlaylistsController, type: :controller do
  describe "POST #create" do
    let(:user) { Fabricate(:user) }
    context "it has valid info" do
      it "creates a new playlist" do
        expect {
          post :create, params: {:user_id => user.id, :playlist => Fabricate.attributes_for(:playlist)}
        }.to change(Playlist, :count).by(1)
      end
      it "assigns a newly created playlist as @playlist" do
        post :create, params: {:user_id => user.id, :playlist => Fabricate.attributes_for(:playlist)}
        expect(assigns(:playlist)).to be_a(Playlist)
        expect(assigns(:playlist)).to be_persisted
      end
      it "redirects to the new playlist's show page" do
        post :create, params: {:user_id => user.id, :playlist => Fabricate.attributes_for(:playlist)}
        expect(response).to redirect_to([user, user.playlists.last])
      end
    end

    context "it has invalid info" do
      it "assigns a new but unsaved playlist to @playlist" do
        post :create, params: {:user_id => user.id, :playlist => Fabricate.attributes_for(:playlist, name: nil)}
        expect(assigns(:playlist)).to be_a_new(Playlist)
      end
      it "re-renders the new page" do
        post :create, params: {:user_id => user.id, :playlist => Fabricate.attributes_for(:playlist, name: nil)}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let(:user) { Fabricate(:user) }
    let!(:playlist) { Fabricate(:playlist, user: user) }
    context "it has valid info" do
      it "updates the specified playlist" do
        put :update, params: {:user_id => user.id, :id => playlist.to_param, :playlist => Fabricate.attributes_for(:playlist, name: "Happy")}
        playlist.reload
        expect(playlist.name).to eq("Happy")
      end
      it "assigns the specified playlist as @playlist" do
        put :update, params: {:id => playlist.to_param, :user_id => user.id, :playlist => Fabricate.attributes_for(:playlist, name: "Happy")}
        expect(assigns(:playlist)).to eq(playlist)
      end
      it "redirects to the playlist show page" do
        put :update, params: {:id => playlist.to_param, :user_id => user.id, :playlist => Fabricate.attributes_for(:playlist, name: "Happy")}
        expect(response).to redirect_to([user, user.playlists.last])
      end
    end

    context "it has invalid info" do
      it "assigns the playlist to @playlist but does not save" do
        put :update, params: {:id => playlist.to_param, :user_id => user.id, :playlist => Fabricate.attributes_for(:playlist, name: nil)}
        expect(assigns(:playlist)).to eq(playlist)
      end
      it "re-renders the edit page" do
        put :update, params: {:id => playlist.to_param, :user_id => user.id, :playlist => Fabricate.attributes_for(:playlist, name: nil)}
        expect(response).to render_template("edit")
      end
    end
  end
end
