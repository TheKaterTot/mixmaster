require "rails_helper"

feature "user sees all playlists" do
  let!(:playlist) { Fabricate(:playlist) }
  let!(:playlist_2) { Fabricate(:playlist) }
  scenario "they visit index" do
    visit playlists_path

    expect(page).to have_content(playlist.name)
    expect(page).to have_link playlist.name, href: playlist_path(playlist)
    expect(page).to have_content(playlist_2.name)
    expect(page).to have_link playlist_2.name, href: playlist_path(playlist_2)
  end
end
