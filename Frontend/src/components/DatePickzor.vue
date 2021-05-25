<template>
  
  <div><Calendar v-model="dateRange"  selectionMode="range"
  :showButtonBar="true" dateFormat="dd.mm.yy"/></div>

  <button @click="valueLog()">Log value</button>

</template>

<script>
import Calendar from 'primevue/calendar';

export default {

    components: {
        Calendar
    },

    data() {
        return {
            dateRange: null
        }
    },

    methods:{
        valueLog(){
            console.log(this.dateRange);
        }
    }

}
</script>

<style scoped>



</style>