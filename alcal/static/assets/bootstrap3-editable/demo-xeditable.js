
/**
 * Theme: Montran Admin Template
 * Author: Coderthemes
 * Demo: Editable (Inline editing)
 *
 */


$(function(){

    //modify buttons style
    $.fn.editableform.buttons =
        '<button id="ok" type="submit"  class="btn btn-success editable-submit btn-sm"><i class="md md-done"></i></button>' +
        '<button type="button" class="btn editable-cancel btn-sm"><i class="md md-clear"></i></button>';

    //editables 
    $('#username').editable({
        type: 'text',
        pk: 1,
        name: 'username',
        title: 'Enter username'
    });

    $('#firstname').editable({
        validate: function(value) {
            if($.trim(value) == '') return 'This field is required';
        }
    });

    $('#sex').editable({
        prepend: "not selected",
        source: [
            {value: 1, text: 'Male'},
            {value: 2, text: 'Female'}
        ],
        display: function(value, sourceData) {
            var colors = {"": "gray", 1: "green", 2: "blue"},
                elem = $.grep(sourceData, function(o){return o.value == value;});

            if(elem.length) {
                $(this).text(elem[0].text).css("color", colors[value]);
            } else {
                $(this).empty();
            }
        }
    });

    $('#status').editable();

    $('#group').editable({
        showbuttons: false
    });

    $('#dob').editable();

    $('#comments').editable({
        showbuttons: 'bottom'
    });



    //inline


    $('#inline-username').editable({
        type: 'text',
        pk: 1,
        name: 'username',
        title: 'Enter username',
        mode: 'inline'
    });

    $('#inline-firstname').editable({
        validate: function(value) {
            if($.trim(value) == '') return 'This field is required';
        },
        mode: 'inline'
    });

    $('#inline-sex').editable({
        prepend: "not selected",
        mode: 'inline',
        source: [
            {value: 1, text: 'Male'},
            {value: 2, text: 'Female'}
        ],
        display: function(value, sourceData) {
            var colors = {"": "gray", 1: "green", 2: "blue"},
                elem = $.grep(sourceData, function(o){return o.value == value;});

            if(elem.length) {
                $(this).text(elem[0].text).css("color", colors[value]);
            } else {
                $(this).empty();
            }
        }
    });
    $('#inline-inasistencia, #inline-inasistencia2, #inline-inasistencia3').editable({
        prepend: "P",
        mode: 'inline',
        method: 'submit',
        source: [
            {value: 1, text: 'A'},
            {value: 2, text: 'T'},
            {value: 3, text: 'R'},
            {value: 4, text: '-'}
        ],
        display: function(value, sourceData) {
            var colors = {"P": "green", 1: "red", 2: "blue", 3: "orange", 4: "gray"},
                elem = $.grep(sourceData, function(o){return o.value == value;});
            $(this).text(elem[0].text).css("color", "green");
            if(elem.length) {
                $(this).text(elem[0].text).css("color", colors[value]);
            } else {
                $(this).empty().css("color","green");
            }
        }
    });
    $('#inline-curso').editable({
        prepend: "-",
        mode: 'inline',
        method: 'submit',
        source: [
            {value: 1, text: 'Apellido'},
            {value: 2, text: 'Nombre'},
            {value: 3, text: 'Legajo'},
            {value: 4, text: 'Curso'}
        ],
        display: function(value, sourceData) {
            var colors = {"P": "green", 1: "red", 2: "blue", 3: "orange", 4: "gray"},
                elem = $.grep(sourceData, function(o){return o.value == value;});
            $(this).text(elem[0].text).css("color", "green");
            if(elem.length) {
                $(this).text(elem[0].text).css("color", colors[value]);
            } else {
                $(this).empty().css("color","green");
            }
        }
    });

    $('#inline-status').editable({mode: 'inline'});

    $('#inline-group').editable({
        showbuttons: false,
        mode: 'inline'
    });

    $('#inline-dob').editable({mode: 'inline'});

    $('#inline-comments').editable({
        showbuttons: 'bottom',
        mode: 'inline'
    });


});