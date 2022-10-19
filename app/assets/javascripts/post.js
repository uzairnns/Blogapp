
window.onload = function() {
  const d =document.querySelectorAll('.comment-form-display')
  console.log(d)
  document.querySelectorAll('.comment-form-display').forEach((el)=>{
    console.log(el.length);
    el.addEventListener('click',(ev)=>{
      ev.preventDefault();
      el.nextElementSibling.style ='display: block;'
    })
    })
};
