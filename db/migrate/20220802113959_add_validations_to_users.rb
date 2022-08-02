# frozen_string_literal: true

class AddValidationsToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name, :string
    add_column :users, :name, :string, null: false, default: ''
  end
end
