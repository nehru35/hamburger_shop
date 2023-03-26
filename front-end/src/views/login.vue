<template>
    <div id="login-container">
        <h1> Login </h1>
        <form action="">
            <label for="email">E-mail</label>
            <input type="email" name="email" id="email" placeholder="Digite seu email" autocomplete="off">
            <label for="password">Senha</label>
            <input type="password" name="password" id="password" placeholder="Digite a sua senha">
            <input type="submit" value="Login">
        </form>
    </div>
</template>

<script>
export default {
    name: 'Login'
}
</script>

<style scoped>
/* Geral */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Helvetica;
    color: #323232;
    border: none;
}

body {
    background-image: url('../../public/img/background.webp');
    background-size: cover;
    /* background-position-y: -200px; */
}

textarea:focus,
input:focus {
    outline: none;
}

a,
label {
    font-size: .8rem;
}

a:hover {
    color: #08558B;
}

/* Container login */

#login-container {
    background-color: #fff;
    width: 400px;
    margin-left: auto;
    margin-right: auto;
    padding: 20px 30px;
    margin-top: 10vh;
    border-radius: 10px;
    text-align: center;
}

/* Formulário */
form {
    margin-top: 30px;
    margin-bottom: 40px;
}

label,
input {
    display: block;
    width: 100%;
    text-align: left;
}

label {
    font-weight: bold;
}

input {
    border-bottom: 2px solid #323232;
    padding: 10px;
    font-size: 1rem;
    margin-bottom: 20px;
}

input:focus {
    border-bottom: 2px solid #08558B;
}

#forgot-pass {
    display: block;
    text-align: right;
}

input[type="submit"] {
    text-align: center;
    text-transform: uppercase;
    font-weight: bold;
    border: none;
    height: 40px;
    border-radius: 20px;
    margin-top: 30px;
    color: #fff;
    background-color: #08558B;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #18223C;
    transition: .5s;
}
</style>    