# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, length: { minimum: 6, maximum: 100 }
  validates :body, length: { minimum: 30, maximum: 3000 }
end
