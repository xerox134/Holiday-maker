<template>
  <div class="Success">
    <h2>Bokning genomförd!</h2>
    <br />
    <br />
    <button @click="asd">Test</button>
  </div>
</template>

<script>
export default {
  name: "Success",
  components: {
   
  },

  computed:{
  },

  methods:{
   

  },

  mounted(){
   
  }
};
</script>

<style scoped>
.Success {
  background-color: rgba(60, 55, 65, 0.3);
  color: blanchedalmond;
  width: 100%;
  height: 100%;
  box-shadow: 6px 6px 3px rgba(0, 0, 0, 0.6),
    inset 3px 3px 3px rgba(240, 200, 255, 0.05);
  justify-content: center;
  min-height: 43vh;
}

.link {
  border-radius: 7px;
  padding: 2vh;
  position: relative;
  top: 1vh;
  left: 1px;
  border: none;
  outline: none;
  background-color: rgba(80, 75, 85, 0.3);
  color: rgba(230, 230, 255, 0.6);
  box-shadow: 2px 2px 1px rgba(0, 0, 0, 0.2),
    inset 2px 2px 2px rgba(255, 255, 255, 0.05);
  margin: 3px;
  margin-left: 20vw;
  margin-right: 20vw;

  height: min(5vh, 25vw);
  text-shadow: -1px -1px 2px rgba(0, 0, 0, 0.3),
    1px 1px 2px rgba(126, 126, 126, 0.5);
}

.link:hover {
  background-color: rgba(80, 75, 85, 0.8);
}

.link:active {
  color: rgba(230, 230, 255, 0.8);
  border: none;
  background-color: rgba(80, 75, 85, 0.1);
  box-shadow: inset -2px -2px 2px rgba(220, 180, 255, 0.1),
    inset 2px 2px 2px rgba(0, 0, 0, 0.2);
}
</style>