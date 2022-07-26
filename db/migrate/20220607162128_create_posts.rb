# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.boolean :published
      t.string :published_at
      t.string :datetime
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
