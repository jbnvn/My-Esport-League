const hideAllPlayersInputs = () => {
  const inputs = document.querySelectorAll(".player-group").forEach((input) => {
    input.classList.add("d-none")
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






export { initFilterPlayers };
