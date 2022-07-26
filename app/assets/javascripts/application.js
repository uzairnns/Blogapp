// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require jquery_ujs
//= require tinymce

import Rails from 'rails-ujs'
Rails.start()

document.querySelectorAll('.comment-form-display').forEach((el)=>{
  el.addEventListener('click',(ev)=>{
    ev.preventDefault();
    el.nextElementSibling.style ='display: block;'
  })
  })

  tinymce.init({
    selector: 'textarea',  // change this value according to your HTML
    plugins: 'image',
    menubar: 'insert',
    toolbar: 'image',
    image_list: [
      {title: 'My image 1', value: 'https://www.example.com/my1.gif'},
      {title: 'My image 2', value: 'http://www.moxiecode.com/my2.gif'}
    ]
  });


