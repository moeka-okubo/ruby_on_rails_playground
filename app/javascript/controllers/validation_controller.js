import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["field", "error"];

  connect() {
    this.validateOnInput();
  }

  validateOnInput() {
    this.fieldTargets.forEach((field) => {
      field.addEventListener("input", () => {
        this.validateField(field);
      });
    });
  }

  validateField(field) {
    const fieldName = field.name.replace("task[", "").replace("]", "");
    const value = field.value.trim();
    const errorElement = this.findErrorElement(fieldName);

    const errors = this.getValidationErrors(fieldName, value);

    if (errors.length > 0) {
      this.showErrors(field, errorElement, errors);
    } else {
      this.hideErrors(field, errorElement);
    }
  }

  getValidationErrors(fieldName, value) {
    const errors = [];

    switch (fieldName) {
      case "title":
        if (value === "") {
          errors.push("タイトルを入力してください");
        } else if (value.length < 3) {
          errors.push("タイトルは3文字以上で入力してください");
        }
        break;

      case "description":
        if (value.length > 100) {
          errors.push("内容は100文字以下で入力してください");
        }
        break;
    }

    return errors;
  }

  findErrorElement(fieldName) {
    return this.errorTargets.find((error) => error.dataset.field === fieldName);
  }

  showErrors(field, errorElement, errors) {
    field.classList.add("-error");
    if (errorElement) {
      // 既存のエラーメッセージをクリア
      errorElement.innerHTML = "";

      // 新しいエラーメッセージを追加
      errors.forEach((error) => {
        const errorItem = document.createElement("div");
        errorItem.className = "error-item";
        errorItem.textContent = error;
        errorElement.appendChild(errorItem);
      });

      errorElement.style.display = "block";
    }
  }

  hideErrors(field, errorElement) {
    field.classList.remove("-error");
    if (errorElement) {
      errorElement.style.display = "none";
    }
  }
}
