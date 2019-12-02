const hideAllPlayersInputs = () => {
  const inputs = document.querySelectorAll(".tab").forEach((input) => {
    input.classList.add("d-none")
  })
}

const initFilterPlayers = () => {
  document.querySelectorAll('.player-input-btns').forEach((btn) => {
    btn.addEventListener("click", (event) => {
      hideAllPlayersInputs();
      hideYourPlayers();
      const targetSelector = `#tab-${btn.id}`
      document.querySelector(targetSelector).classList.remove("d-none");
    });
  })
}
