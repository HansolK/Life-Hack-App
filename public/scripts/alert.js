var saveBtn = document.querySelector(".new_idea_page .save")
var form = document.querySelector('.new_ideas')
var inputs = form.querySelectorAll('input, select, textarea')

const validators = {
  title: function(input) {
    if (input.value === "") {
      return "You probably should put a title"
    }

    return null
  },
  category_id: function(select) {
    if (select.value === "0") {
      return "Please select the category"
    }

    return null
  },

  description: function(textarea) {
    if (textarea.value === "") {
      return "Please explain how to solve the problem!"
    }
  }
}

function isFilled(event) {
  for(let i = 0; i < inputs.length; i++) {
    const isValid = validators[inputs[i].name]
    const result = isValid(inputs[i])

    if (result) {
      alert(result)
      event.preventDefault()
      return
    } 
  }

}

saveBtn.addEventListener('click', isFilled)