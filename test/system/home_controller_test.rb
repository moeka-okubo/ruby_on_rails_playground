require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  test "タスク一覧ページが表示される" do
    visit root_path
    assert_text "TODO LIST"
    assert_selector ".list-item", text: "未削除全て"
  end

  test "未削除全てがデフォルト選択になっている" do
    visit root_path
    assert_selector ".list-item.-selected", text: "未削除全て"
  end
end
