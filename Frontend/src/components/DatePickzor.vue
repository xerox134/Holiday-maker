<template>
  
  <div><Calendarr v-model="dateRange"  selectionMode="range"
  :showButtonBar="true" dateFormat="dd.mm.yy"/></div>

  <button @click="valueLog()">Log value</button>

</template>

<script>
import Calendarr from '../components/calendar/Calendarr';

export default {

    components: {
        Calendarr
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