# frozen_string_literal: true

class Step::FirstComponent < ViewComponent::Base
  def initialize(first:)
    @first = first
  end
end
