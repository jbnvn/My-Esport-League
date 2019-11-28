const hideAllPlayersInputs = () => {
  const inputs = document.querySelectorAll(".player-group").forEach((input) => {
    input.classList.add("d-none")
  })
}
const hideAllCheckBoxes = (category) => {
  document.querySelector(`#${category}`)
    .querySelectorAll('.check_boxes')
    .forEach((check) => {
    check.checked = false;
    })
  }


const initFilterPlayers = () => {
  document.querySelectorAll('.player-input-btns').forEach((btn) => {
    btn.addEventListener("click", (event) => {
      hideAllPlayersInputs();
      const targetSelector = `#${btn.id}-players`
      document.querySelector(targetSelector).classList.remove("d-none");
    });
  })
}


const checkPlayerBoxe = (category) => {
    document.querySelector(`#${category}`).querySelectorAll('label').forEach((player) => {
      player.addEventListener("click", (event) => {
        hideAllCheckBoxes(category);
        event.currentTarget.parentElement.checked = true;
        player.querySelector('button').click()
    })
  });
}



export { checkPlayerBoxe };
export { initFilterPlayers };
