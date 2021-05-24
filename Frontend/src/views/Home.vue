<template>
  <div class="home">


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

#Filter{
  margin-top: 80px;
}
.filter-container {
  display: flex;
  justify-content: right;
  
    
}

</style>
