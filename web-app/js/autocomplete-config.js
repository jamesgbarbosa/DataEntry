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
    }).focus(function() {
            $(this).autocomplete('search', $(this).val())
    });

    $("#planholder-autocomplete").autocomplete({
        source: function(request, response){
            $.ajax({
                url: planholderListLink,
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
    }).focus(function() {
            $(this).autocomplete('search', $(this).val())
    });

    $("#beneficiary-autocomplete").autocomplete({
        source: function(request, response){
            $.ajax({
                url: beneficiaryListLink,
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
            $("#beneficiary-autocomplete-id").val(ui.item.id);
        }
    }).focus(function() {
            $(this).autocomplete('search', $(this).val())
    });
});