jQuery.noConflict();
jQuery(document).ready(function($){
    $("#updateMe").bind('DOMSubtreeModified', function() {
    });

    $('#addBeneficiaryButton').click(function(){

        var beneficiaryName = $('#beneficiary-autocomplete').val()
        var designation =  $('#designation').val()
        var relationship =  $('#relationship').val()
        var rowCount = $('#beneficiaries tbody tr').length - 1;
        var benId = $("input[name='beneficiary.id']").val()
        var canAdd = true
        if(benId == "") {
           alert("Please select a client.")
        } else {
            $("#beneficiaries tbody tr").each(function() {
                var value = $(this).find(".benId").val();
                if(value == benId) {
                    canAdd = false
                }
            });

            if(canAdd == false) {
                alert("The client is already added on the list.")
            } else {
                $('#beneficiaries tr:last').after('<tr>' +
                    '<td>' + "<input type='hidden' class='benId' name='benId' value='" + benId +"' /> "+ (rowCount + 1) +'</td>' +
                    '<td>' + beneficiaryName +'</td>' +
                    '<td>' + designation +'</td>' +
                    '<td>' + relationship +'</td>' +
                    '<td>' + "<input class='deleteBeneficiaryCB' type='checkbox' name='deleteBeneficiary" + +(rowCount+1) +"'/> " +'</td>' +
                    '</tr>');
            }
            $('#beneficiary-autocomplete').val("")
            $('#beneficiary-autocomplete-id').val("")
        }

    });

    $('#deleteBeneficiaryButton').click(function(){
        $("#beneficiaries tbody tr").each(function() {
            var value = $(this).find(".deleteBeneficiaryCB").prop('checked');
            if(value==true) {
                this.remove()
            }
        });
    });


    $('#addAmendmentButton').click(function(){
        var amendmentType = $('#amendmentType').val()
        var approvedBy =  $('#approvedBy').val()
        var filingDate =  $('#filingDate').val()
        var effectiveDate =  $('#effectiveDate').val()

        var rowCount = $('#amendments tbody tr').length - 1;

                $('#amendments tr:last').after('<tr>' +
                    '<td>' + (rowCount + 1) +'</td>' +
                    '<td>' + "<input type='hidden' class='benId' name='benId' value='amendmentType" + (rowCount + 1) +"' /> " + amendmentType +'</td>' +
                    '<td>' + "<input type='hidden' class='benId' name='benId' value='approvedBy" + (rowCount + 1) +"' /> "+ approvedBy +'</td>' +
                    '<td>' + "<input type='hidden' class='benId' name='benId' value='filingDate" + (rowCount + 1) +"' /> "+ filingDate +'</td>' +
                    '<td>' + "<input type='hidden' class='benId' name='benId' value='approvedBy" + (rowCount + 1) +"' /> "+ approvedBy +'</td>' +
                    '<td>' + "<input class='deleteAmendmentCB' type='checkbox' name='deleteAmendment'/> " +'</td>' +
                    '</tr>');
    });

    $('#deleteAmendmentButton').click(function(){
        $("#amendments tbody tr").each(function() {
            var value = $(this).find(".deleteAmendmentCB").prop('checked');
            if(value==true) {
                this.remove()
            }
        });

    });
});