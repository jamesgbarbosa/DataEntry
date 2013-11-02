jQuery.noConflict();
jQuery(document).ready(function($){

    $("#info").bind('DOMSubtreeModified', function() {
        jQuery('.docType').change(function($){
            var docType = jQuery(this).val()
            var num = jQuery(this).attr('id').split("_")[1]
            var newFileNameAr = jQuery('#newFilename_'+num).html().split("_")
            newFileNameAr[1] = docType
            jQuery('#newFilename_'+num).html(newFileNameAr.join("_"))
            jQuery("input[name='hnewFilename_"+num + "']").val(newFileNameAr.join("_"))
        });
    });

    $("#files").change(function() {
        var policyNumber = document.getElementById ("policyNumber").value.trim();
        var docDate = document.getElementById ("docDate").value.replace(/\//g, '');
        if(policyNumber == "" || docDate == "") {
        } else {
            preview()
        }
    });

    $("#docDate").change(function() {
        var policyNumber = document.getElementById ("policyNumber").value.trim();
        if(policyNumber == "" || $('#files').val() == "") {
        } else {
            preview()
        }
    });

    $("#policyNumber").change(function() {
        var docDate = document.getElementById ("docDate").value.replace(/\//g, '');
        if(docDate == "" || $('#files').val() == "") {
        } else {
            preview()
        }
    });

    $('#submit').click(function($){
        jQuery('#rename').submit()
    });
});

function preview() {

    var fileInput = document.getElementById ("files");
    var policyNumber = document.getElementById ("policyNumber").value.trim();
    var docDate = document.getElementById ("docDate").value.replace(/\//g, '');
    var message = "";
    if ('files' in fileInput) {
        if (fileInput.files.length == 0) {
            message = "Please browse for one or more files.";
        } else if(policyNumber == "" || docDate == "") {
            message = "";
        } else {
            message += "<table>"
            message += "<tr>" +
                    "<td>" +
                        "File Name" +
                    "</td>" +
                        "<td>" +
                        "Doc Type"  +
                     "</td>" +
                     "<td>" +
                         "New Filename" +
                    "</td>" +
                "</tr>"
            for (var i = 0; i < fileInput.files.length; i++) {
                var file = fileInput.files[i];
                message += "<tr>" +
                            "<td>"
                if ('name' in file) {
                    message += file.name + "<br />";
                }
                else {
                    message += file.fileName + "<br />";
                }
                message += "</td>"  +
                            "<td>" +
                    "<select class = 'docType' id='fileDoctype_"+ (i+1) +"'> "
                    +"<option value='docx'>docx</option>"
                    +"<option value='xls'>xls</option>"
                    +"<option value='odt'>odt</option>"
                message += "</select>"
                message += "</td>"

                var newFileName = policyNumber + "_docx_" + (i+1)  + "_" + docDate + "." + file.name.split('.').pop()

                message += "<td>" +
                           "<div id ='newFilename_" + (i+1) + "'>"  +newFileName  +
                           "</div>" +
                           "<input type='hidden' name='hnewFilename_" + (i+1) + "' value='"+ newFileName +"'/>" +
                           "</td>"
                message += "</tr>"
            }
            message+= "<tr><td colspan='3'><input type='submit' name='_action_rename' value='Submit' id='submit-rename'></td></tr>"
            message+= "</table>"

        }
    }
    else {
        if (fileInput.value == "") {
            message += "Please browse for one or more files.";
            message += "<br />Use the Control or Shift key for multiple selection.";
        }
        else {
            message += "Your browser doesn't support the files property!";
            message += "<br />The path of the selected file: " + fileInput.value;
        }
    }
    var info = document.getElementById ("info");
    info.innerHTML = message;
}