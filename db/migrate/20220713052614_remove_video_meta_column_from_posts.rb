class RemoveVideoMetaColumnFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :video_meta, :string
  end
end
