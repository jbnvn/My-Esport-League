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

const hideYourPlayers = () => {
  const inputs = document.getElementById("show-players").classList.add("d-none");
}

const hideIndexPlayers = () => {
  const inputs = document.querySelector(".card-formplayer").add("d-none")
}


const initFilterPlayers = () => {
  document.querySelectorAll('.player-input-btns').forEach((btn) => {
    btn.addEventListener("click", (event) => {
      hideAllPlayersInputs();
      hideYourPlayers();
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
        const id = player.lastElementChild.id;
        const modalId = player.lastElementChild.dataset.modal;
        const modalContent = document.getElementById(`player_infos_${id}`);
        const modal = document.getElementById(modalId);
        if (modal) {
          const modalBody = modal.querySelector('.modal-body');
          modalBody.innerHTML = '';
          modalBody.appendChild(modalContent);
        }
    })
  });
}



const initShowPlayers = () => {
  document.querySelectorAll('.button-to-click').forEach((btn) => {
    btn.addEventListener("click", (event) => {
      hideAllPlayersInputs();
      updateBids();
      document.getElementById("show-players").classList.remove("d-none");
    });
  })
}

const updateBids = () => {
  const bids = document.querySelectorAll('.bid-points')
  bids.forEach((bid) => {
    const position = bid.dataset.position;
    const listElement = document.getElementById(`${position}-bid`);
    listElement.innerText = bid.value;

  })
  // retrieve point list
  // update each position for each point
}

export { checkPlayerBoxe };
export { initFilterPlayers };
export { initShowPlayers };









