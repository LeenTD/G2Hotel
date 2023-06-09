/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



            window.addEventListener('load', function () {
        const bookingForm = document.getElementById('bookingForm');
        const checkInDateInput = document.getElementById('checkInDate');
        const checkOutDateInput = document.getElementById('checkOutDate');
        const numRoomsInput = document.getElementById('numRooms');
        const totalPriceInput = document.getElementById('totalPrice');
        const roomPriceInput = document.getElementById('Price');
        // Event listener for form submission
        bookingForm.addEventListener('submit', function (event) {
        event.preventDefault();
                calculateTotalPrice();
        });
        // Event listener for input changes
        bookingForm.addEventListener('input', function () {
        calculateTotalPrice();
        });
        // Function to calculate the total price
                function calculateTotalPrice() {
                const currentDate = new Date();
                        const checkInDate = new Date(checkInDateInput.value);
                        const checkOutDate = new Date(checkOutDateInput.value);
                        const numRooms = parseInt(numRoomsInput.value);
                        const roomPrice = parseFloat(roomPriceInput.value); // Get room price from input

                        if (
                                !isNaN(checkInDate) &&
                                !isNaN(checkOutDate) &&
                                checkOutDate > checkInDate && // Check-Out date should be after the Check-In date
                                numRooms > 0 &&
                                checkInDate >= currentDate && // Check-In date should be on or after the current date
                                checkOutDate > currentDate && // Check-Out date should be after the current date
                                !isNaN(roomPrice) && roomPrice > 0 // Validate room price
                                ) {
                const oneDay = 24 * 60 * 60 * 1000; // One day in milliseconds
                        const numDays = Math.round((checkOutDate - checkInDate) / oneDay);
                        const totalPrice = numDays * numRooms * roomPrice;
                        totalPriceInput.value = totalPrice;
                } else {
                totalPriceInput.value = ''; // Reset total price if any of the conditions are not met
                }
                }
            });

 