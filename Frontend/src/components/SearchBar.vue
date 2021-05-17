<template>
 
 <form action="rest/hotel/search/">
<div id="SearchContainer">

   <div class="container">
   
      <input v-model="search_phrase" type="text" placeholder="Search hotels..." name="ename" required>
   
      <button type="submit">Search</button>
     
      </div>


</div>
</form>


</template>

<script>
export default {
  name:"SearchBar",

 data (){

  
    return{
      
        search_phrase: '',
     
      
       
    }

},

  methods: {
     check () {
      // tell backend to forget us
      console.log(this.search_phrase)
      

}
  }
}
</script>

<style>

</style>