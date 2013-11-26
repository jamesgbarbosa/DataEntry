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

    if($("input[name='red']").val() == "true") {
        $('.fieldcontain').removeClass('error')
        $('.errors').hide()
        $('.inlineErrors').hide()
    }


});