# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :article

  VALID_STATUSES = %w[public private archived].freeze

  validates :commenter, :body, presence: true
  validates :commenter, length: { minimum: 6, maximum: 32 }
  validates :body, length: { minimum: 23, maximum: 280 }
  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end
