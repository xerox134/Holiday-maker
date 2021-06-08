<template>
  

    <div class= "filter-container">
    <div id= "Filter"><Filter/></div>

    <div id="Main">
    <div id="SearchBar"><SearchBar/></div>
    <div id="Hotels"><Hotels/></div>
    </div>
</div>
   
  
</template>

<script>

import Hotels from "../components/HomeComponents/Hotels"
import Filter from "../components/HomeComponents/Filter"
import SearchBar from "../components/HomeComponents/SearchBar"



export default {
  name: 'Home',
  components: {
    
    Hotels,
    Filter,
    SearchBar

    
  
  }
}
</script>

<style scoped>



#Filter{
  margin-top: 150px;
}
.filter-container {
  display: flex;
  justify-content: right;
 
  
    
}

</style>
