document.addEventListener('DOMContentLoaded', function () {
    const successMessage = document.querySelector('.success-message');
    const errorMessage = document.querySelector('.error-message');

    if (successMessage) {
        setTimeout(function () {
            successMessage.style.display = 'none';
        }, 3000);
    }

    if (errorMessage) {
        setTimeout(function () {
            errorMessage.style.display = 'none';
        }, 3000);
    }
});
