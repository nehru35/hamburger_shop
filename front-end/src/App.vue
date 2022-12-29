<template>
  <div>
    <Navbar :logo="logo_src" :alt="app_name" />
    <router-view/>
    <Footerview />
  </div>
</template>

<script>
  import Navbar from './components/Navbar.vue';
  import Footerview from './components/Footer.vue';

  export default {
    components: {
      Navbar,
      Footerview
    },
    data() {
      return {
        logo_src: '/img/logo.png',
        app_name: 'Make you burguer'
      }
    }

  }
</script>

<style>
  * {
    font-family: Arial, Helvetica, sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  .main-container {
    margin: 50px;
    min-height: 250px;
  }

  h1 {
    text-align: center;
    font-size: 42px;
    margin-bottom: 30px;
    color: #222;
  }

</style>
