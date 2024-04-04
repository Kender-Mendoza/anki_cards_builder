# frozen_string_literal: true

class PartOfSpeach < ApplicationRecord # :nodoc:
  belongs_to :entry
  has_many :definitions
end
