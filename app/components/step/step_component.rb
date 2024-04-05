# frozen_string_literal: true

class Step::StepComponent < ViewComponent::Base
  def initialize(step:)
    @step = step
  end
end
