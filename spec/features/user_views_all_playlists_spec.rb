require "rails_helper"

feature "user sees all playlists" do
  let(:user) { Fabricate(:user) }
  let!(:playlist) { Fabricate(:playlist, user: user) }
  let!(:playlist_2) { Fabricate(:playlist, user: user) }
  scenario "they visit index" do
    visit user_playlists_path(user)

    expect(page).to have_content(playlist.name)
    expect(page).to have_link playlist.name, href: user_playlist_path(user, playlist)
    expect(page).to have_content(playlist_2.name)
    expect(page).to have_link playlist_2.name, href: user_playlist_path(user, playlist_2)
  end
end
