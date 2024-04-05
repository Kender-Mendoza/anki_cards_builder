# frozen_string_literal: true

class Message < ApplicationRecord # :nodoc:
  has_one_attached :avatar
end
