# frozen_string_literal: true

class AddIndexToTable < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :name
    add_index :posts, :title
    add_index :comments, :comment
    add_index :suggestions, :body
  end
end
