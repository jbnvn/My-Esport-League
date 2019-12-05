import "bootstrap";
import { initFilterPlayers } from '../components/filter';
if(document.querySelector('.board-show')){
initFilterPlayers();
}
import { checkPlayerBoxe } from '../components/filter';

// import {initInputValidation} from '../components/key';
 import {validateFormButton} from '../components/key';
 if(document.querySelector('.board-show')){
 validateFormButton();
}

import { initShowPlayers } from '../components/filter';
 if(document.querySelector('.board-show')){
initShowPlayers();
}

// import { initFilterTabs } from '../components/tab';
// initFilterTabs();

// import { showAllPlayersInputs} from '../components/filter';
// showAllPlayersInputs();

// document.addEventListener('DOMContentLoaded', event => {

//   document.validateForm2 = validateForm2;
// });

 if(document.querySelector('.board-show')){
  checkPlayerBoxe('top-players');
  checkPlayerBoxe('jun-players');
  checkPlayerBoxe('mid-players');
  checkPlayerBoxe('adc-players');
  checkPlayerBoxe('sup-players');
  checkPlayerBoxe('all-players');
  }


// initInputValidation('top_bid_points');
// initInputValidation('jun_bid_points');
// initInputValidation('mid_bid_points');
// initInputValidation('adc_bid_points');
// initInputValidation('sup_bid_points');
// initInputValidation('all_bid_points');


