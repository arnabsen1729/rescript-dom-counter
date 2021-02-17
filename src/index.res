@val external document: {..} = "document"

let count = ref(0)

let updateCount = countFn => {
  let countNode = document["getElementById"]("count")
  countNode["innerText"] = `Count is ${Belt.Int.toString(countFn(count))}`
}

let increment = n => {
  let initialVal = n.contents
  n := initialVal + 1
  n.contents
}
let decrement = n => {
  let initialVal = n.contents
  n := initialVal - 1
  n.contents
}

let getClassName = n => {
  if n > 0 {
    "count-positive"
  } else if n < 0 {
    "count-negative"
  } else {
    "count-zero"
  }
}

let updateClass = () => {
  let countNode = document["getElementById"]("count")
  countNode["className"] = `count ${getClassName(count.contents)}`
}

let plusBtn = document["getElementById"]("plus-one")
let minusBtn = document["getElementById"]("minus-one")
plusBtn["addEventListener"]("click", () => {
  updateCount(increment)
  updateClass()
})
minusBtn["addEventListener"]("click", () => {
  updateCount(decrement)
  updateClass()
})
