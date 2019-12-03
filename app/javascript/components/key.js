// const removeDisableKey create-bid-button= () => {
//  const eventTarget = document.querySelectorAll("")
//   eventTarget.addEventListener("keyup", event => {
//   if event.keycode === Integer
//     .classList.remove('.disabled')
//   };
//   // do something
// }

let test = 0;
const validateForm2 = () => {
  test++;
  if (test===6){
    //console.log('heyyyy');
    const btn = document.querySelector('.create-bid-button');
    btn.classList.remove("create-bid-button");
}
  return false;
}


// const initInputValidation = (category) => {
//   const bidinputs = document.querySelector(`#${category}`)
//   // console.log(bidinputs)

//   bidinputs.parentElement.parentElement.querySelector('button').disabled = true

//   bidinputs.addEventListener('keyup', (event) => {
//     if (event.currentTarget.value != '') {
//       bidinputs.parentElement.parentElement.querySelector('button').disabled = false
//     } else {
//       bidinputs.parentElement.parentElement.querySelector('button').disabled = true
//     }
//   })
// }



// export { initInputValidation }
// export { validateForm2 }

// onkeypress="refuserToucheEntree(event);"

