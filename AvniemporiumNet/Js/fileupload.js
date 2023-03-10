
function uploadlogo() {   
    var data = new FormData();
    var id = "";
    var fileName = "";
    //replace the "Choose a file" label

    $('input[type=file]').each(function (i, fil) {
        if (this.files.length > 0) {
            var fuid = this.id;
            //fileName = this.val();
            jQuery.each(this.files, function (i, file) {
                id = id + "," + fuid;
                data.append('file-' + i, file);
            });
        }
    });

    if (id != "") {
        var url = '../Upload.ashx?id=' + id.substring(1);
        jQuery.ajax({
            url: url,
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            type: 'POST',
            beforeSend: function () {

            },
            success: function (data) {
                $(this).next('.custom-file-label').html(fileName);
            },
            error: function (data) {

            }
        });
    }
}
