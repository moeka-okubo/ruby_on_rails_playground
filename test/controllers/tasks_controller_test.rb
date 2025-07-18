require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  # test "should get index" do
  #   get tasks_url
  #   assert_response :success
  # end

  # test "should get show" do
  #   get tasks_show_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get tasks_new_url
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get tasks_edit_url
  #   assert_response :success
  # end

  test "should get create" do
    assert_difference("Task.count") do
      post tasks_url, params: { task: { title: "新しいタスクテスト", description: "新しいタスクテスト内容" } }
    end
    assert_redirected_to tasks_url
    task = Task.last
    assert_equal "新しいタスクテスト", task.title
    assert_equal "新しいタスクテスト内容", task.description
  end

  test "should get update" do
    task = Task.create(id: 0, title: "完了用テスト", description: "完了用テスト内容", completed: false)
    patch task_url(task.id), params: { task: { completed: true } }
    assert_redirected_to tasks_url, notice: "タスクを完了変更"
    task.reload
    assert_equal "完了用テスト", task.title
    assert_equal true, task.completed
  end

  test "should get destroy" do
    task = Task.create(id: 0, title: "削除用テスト", description: "削除用テスト内容", completed: false)
    delete task_url(task.id), params: { task: { is_deleted: true } }
    assert_redirected_to tasks_url, notice: "タスクを削除"
    task.reload
    assert_equal "削除用テスト", task.title
    assert_equal true, task.is_deleted
  end
end
