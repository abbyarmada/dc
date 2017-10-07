# frozen_string_literal: true

class Blog < ApplicationRecord
  validates :name, presence: true
end
