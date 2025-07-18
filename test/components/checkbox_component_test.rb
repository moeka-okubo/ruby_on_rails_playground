# frozen_string_literal: true

require "test_helper"

class CheckboxComponentTest < ViewComponent::TestCase
  def test_render
    form = ActionView::Helpers::FormBuilder.new(:task, Task.new, ApplicationController.new.view_context, {})
    expected_html = <<~HTML.strip
    <div class="checkbox">
      <input id="checkbox-1" class="checkbox-input" type="checkbox" value="true" name="task[completed]">
      <label for="checkbox-1" class="checkbox-label"></label>
    </div>
    HTML
    assert_equal(
      expected_html,
      render_inline(CheckboxComponent.new(form: form, id: 1)).to_html.strip
    )
  end

  def test_render_active
    task = Task.new(completed: true)
    form = ActionView::Helpers::FormBuilder.new(:task, task, ApplicationController.new.view_context, {})
    expected_html = <<~HTML.strip
    <div class="checkbox">
      <input id="checkbox-1" class="checkbox-input" type="checkbox" value="true" checked name="task[completed]">
      <label for="checkbox-1" class="checkbox-label"></label>
    </div>
    HTML
    assert_equal(
      expected_html,
      render_inline(CheckboxComponent.new(form: form, id: 1, is_active: true)).to_html.strip
    )
  end

  def test_render_onChange
    form = ActionView::Helpers::FormBuilder.new(:task, Task.new, ApplicationController.new.view_context, {})
    expected_html = <<~HTML.strip
    <div class="checkbox">
      <input id="checkbox-1" class="checkbox-input" onchange="this.form.requestSubmit()" type="checkbox" value="true" name="task[completed]">
      <label for="checkbox-1" class="checkbox-label"></label>
    </div>
    HTML
    assert_equal(
      expected_html,
      render_inline(CheckboxComponent.new(form: form, id: 1, on_change: "this.form.requestSubmit()")).to_html.strip
    )
  end

  def test_render_without_id
    form = ActionView::Helpers::FormBuilder.new(:task, Task.new, ApplicationController.new.view_context, {})
    error = assert_raises(ArgumentError) do
      CheckboxComponent.new(form: form)
    end
    # テストの時に何かを表示されるのはRails.logger.debug()じゃなくてこっちが良さげ
    puts "🍭🍭🍭🍭🍭🍭🍭"
    puts error.message
    assert_match(/missing keyword: :id/, error.message)
  end

  def test_render_without_form
    error = assert_raises(NoMethodError) do
      render_inline(CheckboxComponent.new(id: 1))
    end
    assert_match(/undefined method `check_box' for nil:NilClass/, error.message)
  end
end
