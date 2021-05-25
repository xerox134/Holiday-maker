<template>
  <div class="home">

    
    <div><DatePickzor/></div>

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
import DatePickzor from "../components/DatePickzor"


export default {
  name: 'Home',
  components: {
    
    Hotels,
    Filter,
    DatePickzor
    
  
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
