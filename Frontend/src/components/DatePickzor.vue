<template>
  <div class="Calendarr"><Calendarr v-model="dateRange"  selectionMode="range" :showTime="false"
  :showButtonBar="true" dateFormat="dd.mm.yy"/></div>

  <button @click="valueLog()">Log value</button>

</template>

<script>
import Calendarr from '../components/calendar/Calendarr'


export default {

    components: {
        Calendarr,

    },

    data() {
        return {
            dateRange: null,

        }
    },

    methods:{
        valueLog(){
            var arr = this.dateRange;
            var myJSON = JSON.stringify(arr);
            console.log('Stringified \n' + myJSON)

            var fromDate = myJSON.slice(2,12);
            var toDate = myJSON.slice(29, 39);

            this.$store.state.fromDate = fromDate;
            this.$store.state.toDate = toDate;

            console.log('fromDate Store ' + this.$store.state.fromDate)
            console.log('toDate Store ' + this.$store.state.toDate)
            
        }
    }

}
</script>

<style scoped>





</style>