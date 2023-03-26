<template>
  <div>
    <Banner />
    <div class="main-container">
      <h1>Make your wish: </h1>
      <Burgerform />
    </div>
  </div>
</template>

<script>

  import Banner from '../components/Banner.vue'
  import Burgerform from '@/components/Burgerform.vue';

  export default {
    name: 'Home',
    components: {
      Banner,
      Burgerform
    }
  }
</script>
