require "rails_helper"

feature "user creates a playlist" do
  let!(:playlist) { Fabricate(:playlist) }
  scenario "they see the page for the individual playlist" do
    playlist_name = "My Jams"

    visit playlists_path
    click_on "New playlist"
    fill_in "playlist_name", with: playlist_name
    check("playlist_song_ids_#{playlist.songs.first.id}")
    check("playlist_song_ids_#{playlist.songs.last.id}")

    click_on "Create Playlist"

    expect(page).to have_content playlist_name

    within("li:first") do
      expect(page).to have_link playlist.songs.first.title, href: song_path(playlist.songs.first)
    end

    within("li:last") do
      expect(page).to have_link playlist.songs.last.title, href: song_path(playlist.songs.last)
    end
  end
end
