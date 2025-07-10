# frozen_string_literal: true

class CheckboxComponent < ViewComponent::Base
  def initialize(form: nil, id:, is_active: false, on_change: nil)
    @form = form
    @id = id
    @is_active = is_active
    @on_change = on_change
  end
end
