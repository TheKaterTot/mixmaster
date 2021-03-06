require "rails_helper"

feature "user edits a playlist" do
  let(:user) { Fabricate(:user) }
  let!(:playlist) { Fabricate(:playlist, user: user) }
  scenario "they visit edit" do
    visit user_playlist_path(user, playlist)
    click_on "Edit Playlist"
    fill_in "playlist_name", with: "Pumped Up"
    check("playlist_song_ids_#{playlist.songs.first.id}")
    check("playlist_song_ids_#{playlist.songs.last.id}")
    click_on "Update Playlist"

    expect(page).to have_content("Pumped Up")
    expect(playlist.songs).to_not have_content(playlist.songs.first.title)
  end
end
