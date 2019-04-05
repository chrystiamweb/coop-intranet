// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require momentjs
//= require html2canvas
//= require jquery
//= require ckeditor/init
//= require rails-ujs
//= require fullcalendar
//= require fullcalendar/locale-all
//= require activestorage
//= require materialize-sprockets
//= require jquery.easy-autocomplete
//= require jquery.mask.min
//= require datatables.min
//= require jquery.maskMoney
//= require turbolinks
//= require_tree .
//= require_self

function printDiv(id) {
    
    html2canvas(document.getElementById(id)).then(function(canvas){
        var WinPrint = window.open('', '','')
        WinPrint.document.write('<html mozNoMarginBoxes ><head> <style type="text/css" media="print">@page{size: auto;margin: 0mm;}body{margin: 0px;}</style></head><body></body></html>');
        WinPrint.document.body.appendChild(canvas);
        WinPrint.document.close();
        WinPrint.focus();
        WinPrint.print();
        WinPrint.close();
        
    });

    //html2canvas(document.getElementById(id)).then(function(canvas) {
    //    $('.testes').attr('href',canvas.toDataURL('image/png'));
    //    $('.testes').attr('download, TEST file.png');
    //    console.log( $('.testes'));
    //    //$('.testes')[0].click();
    //});
    
}