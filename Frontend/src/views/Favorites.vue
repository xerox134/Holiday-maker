<template>
  <div class="favorites">
        <div id="Favorites"><Favorites/></div>

  </div>
</template>

<script>
import Favorites from "../components/Favorites.vue"
export default {
  name: "favorites",
  components: {
    Favorites
  },
}
</script>


<style scoped>
#Favorites {
  background-color: rgba(60, 55, 65, .3);
  color: blanchedalmond;
  width: 100%;
  
  height: 100%;
  box-shadow: 6px 6px 3px rgba(0, 0, 0, .6), inset 3px 3px 3px rgba(240, 200, 255, .05);
  justify-content: center;
  min-height: 15vh;

}
</style>