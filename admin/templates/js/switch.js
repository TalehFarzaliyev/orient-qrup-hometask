$(document).ready(function() {
    $('.status-check').change(function(event) {

        var id = $(this).attr("id");
        var tableName = $(this).attr("name");
        var status = ($(this).is(':checked')) ? '1' : '0';

        $.ajax({
            type: 'POST',
            url: 'status.php',
            data: {
                id: id,
                tableName: tableName,
                status: status
            },
            success: function(result) {
                console.log("Successfully updated!");
            },
            error: function() {
                alert('Xəta baş verdi');
            }
        });
    });
});