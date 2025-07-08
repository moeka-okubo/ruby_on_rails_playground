# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(label: "ボタン", type: "button", is_danger: false)
    @type = type
    @label = label
    style_class = is_danger ? "-danger" : "-primary"
    @class_name = [ "button", style_class ].reject(&:blank?).join(" ")
  end
end
