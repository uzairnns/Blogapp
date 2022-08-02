# frozen_string_literal: true

class AddValidationsToTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :title, :string
    remove_column :posts, :description, :text
    remove_column :replies, :body, :text
    remove_column :suggestions, :body, :text
    remove_column :users, :name, :string
    remove_column :comments, :comment, :text

    add_column :posts, :title, :string, null: false, default: ''
    add_column :posts, :description, :text, null: false, default: ''
    add_column :replies, :body, :text, null: false, default: ''
    add_column :suggestions, :body, :text, null: false, default: ''
    add_column :users, :name, :string, null: false, default: ''
    add_column :comments, :body, :string, null: false, default: ''
  end
end
