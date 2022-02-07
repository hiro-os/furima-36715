function price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
     console.log(addTaxDom);
    const profitNumber = document.getElementById("profit")
    profitNumber.innerHTML = (Math.floor(inputValue - inputValue * 0.1));
      console.log(profitNumber);
  });
};
window.addEventListener('load', price);