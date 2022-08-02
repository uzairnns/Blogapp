# frozen_string_literal: true

class AddValidationsToPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :title, :string
    remove_column :posts, :description, :text
    add_column :posts, :title, :string, null: false, default: ''
    add_column :posts, :description, :text, null: false, default: ''
  end
end
