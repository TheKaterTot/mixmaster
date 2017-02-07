require "rails_helper"

feature "user edits an artist" do
  scenario "they visit edit" do
    artist = Fabricate(:artist)

    visit edit_artist_path(artist)
    fill_in "artist_name", with: "Susannah"
    click_on "Update Artist"

    expect(current_path).to eq(artist_path(artist))
    expect(page).to have_content("Susannah")
  end
end

context "the submitted info is invalid" do
  scenario "they see an error message" do
    artist = Fabricate(:artist)
    #artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit edit_artist_path(artist)
    fill_in "artist_image_path", with: ""
    click_on "Update Artist"

    expect(page).to have_content("Image path can't be blank")
  end
end
