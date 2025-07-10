import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["item", "taskContainer"];

  connect() {
    try {
      this.tasks = JSON.parse(this.taskContainerTarget.dataset.tasks);
      this.selectCategory("all");
    } catch (error) {
      console.error("❌ タスクデータの取得に失敗:", error);
      this.tasks = [];
    }
  }

  changeCategory(event) {
    const category = event.currentTarget.dataset.category;
    this.selectCategory(category);
  }

  selectCategory(category) {
    let tasks;

    if (category === "all") {
      tasks = this.tasks.filter((task) => !task.is_deleted);
    } else if (category === "incomplete") {
      tasks = this.tasks.filter((task) => !task.is_deleted && !task.completed);
    } else if (category === "completed") {
      tasks = this.tasks.filter((task) => !task.is_deleted && task.completed);
    } else if (category === "deleted") {
      tasks = this.tasks.filter((task) => task.is_deleted);
    }
    this.updateTaskDisplay(tasks);
  }

  updateTaskDisplay(tasks) {
    const taskElements = this.taskContainerTarget.querySelectorAll(".task");
    let visibleCount = 0;

    taskElements.forEach((taskElement) => {
      const taskId = parseInt(taskElement.dataset.taskId);
      const shouldShow = tasks.some((task) => task.id === taskId);
      if (shouldShow) {
        taskElement.style.display = "flex";
        // 表示される要素の1つ目にはマージンなし
        taskElement.style.marginTop = visibleCount === 0 ? "0" : "16px";
        visibleCount++;
      } else {
        taskElement.style.display = "none";
      }
    });
  }
}
