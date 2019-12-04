const validateFormButton = () => {
  document.querySelectorAll('.button-to-click').forEach((btn) => {
    btn.addEventListener("click", (event) => {
      const checkBoxes = document.querySelectorAll('.check_boxes');
      let count = 0;
      checkBoxes.forEach((boxe) => {
        if (boxe.checked == true) {
          count += 1
        }
      })

      if (count == 6) {
        const button = document.getElementById("validate-button");
        button.classList.remove('d-none');
      }
    });
  });
}

export { validateFormButton }
