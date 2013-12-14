jQuery.noConflict();
jQuery(document).ready(function($){
    var clientListLink = $("input[name='clientsListLink']").val()
    var planholderListLink = $("input[name='planholderListLink']").val()
    var zipcodesListLink = $("input[name='zipcodesListLink']").val()
    $('#agent-autocomplete').click(function() {
        $('#agent-autocomplete').trigger("focus"); //or "click", at least one should work
    });
    $("#agent-autocomplete").autocomplete({
        source: function(request, response){
            $.ajax({
                url: clientListLink,
                data: {
                    term: request.term,
                    agentId: $("#agentId").val()
//                    beneficiaryIds: $("#beneficiaryIds").val()
//                    planholderId: $("#planholderId").val()
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
//                    agentId: $("#agentId").val(),
                    planholder: true,
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
            $("#planHolderCompany\\.id").val(ui.item.companyId);

            if(ui.item.id == undefined) {
                $("#planHolder\\.id").val("");
            }
            if(ui.item.companyId == undefined) {
                $("#planHolderCompany\\.id").val("");
            }
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
                    beneficiary: true,
//                    agentId: $("#agentId").val(),
//                    beneficiaryIds: $("#beneficiaryIds").val(),
                    planholderId: $("#planholderId").val(),
                    planholderCompanyId: $("#planholderCompanyId").val()
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
            $("#beneficiaryCompany\\.id").val(ui.item.companyId);

            if(ui.item.id == undefined) {
                $("#beneficiary-autocomplete-id").val("");
            }
            if(ui.item.companyId == undefined) {
                $("#beneficiaryCompany\\.id").val("");
            }
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
                    alert("Unable to retrieve planholders.")
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
            $("#planHolder").val(ui.item.id);
            $("#planHolderCompany").val(ui.item.companyId);

            if(ui.item.id == undefined) {
                $("#planHolder").val("");
            }
            if(ui.item.companyId == undefined) {
                $("#planHolderCompany").val("");
            }
        }
    }).focus(function() {
            $(this).autocomplete('search', $(this).val())
    });

    $("#zipcodes-autocomplete").autocomplete({
        source: function(request, response){
            $.ajax({
                url: zipcodesListLink,
                data: {
                    term: request.term
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
            $("#zipcode\\.id").val(ui.item.code);
            $("#city").val(ui.item.city);
            $("#province").val(ui.item.province);
        }
    }).focus(function() {
            $(this).autocomplete('search', $(this).val())
    });

    $("#zipcodes-autocomplete").change(function() {
        var textValue = $('#zipcodes-autocomplete').val()
        if(textValue == "") {
            $("#city").val("");
            $("#province").val("");
        }
    });

    $("#beneficiary-autocomplete").change(function() {
        var textValue = $('#beneficiary-autocomplete').val()
        if(textValue == "") {
            $("#beneficiary-autocomplete-id").val("");
            $("#beneficiaryCompany\\.id").val("");
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
            $("#planHolderCompany\\.id").val("");

        }
    });

    $("#plan-planholder-search-autocomplete").change(function() {
        var textValue = $('#plan-planholder-search-autocomplete').val()
        if(textValue == "") {
            $("#planHolder").val("");
            $("#planHolderCompany").val("");
        }
    });
});