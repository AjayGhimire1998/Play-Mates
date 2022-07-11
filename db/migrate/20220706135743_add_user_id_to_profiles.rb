class AddUserIdToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :user_id, :integer
  end
end
