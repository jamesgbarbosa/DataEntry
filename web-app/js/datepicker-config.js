jQuery.noConflict();
jQuery(document).ready(function($){
    $('#docDate').datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "1900:2013"
        });
     $('#birthdate').datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "1900:2013"
        });
    $('#appointmentDate').datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "1920:2100"
        });

    $('#origIssueDate').datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "1920:2100"
    });
    $('#currentIssueDate').datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "1920:2100"
    });
    $('#applicableDate').datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "1920:2100"
    });
     $('#effectiveDate').datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "1920:2100"
        });
     $('#filingDate').datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "1920:2100"
    });
     $('#dateCreated').datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "1920:2100"
        });

    $("#agent-autocomplete").autocomplete({
        source: function(request, response){
            $.ajax({
                url: "/DataEntry/plan/agentslist", // remote datasource
                data: request,
                success: function(data){
                    response(data); // set the response
                },
                error: function(){ // handle server errors
                    alert("Unable to retrieve agents.")
                }
            });
        },
        minLength: 1, // triggered only after minimum 1 characters have been entered.
        select: function(event, ui) { // event handler when user selects a company from the list.
            $("#agent\\.id").val(ui.item.id); // update the hidden field.
        }
    });

    $("#planholder-autocomplete").autocomplete({
        source: function(request, response){
            $.ajax({
                url: "/DataEntry/plan/planholderslist", // remote datasource
                data: request,
                success: function(data){
                    response(data); // set the response
                },
                error: function(){ // handle server errors
                    alert("Unable to retrieve plan holders.")
                }
            });
        },
        minLength: 1, // triggered only after minimum 1 characters have been entered.
        select: function(event, ui) { // event handler when user selects a company from the list.
            $("#planHolder\\.id").val(ui.item.id); // update the hidden field.
        }
    });

    $("#beneficiary-autocomplete").autocomplete({
        source: function(request, response){
            $.ajax({
                url: "/DataEntry/plan/beneficiarieslist", // remote datasource
                data: request,
                success: function(data){
                    response(data); // set the response
                },
                error: function(){ // handle server errors
                    alert("Unable to retrieve beneficiaries.")
                }
            });
        },
        minLength: 1, // triggered only after minimum 1 characters have been entered.
        select: function(event, ui) { // event handler when user selects a company from the list.
            $("#beneficiary\\.id").val(ui.item.id); // update the hidden field.
        }
    });



});