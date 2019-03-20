$(document).on('turbolinks:load', function() {

    console.log('ãshiuhdoaiudhoiaudhaioud');
    $('#asdfasf').click(function(){ 
        startModal();
        $('select').formSelect();
     });

     $('.dropdown-trigger').dropdown({
        constrainWidth: false
     });
});

function checkFile() {
    $("#docFilesUpload").removeClass("disabled");  
}