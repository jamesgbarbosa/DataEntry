jQuery.noConflict();
jQuery(document).ready(function($){
    var agentsListLink = $("input[name='agentsListLink']").val()
    var beneficiaryListLink = $("input[name='beneficiaryListLink']").val()
    var planholderListLink = $("input[name='planholderListLink']").val()
    $("#agent-autocomplete").autocomplete({
        source: function(request, response){
            $.ajax({
                url: agentsListLink,
                data: request,
                success: function(data){
                    response(data);
                },
                error: function(){
                    alert("Unable to retrieve agents.")
                }
            });
        },
        minLength: 1,
        select: function(event, ui) {
            $("#agent\\.id").val(ui.item.id);
        }
    });

    $("#planholder-autocomplete").autocomplete({
        source: function(request, response){
            $.ajax({
                url: beneficiaryListLink,
                data: request,
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
    });

    $("#beneficiary-autocomplete").autocomplete({
        source: function(request, response){
            $.ajax({
                url: planholderListLink,
                data: request,
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
            $("#beneficiary\\.id").val(ui.item.id);
        }
    });



});