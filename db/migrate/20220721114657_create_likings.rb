# frozen_string_literal: true

class CreateLikings < ActiveRecord::Migration[5.2]
  def change
    create_table :likings do |t|
      t.references :comment, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :likings, %i[user_id comment_id], unique: true
  end
end
