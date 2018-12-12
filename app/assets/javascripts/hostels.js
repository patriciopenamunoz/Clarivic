function changeCommunes(regions_select, communes_select) {
  let communes_fist_value = $('option', communes_select)[0];
  $('option', communes_select).remove();
  $(communes_select).append(communes_fist_value);
  $.get({
    url: '/api/region/'+regions_select.value,
    dataType: 'json'
  })
  .done(function(json) {
    json.communes.forEach((e) => {
      $(communes_select).append(new Option(e.short_name, e.id));
    });
  })
  .fail(function(error) { console.log(error) });
}
