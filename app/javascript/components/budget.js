const sumAll = (e)=>{
  const inputs = Array.from(document.querySelectorAll('input[type=number]'));
  let points = [];

  inputs.forEach((point) => {
    points.push(parseInt(point.value, 10))
  })

  const sum = points.reduce((acc, point)=>{
    if(point > 0){
      return acc + point;
    }
    return acc;

  }, 0);

  document.querySelector('#round-bet').innerText = sum;
  document.querySelector('#total-amount').innerText = 300000 - sum;

}


const initUpdateSum = () => {
  const buttons = document.querySelectorAll('.button-to-click');
  console.log(buttons)
  buttons.forEach((button)=>{
    button.addEventListener('click', sumAll);
  })
}


initUpdateSum();

export { initUpdateSum };
