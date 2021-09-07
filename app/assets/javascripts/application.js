// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.mask
//= require_tree .

$(document).ready(function(){
    $("#telefone").keyup(function() {
        $("#telefone").mask("(999) 99999-9999");
    });

    $("#cpfOuCnpj").keydown(function() {
        try {
            $("#cpfOuCnpj").unmask();
        } catch (e) {}

        var tamanho = $("#cpfOuCnpj").val().length;

        if(tamanho < 11){
            $("#cpfOuCnpj").mask("999.999.999-99");
        } else {
            $("#cpfOuCnpj").mask("99.999.999/9999-99");
        }
    });
});

