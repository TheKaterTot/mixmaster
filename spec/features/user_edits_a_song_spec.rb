require "rails_helper"

feature "user edits a song" do
  let!(:artist) { Fabricate(:artist) }
  let!(:song) { Fabricate(:song, artist: artist) }
  scenario "they visit edit" do
    visit edit_artist_song_path(artist, song)
    fill_in "Title", with: "Rock the Boat"
    click_on "Update Song"

    expect(current_path).to eq(song_path(song))
    expect(page).to have_content("Rock the Boat")
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end

# context "the submitted info is invalid" do
#   scenario "they see an error message" do
#     artist = Fabricate(:artist)
#
#     visit edit_artist_path(artist)
#     fill_in "artist_image_path", with: ""
#     click_on "Update Artist"
#
#     expect(page).to have_content("Image path can't be blank")
#   end
# end
