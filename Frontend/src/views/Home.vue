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
// @ is an alias to /src
import Hotels from "../components/Hotels"
import Filter from "../components/Filter"
import SearchBar from "../components/SearchBar"



export default {
  name: 'Home',
  components: {
    
    Hotels,
    Filter,
    SearchBar

    
  
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
  max-width: 100%;
  min-width: 100%;
  
    
}

</style>
