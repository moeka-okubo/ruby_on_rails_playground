# frozen_string_literal: true

require "test_helper"

class ButtonComponentTest < ViewComponent::TestCase
  def test_render
    assert_equal(
      %(<button type="button" class="button -primary">テスト</button>),
      render_inline(ButtonComponent.new(label: "テスト")).to_html.strip
    )
  end

  def test_render_without_label
    assert_equal(
      %(<button type="button" class="button -primary">ボタン</button>),
      render_inline(ButtonComponent.new()).to_html.strip
    )
  end

  def test_render_submit
    assert_equal(
      %(<button type="submit" class="button -primary">submitテスト</button>),
      render_inline(ButtonComponent.new(label: "submitテスト", type: "submit")).to_html.strip
    )
  end

  def test_render_danger
    assert_equal(
      %(<button type="button" class="button -danger">is_dangerテスト</button>),
      render_inline(ButtonComponent.new(label: "is_dangerテスト", is_danger: true)).to_html.strip
    )
  end

  def test_render_is_black
    assert_equal(
      %(<button type="button" class="button -black">is_blackテスト</button>),
      render_inline(ButtonComponent.new(label: "is_blackテスト", is_black: true)).to_html.strip
    )
  end

  def test_render_class_name
    assert_equal(
      %(<button type="button" class="button -primary hoge">is_blackテスト</button>),
      render_inline(ButtonComponent.new(label: "is_blackテスト", class_name: "hoge")).to_html.strip
    )
  end

  def test_render_class_name_with_danger
    assert_equal(
      %(<button type="button" class="button -danger hoge">is_blackテスト</button>),
      render_inline(ButtonComponent.new(label: "is_blackテスト", class_name: "hoge", is_danger: true)).to_html.strip
    )
  end
end
