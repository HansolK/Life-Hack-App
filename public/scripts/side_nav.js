const categoryContainer = document.querySelector("#choose_category")
const category = document.querySelector("#choose_category a")

category.addEventListener('click', function(event){
  categoryContainer.classList.toggle("hidden")
});