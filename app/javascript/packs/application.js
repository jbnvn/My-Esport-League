import "bootstrap";
import { initFilterPlayers } from '../components/filter';
initFilterPlayers();
import { checkPlayerBoxe } from '../components/filter';

import {initInputValidation} from '../components/key';
import {validateForm2} from '../components/key';

import { initShowPlayers } from '../components/filter';
initShowPlayers();

document.addEventListener('DOMContentLoaded', event => {

  document.validateForm2 = validateForm2;
});

checkPlayerBoxe('top-players');
checkPlayerBoxe('jungle-players');
checkPlayerBoxe('mid-players');
checkPlayerBoxe('adc-players');
checkPlayerBoxe('support-players');
checkPlayerBoxe('all-players');

initInputValidation('top_bid_points');
initInputValidation('jungle_bid_points');
initInputValidation('mid_bid_points');
initInputValidation('adc_bid_points');
initInputValidation('support_bid_points');
initInputValidation('all_bid_points');


