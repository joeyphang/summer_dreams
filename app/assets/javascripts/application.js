// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockcountryets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

document.addEventListener("DOMContentLoaded", function(){
  $('#title').on('keypress', function(e){
   $.ajax({
     url: 'search',
     method: 'GET',
     data: $(this).serialize(),
     dataType: 'json',
     success: function(data){
       let check_product_title = document.getElementById("check_product_title");
       check_product_title.innerHTML = "";

       data.forEach(function(product){
         const option = document.createElement("option");

         option.value = product.title;
         check_product_title.append(option);
       })
     }
   })
 });
})

document.addEventListener("DOMContentLoaded", function(){
	$('#destroy').on('click', function(){
		if(confirm("Are you sure?")){
			$.ajax({
				url: "/products/" + this.parentElement.id,
				method: "DELETE",
				success: function(r){

				}
		});
		}
	});
});
