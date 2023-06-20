<!doctype html>
<html lang="en">
    <body class="">

        <form action="availableRooms.jsp" method="post" onsubmit="return validateForm()" name="myForm">
            <div class=" row maindiv bg-secondary px-4, form_day">

                <div class="col-4">
                    <div>
                        <label><b class="text-white">Check In Date</b></label>
                    </div>
                    <input type="date" class="form-control"  name="check_in" id="check_in"   required/>
                    <span id="checkin"></span>
                </div>
                <div class="col-4">
                    <div>
                        <label><b class="text-white">Check Out Date</b></label>
                    </div>
                    <input type="date" class="form-control " name="check_out" id="check_out"  required />
                    <span id="checkout"></span>
                </div>

                <div class="col-2 mt-3 px-5 btn">
                    <input type="submit"  class="btn bg-primary text-white" value="Search Availability" />
                </div>

            </div>
        </form>

        <script type="text/javascript">
            $(function () {
                var dtToday = new Date();

                var month = dtToday.getMonth() + 1;
                var day = dtToday.getDate();
                var year = dtToday.getFullYear();
                if (month < 10)
                    month = '0' + month.toString();
                if (day < 10)
                    day = '0' + day.toString();

                var maxDate = year + '-' + month + '-' + day;
                $('#check_in').attr('min', maxDate);
                $('#check_out').attr('min', maxDate);
            });
        </script>

<script type="text/javascript">
    document.getElementById('check_in').addEventListener('change', handleDateChange);
    document.getElementById('check_out').addEventListener('change', handleDateChange);

    function handleDateChange() {
        const currentDate = new Date();
        currentDate.setDate(currentDate.getDate() - 1);
        var checkInDate = new Date(document.getElementById('check_in').value);
        var checkOutDate = new Date(document.getElementById('check_out').value);

        if (checkOutDate <= checkInDate) {
            document.getElementById('checkout').textContent = 'Your checkout date is less than checkin date.';
            document.getElementById('check_out').value = '';
        } else if (checkOutDate > checkInDate) {
            document.getElementById('checkout').textContent = '';
        } 
        
        if (checkInDate <= currentDate) {
        document.getElementById('checkin').textContent = 'Your checkin date is less than current date.';
        document.getElementById('check_in').value = '';
    } else {
        document.getElementById('checkin').textContent = '';
    }
    }
</script>

        <script src="../js/formValidation.js" type="text/javascript"></script>
    </body>
</html>