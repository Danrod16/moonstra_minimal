import 'selectize/dist/js/selectize.min.js';
import 'selectize/dist/css/selectize.css';

const selectize = () => {
  $('.selectize').selectize({
    // create: true, (from example on selectize page)
    // sortField: 'text'
    //maxItems: 3
    create: function(input, callback) {
      $(".client-modal").modal();
      $("#client_name").val(input);
    //   $("#new_client").on("submit", function(e) {
    //     e.preventDefault();
    //     $ajax({
    //       method: "POST",
    //       url: $(this).serialize(),
    //       data: $(this).serialize(),
    //       success: function(response){
    //         console.log(response)
    //       }
    //     });
    //   });
    }
  });

};

export { selectize };
