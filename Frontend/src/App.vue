<template>


    <div id= "Home"><Home/></div>
 <router-view/>
</template>

<script>
import Home from "../src/views/Home"




export default {
  name: 'App',
  components: {
   Home,
  }
}

</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Roboto', sans-serif;
  color: #cbd5df;
  text-decoration: none;
  
}
</style>