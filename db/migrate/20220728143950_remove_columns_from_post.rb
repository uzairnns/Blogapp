# frozen_string_literal: true

class RemoveColumnsFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :title, :string
    remove_column :posts, :description, :text
    remove_column :replies, :body, :text
    remove_column :suggestions, :body, :text
    remove_column :users, :name, :string
  end
end
