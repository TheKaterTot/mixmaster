class AddUsertoPlaylists < ActiveRecord::Migration[5.0]
  def change
    add_column :playlists, :user_id, :integer
  end
end
