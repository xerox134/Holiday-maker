<template>
  <div class="home">

 <div id="SearchBar"><SearchBar/></div>
    <div class= "filter-container">
    <div id= "Filter"><Filter/></div>
    <div id="Hotels"><Hotels/></div>
</div>
    
  </div>
</template>

<script>
// @ is an alias to /src
import SearchBar from "../components/SearchBar"
import Hotels from "../components/Hotels"
import Filter from "../components/Filter"

export default {
  name: 'Home',
  components: {
    SearchBar,
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
