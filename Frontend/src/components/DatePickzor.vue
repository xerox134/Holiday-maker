<template>
  
  <div><Calendarr v-model="dateRange"  selectionMode="range" :showTime="false"
  :showButtonBar="true" dateFormat="yy.mm.dd"/></div>

  <button @click="valueLog()">Log value</button>
  <div>{{dateRange}}</div>

</template>

<script>
import Calendarr from '../components/calendar/Calendarr';

export default {

    components: {
        Calendarr
    },

    data() {
        return {
            dateRange: null,
        }
    },

    methods:{
        valueLog(){
            console.log('dateRange OG' + this.dateRange)
            var fromDate = this.dateRange[0]
            fromDate = fromDate.toString()
            
            console.log('fromDate ' + fromDate)

            this.$store.state.fromDate = this.dateRange[0]
            this.$store.state.toDate = this.dateRange[1]
            this.$store.state.dateRange = this.dateRange
            
            console.log(this.$store.state.dateRange);
            console.log(this.$store.state.fromDate);
            console.log(this.$store.state.toDate);
        }
    }

}
</script>

<style scoped>



</style>