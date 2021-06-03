<template>
  <div class="Bookings">
    <div id="Bookings"><Bookings /></div>
  </div>
</template>

<script>
import Bookings from "../components/Bookings.vue";
export default {
  name: "bookings",
  components: {
    Bookings,
  },
};
</script>

<style scoped>
#Bookings {
  background-color: rgba(60, 55, 65, 0.3);
  color: blanchedalmond;
  width: 100%;

  height: 100%;
  box-shadow: 6px 6px 3px rgba(0, 0, 0, 0.6),
    inset 3px 3px 3px rgba(240, 200, 255, 0.05);
  justify-content: center;
  min-height: 15vh;
}
</style>