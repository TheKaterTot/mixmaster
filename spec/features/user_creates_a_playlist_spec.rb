require "rails_helper"

feature "user creates a playlist" do
  let!(:song_list) { Fabricate.times(3, :song) }
  let(:song_one) { song_list[0] }
  let(:song_two) { song_list[1] }
  let(:song_three) { song_list[2] }

  scenario "they see the page for the individual playlist" do
    playlist_name = "My Jams"

    visit playlists_path
    click_on "New playlist"
    fill_in "playlist_name", with: playlist_name
    check("song-#{song_one.id}")
    check("song-#{song_two.id}")
    check("song-#{song_three.id}")

    click_on "Create Playlist"

    expect(page).to have_content playlist_name

    within("li:first") do
      expect(page).to have_link song_one.title, href: song_path(song_one)
    end

    within("li:last") do
      expect(page).to have_link song_three.title, href: song_path(song_three)
    end
  end
end
