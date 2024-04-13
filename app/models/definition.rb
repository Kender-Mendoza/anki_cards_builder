# frozen_string_literal: true

class Definition < ApplicationRecord # :nodoc:
  validates :explanation, presence: true

  belongs_to :part_of_speach
end
