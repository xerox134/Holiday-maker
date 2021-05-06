<template>
  <div class="home">
    
    <h1>Welcome to the Homepage</h1>

    <div id="Hotels"><Hotels/></div>

    
  </div>
</template>

<script>
// @ is an alias to /src
import Hotels from "../components/Hotels"

export default {
  name: 'Home',
  components: {
    
    Hotels,
  
  }
}
</script>
