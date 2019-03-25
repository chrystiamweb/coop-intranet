document.addEventListener("turbolinks:load", function() {
    $input = $("[data-behavior='autocomplete']")
  
    var options = {
      getValue: "name",
      url: function(phrase) {
        return "/search.json?q=" + phrase;
      },
      categories: [
        {
          listLocation: "clients",
          header: "<strong>Associado</strong>",
        }
      ],
      list: {
        onChooseEvent: function() {
          $input.val("")
          $('#cpfcnjp').unmask()
          $('#cpfcnjp').val($input.getSelectedItemData().cpfcnpj.toString())
          $('#namesearch').val($input.getSelectedItemData().name)
          $('#requisition_client_id').val($input.getSelectedItemData().id)
          var masks = ['000.000.000-000', '00.000.000/0000-00']
          var mask = ($("#cpfcnjp").val().length > 13) ? masks[1] : masks[0]
			    $('#cpfcnjp').mask(mask)
        }
      }
    }
  
    $input.easyAutocomplete(options)
  });