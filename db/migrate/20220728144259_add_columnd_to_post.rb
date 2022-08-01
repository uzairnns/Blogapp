# frozen_string_literal: true

class AddColumndToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title, :string, null: false, default: ''
    add_column :posts, :description, :text, null: false, default: ''
    add_column :replies, :body, :text, null: false, default: ''
    add_column :suggestions, :body, :text, null: false, default: ''
    add_column :users, :name, :string, null: false, default: ''
  end
end
