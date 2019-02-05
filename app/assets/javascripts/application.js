// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui-package/jquery-ui
//= require bootstrap.min
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require leaflet/dist/leaflet
//= stub active_admin
//= require_tree .
document.addEventListener('turbolinks:load',() => {
  let datepicker_esp = {
    closeText: 'Cerrar',
    prevText: 'Anterior',
    nextText: 'Siguiente',
    currentText: 'Hoy',
    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
    dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
    dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
    dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
    weekHeader: 'Sm',
    dateFormat: 'dd/mm/yy',
    firstDay: 1,
    isRTL: false,
    showMonthAfterYear: false,
    yearSuffix: ''
  }

  $('.based-datepicker').datepicker( {dateFormat: 'dd/mm/yy'} );
  [].slice.call(document.getElementsByClassName('datepicker')).forEach((picker) => {
    let based = [].slice
                  .call(document.getElementsByClassName('based-datepicker'))
                  .find((b) => b.dataset.based == picker.id);
    if (based == undefined) {
      $('.datepicker').datepicker($.extend({minDate: new Date()}, datepicker_esp));
    }else{
      $('.datepicker').datepicker($.extend(
        {
          minDate: new Date(),
          dateFormat: 'dd/mm/yy',
          onSelect: (dateText, inst) => {
            $(based).datepicker("option", "minDate", picker.value);
          }
        }, datepicker_esp));
      $(based).datepicker("option", "minDate", picker.value);
    }
  });
});
