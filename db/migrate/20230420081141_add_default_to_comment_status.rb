class AddDefaultToCommentStatus < ActiveRecord::Migration[7.0]
  def up
    change_column :comments, :status, :integer, default: 0
  end

  def down
    change_column :comments, :status, :integer, default: nil
  end
end
