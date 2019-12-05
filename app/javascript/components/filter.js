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

// const showYourPlayers = () => {
//   const inputs = document.getElementById("show-players").classList.remove("d-none");
// }


const hideIndexPlayers = () => {
  const inputs = document.querySelector(".card-formplayer").add("d-none")
}


const initFilterPlayers = () => {
  document.querySelectorAll('.player-input-btns').forEach((btn) => {
    console.log("1")
    btn.addEventListener("click", (event) => {
      hideAllPlayersInputs();
      hideYourPlayers();
      const targetSelector = `#${btn.id}-players`
      document.querySelector(targetSelector).classList.remove("d-none");
      console.log("2")
    });
  })
}


const checkPlayerBoxe = (category) => {
  const categoryDiv = document.querySelector(`#${category}`);
  if (categoryDiv) {
    categoryDiv.querySelectorAll('label').forEach((player) => {
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
  const bids = document.querySelectorAll('.bid-points');


  const checkBoxes = document.querySelectorAll('.check_boxes');
  // const selectedPlayers = [];
  checkBoxes.forEach((box) => {
    if (box.checked == true) {
      const player = document.getElementById(`player_placeholder_infos_${box.value}`)
      const role = player.dataset.role;
      const name = player.dataset.name;
      const listElement = document.getElementById(`${role}-bid`);
      listElement.innerText = "Name: " + name + " | Role: " + role + " | Your bid: "
      // selectedPlayers.push(player)
    }
  });

  // console.log(selectedPlayers);



  bids.forEach((bid) => {
    const position = bid.dataset.position;
    const listElement = document.getElementById(`${position}-bid`);
    listElement.innerText += bid.value;
    if (bid.dataset.position == "sub") {
     const listAllElement = document.getElementById('sub-bid');
     listAllElement.innerText += bid.value;
    }
  })

  // retrieve point list
  // update each position for each point
}


// const showAllPlayersInputs = () => {
//   const button = document.querySelectorAll(".show-player-selection").forEach((button) => {
//     button.addEventListener("click", (event) => {
//     document.getElementById("show-players").classList.remove("d-none");
//     hideAllPlayersInputs();
//     })
//   })
// }

export { checkPlayerBoxe };
export { initFilterPlayers };
export { initShowPlayers };
// export { showAllPlayersInputs};








