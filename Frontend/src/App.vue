<template>
  <Routerbar />
</template>

<script>
import Routerbar from "../src/components/Routerbar";

export default {
  name: "App",
  components: {
    Routerbar,
  },
};
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Roboto", sans-serif;
  color: #cbd5df;
  text-decoration: none;
}
</style>