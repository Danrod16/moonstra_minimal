import 'selectize/dist/js/selectize.min.js';
import 'selectize/dist/css/selectize.css';

const selectize = () => {
  $('.selectize').selectize({
    // create: true, (from example on selectize page)
    // sortField: 'text'
    maxItems: 1,
    create: function(input, callback) {
      $(".client-modal").modal();
      $("#client_company_name").val(input);

      $("#new_client_form").on("submit", function(e) {
        e.preventDefault();
        $.ajax({
          method: "POST",
          url: $(this).attr("action"),
          data: $(this).serialize(),
          success: function(response){
            callback({value: response.id, text: response.company_name});
            $(".client-modal").modal("toggle");
          }
        });
      });
    }
  });

  $('.selectize-deliverable').selectize({
    // create: true, (from example on selectize page)
    // sortField: 'text'
    create: function(input, callback) {
      $(".deliverable-modal").modal();
      $("#deliverable_name").val(input);

      $("#new_deliverable_form").on("submit", function(e) {
        e.preventDefault();
        $.ajax({
          method: "POST",
          url: $(this).attr("action"),
          data: $(this).serialize(),
          success: function(response){
            callback({value: response.id, text: response.title});
            $(".deliverable-modal").modal("toggle");
            console.log("closed")
          }
        });
      });
    }
  });

};

export { selectize };
