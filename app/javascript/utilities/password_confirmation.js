  document.addEventListener('turbolinks:load', function() {
    const password = document.getElementById('password');
    const confirmPassword = document.getElementById("password_confirmation");
    if (password && confirmPassword) {
        (password && confirmPassword).addEventListener('change', check)
    }
})

  function check() {
    const password = document.getElementById('password');
    const confirmPassword = document.getElementById("password_confirmation");
    if (password.value === "" || confirmPassword.value === "")
    {
        confirmPassword.classList.remove('wrong_password', 'right_password' );
        return
    }
    if (password.value !== confirmPassword.value) {
        confirmPassword.classList.remove('right_password');
        confirmPassword.classList.add('wrong_password');
    } else {
        confirmPassword.classList.remove('wrong_password');
        confirmPassword.classList.add('right_password');
    }
}

