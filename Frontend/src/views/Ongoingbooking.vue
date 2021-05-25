<template>
<div class ="Ongoingbooking">  <p>Welcome to ongoing bookings</p>
</div>

<p>Total price : {{ updatePrice }}</p>
<button >extra Bed</button>
<button @click="addAllInclusive">Include all luxuries?</button>
   <p>Extra Bed?</p> <input type="checkbox" checked="checked" @click="addABed">


<div></div>
</template>

<script>

export default {
  components: { },
  computed: {
      updatePrice(){
    return this.$store.getters.totalPrice
    }},
  methods:{
      addABed(){
    this.$store.commit('addABed', this.$store.state.bedPrice);
  },
      addAllInclusive(){
      this.$store.commit('addAllInclusive', this.$store.state.allInclusivePrice);
    }
    },
}
</script>

<style scoped>
#Ongoingbooking {
  background-color: rgba(60, 55, 65, .3);
  color: blanchedalmond;
  width: 100%;
  
  height: 100%;
  box-shadow: 6px 6px 3px rgba(0, 0, 0, .6), inset 3px 3px 3px rgba(240, 200, 255, .05);
  justify-content: center;
  min-height: 15vh;

}
</style>