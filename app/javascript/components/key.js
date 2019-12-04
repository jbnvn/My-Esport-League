const validateFormButton = () => {
  document.querySelectorAll('.button-to-click').forEach((btn) => {
    console.log("1")
    btn.addEventListener("click", (event) => {
      console.log("2")
      const checkBoxes = document.querySelectorAll('.check_boxes');
      let count = 0;
      checkBoxes.forEach((boxe) => {
        if (boxe.checked == true) {
          count += 1
          console.log("3")
        }
      })

      if (count == 6) {
        const button = document.getElementById("validate-button");
        button.classList.remove('d-none');
        console.log("4")
      }
    });
  });
}

export { validateFormButton }
