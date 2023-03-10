var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);

function validateSuccess(controlId) {
    $('#' + controlId).parent().removeClass('has-error').addClass('has-success');
}
function validateError(controlId, message) {
    var parent = $('#' + controlId).parent()
    parent.addClass('has-error');
    $("#msg").remove();
    $(parent).append("<small id='msg' class='help-block'>" + message + "</small>");
    $('#msg').css("display", "block");
    $('#' + controlId).focus();
    setTimeout(function () {
        $("#msg").slideUp(2000, function () {
            $("#msg").remove();
        });
    }, 2000);
}

function MobileValidation(txt, msg) {
    if (txt.value != "") {
        var mobno = txt.value.split(',');
        for (var i = 0; i < mobno.length; i++) {
            {
                if (mobno[i].length < 10 || mobno[i].length > 10) {
                    validateError(txt.id, msg);
                    txt.focus();
                    return false;
                }
                else {
                    validateSuccess(txt.id);
                }
            }
        }
    }
}
function NumberCommaOnly(e) { //------------ onkeypress="NumberCommaOnly(event);"
    if (e.which != 8 && e.which != 0 && e.which != 44 && (e.which < 48 || e.which > 57)) {
        return false;
    }
}
function NumbersOnly(evt) { //------------ onkeypress="NumbersOnly(event);"
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
    if (charCode == 8)
        return true;
    if (parseInt(charCode) != 13) {
        if (charCode > 31 && charCode < 48 || charCode > 57) {
            return false;
        }
        return true;
    }
    else {
        return false;
    }
}

function OnlyNumber(e) { //------------ onkeypress="return OnlyNumber(event);"
    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        return false;
    }
}
function NoSpaceKey(e) { //------------ onkeypress="return NoSpaceKey(event);"
    if (e.which == 32) {
        return false;
    }
}
function EnterEvent(e) { //------------ onkeypress="return EnterEvent(event);"
    if (e.which == 32) {
        return false;
    }
    if (e.which == 13) {
        $('#ContentPlaceHolder1_btnSearchAdmnNo').click();
        return false;
    }
}
