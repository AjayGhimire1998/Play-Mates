class AddAttachmentCoverToProfiles < ActiveRecord::Migration[7.0]
  def self.up
    change_table :profiles do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :profiles, :cover
  end
end
