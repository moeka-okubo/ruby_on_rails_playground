# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(label: "ボタン", type: "button", class_name: "", is_danger: false, is_black: false)
    @type = type
    @label = label
    style_class = is_danger ? "-danger" : is_black ? "-black" : "-primary"
    @class_name = [ "button", style_class, class_name ].reject(&:blank?).join(" ")
  end
end
