jQuery.noConflict();
jQuery(document).ready(function($){
    var clientListLink = $("input[name='clientsListLink']").val()
    var planholderListLink = $("input[name='planholderListLink']").val()
    $('#agent-autocomplete').click(function() {
        $('#agent-autocomplete').trigger("focus"); //or "click", at least one should work
    });
    $("#agent-autocomplete").autocomplete({
        source: function(request, response){
            $.ajax({
                url: clientListLink,
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
                url: clientListLink,
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
                url: clientListLink,
                data: {
                    term: request.term,
                    agentId: $("#agentId").val(),
//                    beneficiaryIds: $("#beneficiaryIds").val(),
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

    // Search Plan
    $('#plan-planholder-search-autocomplete').click(function() {
        $('#plan-planholder-search-autocomplete').trigger("focus"); //or "click", at least one should work
    });
    $("#plan-planholder-search-autocomplete").autocomplete({
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
                    alert("Unable to retrieve agents.")
                }
            });
        }, response: function(event, ui) {
            // ui.content is the array that's about to be sent to the response callback.
            if (ui.content.length === 0) {
                $("#planHolder\\.id").val("")
            }
        },
        minLength: 1,
        select: function(event, ui) {
            $("#planHolder\\.id").val(ui.item.id);
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

    $("#plan-planholder-search-autocomplete").change(function() {
        var textValue = $('#plan-planholder-search-autocomplete').val()
        if(textValue == "") {
            $("#agent\\.id").val("");
        }
    });
});