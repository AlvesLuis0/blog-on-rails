# frozen_string_literal: true

module Visible
  extend ActiveSupport::Concern

  class_methods do
    def public_count
      where(status: :public).count
    end

    def public
      where(status: :public)
    end
  end
end
