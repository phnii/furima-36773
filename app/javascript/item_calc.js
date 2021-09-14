function calc (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup", () => {
    const itemPrice = priceInput.value
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = itemPrice*0.1;
    profit.innerHTML = itemPrice*0.9;
  });
};

window.addEventListener('load', calc);