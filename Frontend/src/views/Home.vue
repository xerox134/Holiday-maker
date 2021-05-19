<template>
  <div class="home">
    
    <h1>Hotels</h1>
    <div class= "filter-container">
    <div id= "Filter"><Filter/></div>
    <div id="Hotels"><Hotels/></div>
</div>
    
  </div>
</template>

<script>
// @ is an alias to /src
import Hotels from "../components/Hotels"
import Filter from "../components/Filter"

export default {
  name: 'Home',
  components: {
    
    Hotels,
    Filter,
  
  }
}
</script>

<style>
.filter-container {
  display: flex;
  justify-content: right;
}





</style>
