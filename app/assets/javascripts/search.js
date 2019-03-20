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
          $('#cpfcnjp').val($input.getSelectedItemData().cpfcnpj)
          $('#namesearch').val($input.getSelectedItemData().name)
          $('#requisition_client_id').val($input.getSelectedItemData().id)
        }
      }
    }
  
    $input.easyAutocomplete(options)
  });