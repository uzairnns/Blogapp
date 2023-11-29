// window.onload = function() {

// };
// $(document).on('ready', function () {
//   document.querySelectorAll('.comment-form-display').forEach((el)=>{
//     // console.log(el.length);
//     el.addEventListener('click',(ev)=>{
//       ev.preventDefault();
//       el.nextElementSibling.style ='display: block;'
//     })
//     })
// });

// $(document).on 'click', '.button', ->
$(document).on("turbolinks:load", function () {
  document.querySelectorAll(".comment-form-display").forEach((el) => {
    // console.log(el.length);
    el.addEventListener("click", (ev) => {
      ev.preventDefault();
      el.nextElementSibling.style = "display: block;";
    });
  });
});
