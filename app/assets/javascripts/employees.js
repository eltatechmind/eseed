document.addEventListener("DOMContentLoaded", function(event) {
     var xhttp = new XMLHttpRequest();
     //go to edit specific employee page
    $('.editemployee.btn.btn-primary').on('click', function() {
        var employee_div = $(this).parents('.editemployeeparent');
        var employee_id = employee_div.attr('id');
        var x = "../employees/" + employee_id + "/edit";
        $(location).attr('href', x);
    });
 	// delete the employee you choose
     $('.removeemployee.btn.btn-primary').on('click', function() {
        var employee_div = $(this).parents('.removeemployeeparent');
        var employee_id = employee_div.attr('id');
        var x = "../deleteemployee?id=" + employee_id;
        $.ajax({
            type: "POST",
            url: x,
            success: function(data) {
                var success = data.success_message;
                $(".successr"+ employee_id).text(success).show(0).delay(1000).hide(0);   
                setTimeout(function () {
                    location.reload();
                }, 1000);
            },
             error: function (xhr, ajaxOptions, thrownError){
                if(xhr.status==404) {
                    $(".errorl"+ employee_id).text("Fail!, employee Is Already Deleted Before").show(0).delay(1000).hide(0);
                    setTimeout(function () {
                         location.reload();
                    }, 2000);
                }
            }
         });
    });
     // when pressing on this button, it redirects you to create employee page
     $('.addemployee.btn.btn-primary').on('click', function() {
        var success = "Redirecting to add employee Page"
        $(".successp").text(success).show(0).delay(2000).hide(0);
        setTimeout(function () {
        $(location).attr('href', '../addemployee');
        }, 2000);
        
    });
 });