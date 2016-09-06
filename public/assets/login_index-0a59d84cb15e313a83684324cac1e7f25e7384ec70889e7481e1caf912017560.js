 $("#join_button").click(function(event){
		 event.preventDefault();
	 
	 $('form').fadeOut(500);
	 $('.wrapper').addClass('form-success');
             setTimeout(func, 1500);
             function func() {
                 location.href = "/signup";
}
             
});
