class AddProfilePictureUrlColumnToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :profile_picture_url, :string
  end
end
