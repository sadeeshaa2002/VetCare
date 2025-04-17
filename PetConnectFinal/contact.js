const contactform = document.querySelector('.contact-form');
const container = document.querySelector('.container');

contactform.addEventListener('submit', async (event) => {
    event.preventDefault();

    const formData = new FormData(contactform);

    try {
        const response = await fetch('send_email.php', {
            method: 'POST',
            body: formData
        });

        const result = await response.json();

        const alertBox = document.createElement('div');
        alertBox.classList.add('alert');

        if (result.status === 'success') {
            alertBox.classList.add('success');
        } else {
            alertBox.classList.add('error');
        }

        alertBox.innerHTML = `
            <div class="alert-message">
                <p>${result.message}</p>
            </div>
            <button class="close-btn">&times;</button>
        `;
        container.appendChild(alertBox);

        // Fade in the alert box
        setTimeout(() => {
            alertBox.style.opacity = 1;
        }, 100);

        // Close the alert when close button is clicked
        const closeBtn = alertBox.querySelector('.close-btn');
        closeBtn.addEventListener('click', () => {
            // Fade out the alert box
            alertBox.style.opacity = 0;
            setTimeout(() => {
                container.removeChild(alertBox);
            }, 500); // Wait for fade-out animation to complete
        });

        // Automatically remove the alert after 10 seconds
        setTimeout(() => {
            // Fade out the alert box
            alertBox.style.opacity = 0;
            setTimeout(() => {
                container.removeChild(alertBox);
            }, 500); // Wait for fade-out animation to complete
        }, 10000);

    } catch (error) {
        console.error('Error:', error);
    }
});

const connectbtn = document.querySelector('.connect-btn');
const crossbtn = document.querySelector('.cross-btn');
const socialcontainer = document.querySelector('.social-container');

connectbtn.addEventListener('click', () => {
    socialcontainer.classList.toggle('visible');
});

crossbtn.addEventListener('click', () => {
    socialcontainer.classList.remove('visible');
});
