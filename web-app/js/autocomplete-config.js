jQuery.noConflict();
jQuery(document).ready(function($){
    var agentsListLink = $("input[name='clientsListLink']").val()
    var beneficiaryListLink = $("input[name='clientsListLink']").val()
    var planholderListLink = $("input[name='clientsListLink']").val()
    $('#agent-autocomplete').click(function() {
        $('#agent-autocomplete').trigger("focus"); //or "click", at least one should work
    });
    $("#agent-autocomplete").autocomplete({
        source: function(request, response){
            $.ajax({
                url: agentsListLink,
                data: {
                    term: request.term,
                    agentId: $("#agentId").val(),
                    beneficiaryIds: $("#beneficiaryIds").val(),
                    planholderId: $("#planholderId").val()
                },
                success: function(data){
                    response(data);
                },
                error: function(){
                    alert("Unable to retrieve agents.")
                }
            });
        }, response: function(event, ui) {
            // ui.content is the array that's about to be sent to the response callback.
            if (ui.content.length === 0) {
                $("#agent\\.id").val("")
            }
        },
        minLength: 1,
        select: function(event, ui) {
            $("#agent\\.id").val(ui.item.id);
        }
    }).focus(function() {
            $(this).autocomplete('search', $(this).val())
    });

    $("#planholder-autocomplete").autocomplete({
        source: function(request, response){
            $.ajax({
                url: planholderListLink,
                data: {
                    term: request.term,
                    agentId: $("#agentId").val(),
                    beneficiaryIds: $("#beneficiaryIds").val(),
                    planholderId: $("#planholderId").val()
                },
                success: function(data){
                    response(data);
                },
                error: function(){
                    alert("Unable to retrieve plan holders.")
                }
            });
        },
        minLength: 1,
        select: function(event, ui) {
            $("#planHolder\\.id").val(ui.item.id);
        }
    }).focus(function() {
            $(this).autocomplete('search', $(this).val())
    });

    $("#beneficiary-autocomplete").autocomplete({
        source: function(request, response){
            $.ajax({
                url: beneficiaryListLink,
                data: {
                    term: request.term,
                    agentId: $("#agentId").val(),
                    beneficiaryIds: $("#beneficiaryIds").val(),
                    planholderId: $("#planholderId").val()
                },
                success: function(data){
                    response(data);
                },
                error: function(){
                    alert("Unable to retrieve beneficiaries.")
                }
            });
        },
        minLength: 1,
        select: function(event, ui) {
            $("#beneficiary-autocomplete-id").val(ui.item.id);
        }
    }).focus(function() {
            $(this).autocomplete('search', $(this).val())
    });

    $("#beneficiary-autocomplete").change(function() {
        var textValue = $('#beneficiary-autocomplete').val()
        if(textValue == "") {
            $("#beneficiary-autocomplete-id").val("");
        }
    });

    $("#agent-autocomplete").change(function() {
        var textValue = $('#agent-autocomplete').val()
        if(textValue == "") {
            $("#agent\\.id").val("");
        }
    });

    $("#planholder-autocomplete").change(function() {
        var textValue = $('#planholder-autocomplete').val()
        if(textValue == "") {
            $("#planHolder\\.id").val("");
        }
    });
});