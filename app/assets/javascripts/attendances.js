document.addEventListener("DOMContentLoaded", function(event) {
     var xhttp = new XMLHttpRequest();
     //go to edit specific attendance page
    $('.editattendance.btn.btn-primary').on('click', function() {
        var attendance_div = $(this).parents('.editattendanceparent');
        var attendance_id = attendance_div.attr('id');
        var x = "../attendances/" + attendance_id + "/edit";
        $(location).attr('href', x);
    });
 	// delete the attendance you choose
     $('.removeattendance.btn.btn-primary').on('click', function() {
        var attendance_div = $(this).parents('.removeattendanceparent');
        var attendance_id = attendance_div.attr('id');
        var x = "../deleteattendance?id=" + attendance_id;
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                var success = data.success_message;
                $(".successr"+ attendance_id).text(success).show(0).delay(1000).hide(0);   
                setTimeout(function () {
                    location.reload();
                }, 1000);
            },
             error: function (xhr, ajaxOptions, thrownError){
                if(xhr.status==404) {
                    $(".errorl"+ attendance_id).text("Fail!, attendance Is Already Deleted Before").show(0).delay(1000).hide(0);
                    setTimeout(function () {
                         location.reload();
                    }, 2000);
                }
            }
         });
    });
     // when pressing on this button, it redirects you to create attendance page
     $('.addattendance.btn.btn-primary').on('click', function() {
        var success = "Redirecting to add attendance Page"
        $(".successp").text(success).show(0).delay(2000).hide(0);
        setTimeout(function () {
        $(location).attr('href', '../addattendance');
        }, 2000);
        
    });
 });