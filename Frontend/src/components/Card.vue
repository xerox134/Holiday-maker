<template>
  <div id="card" >
    <div class="Hotel-card" v-if="type == 'hotel'">
        <span class="name">{{ card.name }}</span><br>
        <span id="city">{{ card.city }}</span><br><br>
      </div>
      </div>
</template>

<script>
export default {
     props: ["card", "type"],

}
</script>

<style>

</style>