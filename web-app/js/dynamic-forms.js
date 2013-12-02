jQuery.noConflict();
jQuery(document).ready(function($){
    $("#updateMe").bind('DOMSubtreeModified', function() {
    });

    $("#dialog-confirm").dialog({
        autoOpen : false,
        height : 'auto',
        width : 'auto',
        modal : true,
        bgiframe : true,
        cache: false,
        resizable : false,
        open : function() {
            $('.ok').blur();
        }
    });

    $('#open-save-plan-dialog').click(function() {
        $("#dialog-confirm").dialog("open");
    });

    $('#confirm-cancel-form').click(function() {
        $("#dialog-confirm").dialog("close");
    });

    $("#delete-beneficiary-dialog-confirm").dialog({
        autoOpen : false,
        height : 'auto',
        width : 'auto',
        modal : true,
        bgiframe : true,
        cache: false,
        resizable : false,
        open : function() {
            $('.ok').blur();
        }
    });

    //Hide delete beneficiary button
    $('#delete-beneficiary').hide()

    $('#open-delete-beneficiary-dialog').click(function() {
        $('.deleteBeneficiaryCB:checked').each(function() {
            $("#delete-beneficiary-dialog-confirm").dialog("open");
        });
    });

    $('#confirm-delete-beneficiary').click(function(){
        $('#delete-beneficiary').trigger('click')
    });

    $('#confirm-cancel-delete-beneficiary-form').click(function() {
        $("#delete-beneficiary-dialog-confirm").dialog("close");
    });

    $("#delete-amendment-dialog-confirm").dialog({
        autoOpen : false,
        height : 'auto',
        width : 'auto',
        modal : true,
        bgiframe : true,
        cache: false,
        resizable : false,
        open : function() {
            $('.ok').blur();
        }
    });

    $('#delete-amendment').hide()

    $('#open-delete-amendment-dialog').click(function() {
        $('.deleteAmendmentCB:checked').each(function() {
            $("#delete-amendment-dialog-confirm").dialog("open");
        });
    });

    $('#confirm-delete-amendment').click(function(){
        $('#delete-amendment').trigger('click')
    });

    $('#confirm-cancel-delete-amendment-form').click(function() {
        $("#delete-amendment-dialog-confirm").dialog("close");
    });


    $("#delete-plan-dialog-confirm").dialog({
        autoOpen : false,
        height : 'auto',
        width : 'auto',
        modal : true,
        bgiframe : true,
        cache: false,
        resizable : false,
        open : function() {
            $('.ok').blur();
        }
    });

    $('#delete-plan').hide()

    $('#open-delete-plan-dialog').click(function() {
            $("#delete-plan-dialog-confirm").dialog("open");
    });

    $('#confirm-delete-plan').click(function(){
        $('#delete-plan').trigger('click')
    });

    $('#confirm-cancel-delete-plan-form').click(function() {
        $("#delete-plan-dialog-confirm").dialog("close");
    });


    if($("input[name='red']").val() == "true") {
        $('.fieldcontain').removeClass('error')
        $('.errors').hide()
        $('.inlineErrors').hide()
    }


});