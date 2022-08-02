# frozen_string_literal: true

class AddValidationsToReplies < ActiveRecord::Migration[5.2]
  def change
    remove_column :replies, :body, :text
    add_column :replies, :body, :text, null: false, default: ''
  end
end
