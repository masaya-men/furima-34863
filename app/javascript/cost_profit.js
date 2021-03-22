function cost_profit() {
  const itemPrice = document.getElementById("item-price");
  const itemCost = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener("input", () => {
    const valuePrice = itemPrice.value;
    const valueCost = Math.floor(valuePrice * 0.1);
    const valueProfit = valuePrice - valueCost;
    itemCost.innerHTML = valueCost;
    profit.innerHTML = valueProfit;
  });
};

window.addEventListener('load', cost_profit);