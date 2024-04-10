# frozen_string_literal: true

class PartOfSpeach < ApplicationRecord # :nodoc:
  validates :speach_type, presence: true

  belongs_to :entry
  has_many :definitions
end
