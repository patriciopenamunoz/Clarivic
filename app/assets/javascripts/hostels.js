document.addEventListener('turbolinks:load', function(){
  changeCommunes();
});

function changeCommunes() {
  $('#hostel_commune_id>option').remove();
  $.get({
    url: '/api/region/'+$('#hostel_region').val(),
    dataType: 'json'
  })
  .done(function(json) {
    json.communes.forEach((e) => {
      $('#hostel_commune_id').append(new Option(e.short_name, e.id));
    });
  })
  .fail(function(error) { console.log(error) });
}
