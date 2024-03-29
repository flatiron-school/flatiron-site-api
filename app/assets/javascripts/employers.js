$(function() {
  
  //Helper preserves width of cells
  var fixHelper = function(e, ui) {
    ui.children().each(function() {
      $(this).width($(this).width());
    });
    return ui;
  };

  $("#sort tbody").sortable({
    helper: fixHelper,

    update: function(){ //when we update order update employers array

      var employers = []; //create an empty employers array 

      $("#sort tbody tr").each(function(i, company){
        var employer_id = $(this).find('.position').data('id'); //get the emloyers actual id
        employers.push({e_id: employer_id}); //track new position by index in array.
      });

      console.log(employers);
      // [{"e_id":2},{"e_id":1},{"e_id":3}]

      $.post( '/employers_sort', {"employers": employers}, function(employers){

        console.log(employers);

        $('#sort tbody').empty(); //clear out table rows from tbody

        $(employers).each(function(i, employer) { //append each row back in the updated position order.
          $('#sort tbody').append('<tr> \
                <td data-id="'+employer.id+'" class="position">'+employer.position+'</td> \
                <td>'+employer.title+'</td> \
                <td class="url">'+employer.img_file_name+'</td> \
                <td>'+employer.student+'</td> \
                <td>'+employer.before_flatiron+'</td> \
                <td>'+employer.after_flatiron+'</td> \
                <td class="change"><a href="/employers/'+employer.id+'">Show</a></td> \
                <td class="change"><a href="/employers/'+employer.id+'/edit">Edit</a></td> \
                <td class="change"><a href="/employers/'+employer.id+'" data-confirm="Are you sure?" data-method="delete" rel="nofollow">Destroy</a></td> \
              </tr>');
        });
      }); //AJAX post the data.

    }

  }).disableSelection();
});
