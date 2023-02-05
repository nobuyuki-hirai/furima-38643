window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price")

  priceInput.addEventListener('keyup', () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  })
})