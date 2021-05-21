<template>
  <div >
<h1 >Filter</h1>

<div id="filter">
 
        <Card :card="Filter"  :type="'filter'"/>

   </div>
  </div>
</template>


<script>
import Card from "./Card"
export default {
    name: "Filter",
components: {
        Card
    },
    

    


    
}
</script>