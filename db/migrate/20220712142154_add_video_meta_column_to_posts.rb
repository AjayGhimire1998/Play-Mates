class AddVideoMetaColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :video_meta, :string
  end
end
