// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
// require_tree .


$(document).ready(function() {
    console.log( "ready!" );
    $("#btnLogin").click(function(){
        username = $("#username").val();
        password = $("#password").val();
        if(username == "" || password == ""){alert("Please enter username and password.");}
        $.ajax({
            url:"/login",
            data:{
                username: username,
                password: password
            },
            type:"POST",
            dataType: 'json',
            success:function(response) {
                if(response.err != null){
                    alert(response.err);
                }else{window.location.reload();}

                //window.location = window.location.href
            },
            error:function(){
                alert("Somthing went wrong");
            },
            complete:function(response){
            }
        });
    });

});