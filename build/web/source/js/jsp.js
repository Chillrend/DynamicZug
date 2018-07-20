$(document).ready(function () {
    $('#login').click(function () {
        var uname = $('#Form-uname').val();
        var pwd = $('#Form-pass').val();
        $.ajax({
            type: "POST",
            url: "zugLogin",
            data: {"uname": uname, "pwd": pwd},
            success: function (resp) {
                if (resp === "user") {
                    toastr["info"]("Logged In, page will reload.");
                    window.setTimeout(function () {
                        location.reload();
                    }, 3000);
                } else if (resp === "admin") {
                    alert("Welcome Adm00n !");
                    window.location.href = "crud.jsp";
                } else if (resp === "unauthorized") {
                    toastr["warning"]("Invalid username and password");
                } else {
                    toastr["warning"]("Invalid username and password");
                }
            },
            error: function (error) {
                alert("error" + error);
            }
        });
    });
    $('#logout').click(function () {
        $.ajax({
            type: "GET",
            url: "zugLogout",
            success: function (resp) {
                toastr["info"]("Successfuly Logged Out!");
                window.setTimeout(function () {
                    location.reload();
                }, 3000);
            },
            error: function (error) {
                toastr["warning"]("Can\'t Log Out, Please Try Again");
            }
        });
    });
    $('.dropdown-toggle').click(function () {
        $('.dropdown-toggle').dropdown('toggle');
    });
    $('#hide-this-first').hide();
    $('#hide-if-password-not-changed').hide();

    $('#selectDays,#selectCountry').material_select();
});

$('.st_from,.st_to').material_select();

$('select[name=route]').change(function () {
    $('.st_from,.st_to').material_select('destroy');
    var $select = $('#st_from,#st_to');
    var $select2 = $('#st_to');
    var selvalue = $('#route option:selected').val();
    $select.find("option").remove();
    $select2.find("option").remove();
    $('<option value="" disabled selected>Choose your option</option>').appendTo($select);
    $.get("SomeServlet", {key: selvalue, target: "route", identifier: "station"}, function (responseJson) {
        $.each(responseJson, function (key, value) {
            $("<option>").val(key).text(value).appendTo($select);
        });
        $('.st_from,.st_to').material_select();
    });
});



$('#bookings').click(function () {
    var $table = $('#bookingtable');
    $.get("zugGetBooking", function (responseJson) {
        $table.find("tr:gt(0)").remove();
        $.each(responseJson, function (index, value) {
            $("<tr>").appendTo($table)
                .append($("<td>").text(value.booking_id))
                .append($("<td>").text(value.train_name))
                .append($("<td>").text(value.departure_station + " - " + value.arrival_station))
                .append($("<td>").text(value.departure_date + ", " + value.departure_time));
        });
    });
});

var oldPassword;

$('#verifypwd').click(function () {
    var pwd = $('#inputpwds').val();
    var pwdform = $('#hide-this-later');
    var changeform = $('#hide-this-first');
    $.get("verifypassword", {password: pwd}, function (responseJson) {
        if (!responseJson[0]) {
            toastr["warning"]("Wrong Password");
        } else {
            pwdform.fadeOut(function () {
                changeform.fadeIn();
            });
            $('#inputuname').addClass("disabled");
            $.each(responseJson, function (index, value) {
                $('#inputuname').val(value.username);
                $('#inputPassword').val(value.password);
                $('#inputmail').val(value.email);
                $('#Gender').val(value.gender).change();
                $('#inputname').val(value.name);
                $('#inputCity').val(value.city);
                $('#inputZip').val(value.zip);
                $('#inputAddr').val(value.address);
                $('#inputID').val(value.identification);

                oldPassword = value.password;

            });
        }
    });
});


$('#inputPassword').keyup(function () {
    if($('#inputPassword').val() !== oldPassword){
        $('#hide-if-password-not-changed').fadeIn();
        $('#hide-if-password-not-changed').attr('disabled');
    }else{
        $('#hide-if-password-not-changed').fadeOut();
        $('#hide-if-password-not-changed').removeAttr('disabled');
        $('#hide-if-password-not-changed').val("");
    }
});

function validateUpdate(){
    if($('select[name=gender] option:nth(0)').is(':selected')){
        toastr["warning"]("Please Select Gender!");
        return false;
    }else if(grecaptcha.getResponse()===''){
        toastr["warning"]("Please Fill Captcha First");
        return false;
    }else if($('#inputPassword').val() !== oldPassword && $('#inputConfirmPassword').val() !== $('#inputPassword').val()){
        toastr["warning"]("Password doesn\'t match");
        return false;
    }
}

toastr.options = {
    "closeButton": false,
    "debug": false,
    "newestOnTop": false,
    "progressBar": false,
    "positionClass": "toast-top-center",
    "preventDuplicates": true,
    "onclick": null,
    "showDuration": 300,
    "hideDuration": 700,
    "timeOut": 5000,
    "extendedTimeOut": 1000,
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "slideDown",
    "hideMethod": "slideUp"
}

function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            $('#pre-display').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#img-input").change(function() {
    readURL(this);
});

$('.dropdown-toggle').click(function () {
    $('.dropdown-toggle').dropdown('toggle');
});

$('.row .col-lg-3 .card').click(function(event){
   $('.row .col-lg-3').find('.card').removeClass('selected');
   $(this).addClass('selected');

   var selectedPass = $(this).attr('data-value');
   $('#inputpassname').val(selectedPass);
});

var datezthreemonth = new Date();
datezthreemonth.setMonth(new Date().getMonth() + 3);

$(".dateStartPicker").pickadate({
    format: 'mmmm d, yyyy',
    formatSubmit: 'mmmm d, yyyy',
    min: new Date(),
    max: datezthreemonth
});

