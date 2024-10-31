# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :comments

  VALID_STATUSES = %w[public private archived].freeze

  validates :title, :body, presence: true
  validates :title, length: { minimum: 6, maximum: 100 }
  validates :body, length: { minimum: 30, maximum: 3000 }
  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end
