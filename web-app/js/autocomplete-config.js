jQuery.noConflict();
jQuery(document).ready(function($){
    $("#agent-autocomplete").autocomplete({
        source: function(request, response){
            $.ajax({
                url: "/DataEntry/plan/agentslist",
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
                url: "/DataEntry/plan/planholderslist",
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
                url: "/DataEntry/plan/beneficiarieslist",
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