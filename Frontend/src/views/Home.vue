<template>
  <div class="home">
    
    <h1>Hotels</h1>
 <div id="SearchBar"><SearchBar/></div>
    <div id="Hotels"><Hotels/></div>

    
  </div>
</template>

<script>
// @ is an alias to /src
import SearchBar from "../components/SearchBar"
import Hotels from "../components/Hotels"

export default {
  name: 'Home',
  components: {
    SearchBar,
    Hotels,
  
  }
}
</script>

<style>


</style>
