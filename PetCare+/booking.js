document.addEventListener('DOMContentLoaded', function() {
    // Current booking data
    const bookingData = {
        service: null,
        vet: null,
        date: null,
        time: null,
        petInfo: {}
    };

    // DOM Elements
    const steps = document.querySelectorAll('.step');
    const bookingSteps = document.querySelectorAll('.booking-step');
    const serviceCards = document.querySelectorAll('.service-card');
    const vetCards = document.querySelectorAll('.vet-card');
    const nextButtons = document.querySelectorAll('.next-btn');
    const prevButtons = document.querySelectorAll('.prev-btn');
    const confirmButton = document.getElementById('confirm-booking');
    const modal = document.getElementById('confirmation-modal');
    const closeModal = document.querySelector('.close-modal');
    const printReceipt = document.getElementById('print-receipt');
    const newBooking = document.getElementById('new-booking');
    const calendarGrid = document.querySelector('.calendar-grid');
    const monthYearDisplay = document.querySelector('.month-year');
    const prevMonthBtn = document.querySelector('.prev-month');
    const nextMonthBtn = document.querySelector('.next-month');
    const timeSlotsContainer = document.querySelector('.time-slots');
    const patientForm = document.getElementById('patient-form');

    // Calendar variables
    let currentDate = new Date();
    let currentMonth = currentDate.getMonth();
    let currentYear = currentDate.getFullYear();

    // Initialize the booking system
    initBookingSystem();

    function initBookingSystem() {
        // Set up event listeners
        setupServiceSelection();
        setupVetSelection();
        setupNavigationButtons();
        setupCalendar();
        setupFormSubmission();
        setupModalActions();
        
        // Generate initial calendar
        generateCalendar(currentMonth, currentYear);
    }

    function setupServiceSelection() {
        serviceCards.forEach(card => {
            card.addEventListener('click', function() {
                // Remove selected class from all cards
                serviceCards.forEach(c => c.classList.remove('selected'));
                
                // Add selected class to clicked card
                this.classList.add('selected');
                
                // Store selected service
                bookingData.service = {
                    type: this.getAttribute('data-service'),
                    name: this.querySelector('h3').textContent,
                    price: this.querySelector('.price').textContent
                };
                
                // Update summary
                if (document.getElementById('summary-service')) {
                    document.getElementById('summary-service').textContent = bookingData.service.name;
                    document.getElementById('summary-price').textContent = bookingData.service.price;
                }
            });
        });
    }

    function setupVetSelection() {
        vetCards.forEach(card => {
            card.addEventListener('click', function() {
                // Remove selected class from all cards
                vetCards.forEach(c => c.classList.remove('selected'));
                
                // Add selected class to clicked card
                this.classList.add('selected');
                
                // Store selected vet
                bookingData.vet = {
                    id: this.getAttribute('data-vet'),
                    name: this.querySelector('h3').textContent,
                    specialty: this.querySelector('.specialty').textContent
                };
                
                // Update summary
                if (document.getElementById('summary-vet')) {
                    document.getElementById('summary-vet').textContent = bookingData.vet.name;
                }
            });
        });
    }

    function setupNavigationButtons() {
        nextButtons.forEach(button => {
            button.addEventListener('click', function(e) {
                e.preventDefault();
                const nextStep = this.getAttribute('data-next');
                
                // Validate before proceeding
                if (nextStep === '2' && !bookingData.service) {
                    alert('Please select a service first');
                    return;
                }
                
                if (nextStep === '3' && !bookingData.vet) {
                    alert('Please select a veterinarian first');
                    return;
                }
                
                if (nextStep === '4' && (!bookingData.date || !bookingData.time)) {
                    alert('Please select a date and time first');
                    return;
                }
                
                navigateToStep(nextStep);
            });
        });
        
        prevButtons.forEach(button => {
            button.addEventListener('click', function(e) {
                e.preventDefault();
                const prevStep = this.getAttribute('data-prev');
                navigateToStep(prevStep);
            });
        });
    }

    function navigateToStep(stepNumber) {
        // Hide all steps
        bookingSteps.forEach(step => {
            step.classList.remove('active');
        });
        
        // Show selected step
        document.getElementById(`step-${stepNumber}`).classList.add('active');
        
        // Update steps indicator
        steps.forEach(step => {
            step.classList.remove('active');
            if (parseInt(step.getAttribute('data-step')) <= stepNumber) {
                step.classList.add('active');
            }
        });
        
        // Scroll to top
        window.scrollTo(0, 0);
    }

    function setupCalendar() {
        // Month navigation
        prevMonthBtn.addEventListener('click', function() {
            currentMonth--;
            if (currentMonth < 0) {
                currentMonth = 11;
                currentYear--;
            }
            generateCalendar(currentMonth, currentYear);
        });
        
        nextMonthBtn.addEventListener('click', function() {
            currentMonth++;
            if (currentMonth > 11) {
                currentMonth = 0;
                currentYear++;
            }
            generateCalendar(currentMonth, currentYear);
        });
    }

    function generateCalendar(month, year) {
        // Clear previous calendar days
        while (calendarGrid.children.length > 7) {
            calendarGrid.removeChild(calendarGrid.lastChild);
        }
        
        // Set month and year display
        const monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 
                          'July', 'August', 'September', 'October', 'November', 'December'];
        monthYearDisplay.textContent = `${monthNames[month]} ${year}`;
        
        // Get first day of month and total days
        const firstDay = new Date(year, month, 1).getDay();
        const daysInMonth = new Date(year, month + 1, 0).getDate();
        
        // Get days from previous month
        const prevMonthDays = new Date(year, month, 0).getDate();
        
        // Add days from previous month
        for (let i = 0; i < firstDay; i++) {
            const dayElement = document.createElement('div');
            dayElement.classList.add('day', 'disabled');
            dayElement.textContent = prevMonthDays - firstDay + i + 1;
            calendarGrid.appendChild(dayElement);
        }
        
        // Add days of current month
        const today = new Date();
        for (let i = 1; i <= daysInMonth; i++) {
            const dayElement = document.createElement('div');
            dayElement.classList.add('day');
            dayElement.textContent = i;
            
            // Highlight today
            if (i === today.getDate() && month === today.getMonth() && year === today.getFullYear()) {
                dayElement.classList.add('today');
            }
            
            // Disable past dates
            if (year < today.getFullYear() || 
                (year === today.getFullYear() && month < today.getMonth()) || 
                (year === today.getFullYear() && month === today.getMonth() && i < today.getDate())) {
                dayElement.classList.add('disabled');
            } else {
                // Add click event for selectable days
                dayElement.addEventListener('click', function() {
                    selectDay(this, i, month, year);
                });
            }
            
            calendarGrid.appendChild(dayElement);
        }
        
        // Calculate days needed from next month
        const totalCells = firstDay + daysInMonth;
        const nextMonthDays = totalCells <= 35 ? 35 - totalCells : 42 - totalCells;
        
        // Add days from next month
        for (let i = 1; i <= nextMonthDays; i++) {
            const dayElement = document.createElement('div');
            dayElement.classList.add('day', 'disabled');
            dayElement.textContent = i;
            calendarGrid.appendChild(dayElement);
        }
    }

    function selectDay(dayElement, day, month, year) {
        // Remove selected class from all days
        document.querySelectorAll('.day:not(.disabled)').forEach(d => {
            d.classList.remove('selected');
        });
        
        // Add selected class to clicked day
        dayElement.classList.add('selected');
        
        // Store selected date
        const selectedDate = new Date(year, month, day);
        bookingData.date = selectedDate;
        
        // Generate time slots for selected date
        generateTimeSlots(selectedDate);
    }

    function generateTimeSlots(date) {
        // Clear previous time slots
        timeSlotsContainer.innerHTML = '';
        
        // Generate available time slots (in a real app, this would come from an API)
        const startHour = 9; // 9 AM
        const endHour = 17; // 5 PM
        const slotDuration = 30; // minutes
        
        // Format date for display
        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        const dateString = date.toLocaleDateString('en-US', options);
        
        // Add date display
        const dateDisplay = document.createElement('h4');
        dateDisplay.textContent = dateString;
        timeSlotsContainer.appendChild(dateDisplay);
        
        // Generate time slots
        for (let hour = startHour; hour < endHour; hour++) {
            for (let minute = 0; minute < 60; minute += slotDuration) {
                const timeSlot = document.createElement('button');
                timeSlot.classList.add('time-slot');
                
                // Format time
                const period = hour >= 12 ? 'PM' : 'AM';
                const displayHour = hour > 12 ? hour - 12 : hour;
                const displayMinute = minute < 10 ? '0' + minute : minute;
                const timeString = `${displayHour}:${displayMinute} ${period}`;
                timeSlot.textContent = timeString;
                
                // Set actual time value
                timeSlot.setAttribute('data-time', `${hour}:${minute}`);
                
                // Randomly mark some slots as booked (for demo)
                if (Math.random() < 0.3) {
                    timeSlot.classList.add('booked');
                    timeSlot.setAttribute('disabled', 'true');
                } else {
                    timeSlot.addEventListener('click', function() {
                        selectTimeSlot(this, timeString);
                    });
                }
                
                timeSlotsContainer.appendChild(timeSlot);
            }
        }
    }

    function selectTimeSlot(slotElement, timeString) {
        // Remove selected class from all slots
        document.querySelectorAll('.time-slot:not(.booked)').forEach(slot => {
            slot.classList.remove('selected');
        });
        
        // Add selected class to clicked slot
        slotElement.classList.add('selected');
        
        // Store selected time
        bookingData.time = timeString;
        
        // Update summary
        if (document.getElementById('summary-datetime')) {
            const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
            const dateString = bookingData.date.toLocaleDateString('en-US', options);
            document.getElementById('summary-datetime').textContent = `${dateString} at ${timeString}`;
            
            // Also update confirmation modal
            document.getElementById('confirmation-time').textContent = `${dateString} at ${timeString}`;
        }
    }

    function setupFormSubmission() {
        confirmButton.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Validate form
            if (!patientForm.checkValidity()) {
                patientForm.reportValidity();
                return;
            }
            
            // Store pet info
            bookingData.petInfo = {
                name: document.getElementById('pet-name').value,
                type: document.getElementById('pet-type').value,
                age: document.getElementById('pet-age').value,
                concerns: document.getElementById('concerns').value
            };
            
            // Generate random booking ID
            const bookingId = 'VC-' + new Date().getFullYear() + '-' + Math.floor(1000 + Math.random() * 9000);
            
            // Update confirmation modal
            document.getElementById('confirmation-id').textContent = bookingId;
            document.getElementById('confirmation-vet').textContent = bookingData.vet.name;
            
            // Show confirmation modal
            modal.classList.add('active');
            
            // In a real app, you would send the booking data to your server here
            console.log('Booking data:', bookingData);
        });
    }

    function setupModalActions() {
        closeModal.addEventListener('click', function() {
            modal.classList.remove('active');
        });
        
        printReceipt.addEventListener('click', function() {
            window.print();
        });
        
        newBooking.addEventListener('click', function() {
            // Reset form and booking data
            patientForm.reset();
            resetBookingData();
            
            // Close modal and go back to step 1
            modal.classList.remove('active');
            navigateToStep('1');
        });
        
        // Close modal when clicking outside
        modal.addEventListener('click', function(e) {
            if (e.target === modal) {
                modal.classList.remove('active');
            }
        });
    }

    function resetBookingData() {
        // Reset all booking data
        bookingData.service = null;
        bookingData.vet = null;
        bookingData.date = null;
        bookingData.time = null;
        bookingData.petInfo = {};
        
        // Reset UI selections
        document.querySelectorAll('.service-card, .vet-card, .day, .time-slot').forEach(el => {
            el.classList.remove('selected');
        });
        
        // Reset calendar to current month
        currentDate = new Date();
        currentMonth = currentDate.getMonth();
        currentYear = currentDate.getFullYear();
        generateCalendar(currentMonth, currentYear);
    }
});