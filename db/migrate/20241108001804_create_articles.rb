# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title,      null: false
      t.text :content,      null: false
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
