# frozen_string_literal: true

class RemoveNameFromComment < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :name, :string
  end
end
