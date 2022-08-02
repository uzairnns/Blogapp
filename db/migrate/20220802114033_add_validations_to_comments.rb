# frozen_string_literal: true

class AddValidationsToComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :body, :text
    add_column :comments, :body, :string, null: false, default: ''
  end
end
