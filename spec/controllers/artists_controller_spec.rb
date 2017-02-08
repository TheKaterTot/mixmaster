require "rails_helper"

describe ArtistsController, type: :controller do
  describe "GET #index" do
    it "assigns all artists as @artists and renders the index" do
      artist = Fabricate(:artist)

      get(:index)

      expect(assigns(:artists)).to eq([artist])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns an artist as @artist and renders show" do
      artist = Fabricate(:artist)

      get(:show, params: {:id => artist.to_param})

      expect(assigns(:artist)).to eq(artist)
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assigns a new artist as @artist" do

      get(:new)

      expect(assigns(:artist)).to be_a_new(Artist)
    end
  end

  describe "GET #edit" do
    it "assigns an artist as @artist and renders edit" do
      artist = Fabricate(:artist)

      get(:edit, params: {:id => artist.to_param})

      expect(assigns(:artist)).to eq(artist)
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    context "it has valid info" do
      it "creates a new artist" do
        expect {
          post :create, params: {:artist => Fabricate.attributes_for(:artist)}
        }.to change(Artist, :count).by(1)
      end
      it "assigns a newly created artist as @artist" do
        post :create, params: {:artist => Fabricate.attributes_for(:artist)}
        expect(assigns(:artist)).to be_a(Artist)
        expect(assigns(:artist)).to be_persisted
      end

      it "redirects to the new artist show page" do
        post :create, params: {:artist => Fabricate.attributes_for(:artist)}
        expect(response).to redirect_to(Artist.last)
      end
    end

    context "it has invalid info" do
      it "assigns a newly created but unsaved artist to @artist" do
        post :create, params: {:artist => Fabricate.attributes_for(:artist, name: nil)}
        expect(assigns(:artist)).to be_a_new(Artist)
      end

      it "re-renders the new template" do
        post :create, params: {:artist => Fabricate.attributes_for(:artist, name: nil)}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let!(:artist) { Fabricate(:artist) }
    context "with valid info" do
      it "updates the specified artist" do
        put :update, params: {:id => artist.to_param, :artist => Fabricate.attributes_for(:artist, name: "Bobby")}
        artist.reload
        expect(artist.name).to eq("Bobby")
      end
      it "assigns the specified artist as @artist" do
        put :update, params: {:id => artist.to_param, :artist => Fabricate.attributes_for(:artist, name: "Sam")}
        expect(assigns(:artist)).to eq(artist)
      end
      it "redirects to the artist show page" do
        put :update, params: {:id => artist.to_param, :artist => Fabricate.attributes_for(:artist, name: "Dean")}
        expect(response).to redirect_to(Artist.last)
      end
    end

    context "with invalid info" do
      it "assigns the artist as @artist" do
        put :update, params: {:id => artist.to_param, :artist => Fabricate.attributes_for(:artist, name: nil)}
        expect(assigns(:artist)).to eq(artist)
      end
      it "re-renders the edit page" do
        put :update, params: {:id => artist.to_param, :artist => Fabricate.attributes_for(:artist, name: nil)}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:artist) { Fabricate(:artist) }
    it "destroys the specified artist" do
      expect {
      delete :destroy, params: {:id => artist.to_param}
    }.to change(Artist, :count).by(-1)
    end
    it "redirects to artists index" do
      delete :destroy, params: {:id => artist.to_param}
      expect(response).to redirect_to(artists_path)
    end
  end
end
