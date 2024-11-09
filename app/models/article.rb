# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, length: { minimum: 6, maximum: 100 }
  validates :content, length: { minimum: 30, maximum: 3000 }
end
