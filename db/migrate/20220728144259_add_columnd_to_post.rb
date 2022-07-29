class AddColumndToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title, :string, :null => false
    add_column :posts, :description, :text, :null => false
    add_column :replies, :body, :text, :null => false
    add_column :suggestions, :body, :text, :null => false
    add_column :users, :name, :string, :null => false
  end
end
