window.addEventListener('load', function(){
  
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {

  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (inputValue * 0.1)

  const addprofit = document.getElementById("profit");
    addprofit.innerHTML = (inputValue-(inputValue * 0.1))

})});
