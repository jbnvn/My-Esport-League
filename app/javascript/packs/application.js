import "bootstrap";
import { initFilterPlayers } from '../components/filter';
initFilterPlayers();
import { checkPlayerBoxe } from '../components/filter';

// import {initInputValidation} from '../components/key';
 import {validateFormButton} from '../components/key';
 validateFormButton();

import { initShowPlayers } from '../components/filter';
initShowPlayers();

import { initUpdateSum } from '../components/budget';
initUpdateSum();

// import { initFilterTabs } from '../components/tab';
// initFilterTabs();

// import { showAllPlayersInputs} from '../components/filter';
// showAllPlayersInputs();

// document.addEventListener('DOMContentLoaded', event => {

//   document.validateForm2 = validateForm2;
// });

// if(document.querySelector('')){
  checkPlayerBoxe('top-players');
  checkPlayerBoxe('jun-players');
  checkPlayerBoxe('mid-players');
  checkPlayerBoxe('adc-players');
  checkPlayerBoxe('sup-players');
  checkPlayerBoxe('all-players');
// }




// const initBidPoints = () => {
//   console.log('ioio')

//   const forms = document.queryS
// const initBidPoints = () => {
//   console.log('ioio')

//   const forms = document.querySelectorAll('.modal-footer')
//   console.log(forms)

//   let input = document.querySelectorAll('.bid-points');
//   let btn = document.querySelector('#create-bid');

//   let roundBet = document.querySelector('#round-bet');
//   let total = document.querySelector('#total-amount');



//   btn.addEventListener('click', e => {
//     roundBet.innerText = parseInt(input.value, 10) + parseInt(roundBet.innerText, 10)
//     total.innerText = parseInt(total.innerText, 10) - parseInt(input.value, 10)
//   })
// }

// initBidPoints();electorAll('.modal-footer')
//   console.log(forms)

//   let input = document.querySelectorAll('.bid-points');
//   let btn = document.querySelector('#create-bid');

//   let roundBet = document.querySelector('#round-bet');
//   let total = document.querySelector('#total-amount');



//   btn.addEventListener('click', e => {
//     roundBet.innerText = parseInt(input.value, 10) + parseInt(roundBet.innerText, 10)
//     total.innerText = parseInt(total.innerText, 10) - parseInt(input.value, 10)
//   })
// }

// initBidPoints();

// initInputValidation('top_bid_points');
// initInputValidation('jun_bid_points');
// initInputValidation('mid_bid_points');
// initInputValidation('adc_bid_points');
// initInputValidation('sup_bid_points');
// initInputValidation('all_bid_points');


