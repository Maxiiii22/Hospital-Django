document.querySelectorAll('.toggle-password').forEach(button => {
    button.addEventListener('click', () => {
        const inputId = button.dataset.target;
        const input = document.getElementById(inputId);
        if (input) {
            if (input.type === 'password') {
                input.type = 'text';
                button.innerHTML = '<i class="hgi hgi-stroke hgi-view"></i>';
            } else {
                input.type = 'password';
                button.innerHTML = '<i class="hgi hgi-stroke hgi-eye"></i>';
            }
        }
    });
});