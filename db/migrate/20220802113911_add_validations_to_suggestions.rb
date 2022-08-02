# frozen_string_literal: true

class AddValidationsToSuggestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :suggestions, :body, :text
    add_column :suggestions, :body, :text, null: false, default: ''
  end
end
