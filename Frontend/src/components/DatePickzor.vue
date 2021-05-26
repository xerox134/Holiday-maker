<template>
  <div class="Calendar"><Calendar v-model="dateRange"  selectionMode="range" :showTime="false"
  :showButtonBar="true" dateFormat="dd.mm.yy"/></div>

  <button @click="valueLog()">Log value</button>

</template>

<script>
import Calendar from 'primevue/calendar'


export default {

    components: {
        Calendar,

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
            console.log('Stringified!' + myJSON)

            var fromDate = myJSON.slice(2,12);
            console.log('fromDate ' + fromDate)

            var toDate = myJSON.slice(29, 39);
            console.log('toDate ' + toDate)

            this.$store.state.fromDate = fromDate;
            this.$store.state.toDate = toDate;

            console.log('fromDate Store ' + this.$store.state.fromDate)
            console.log('toDate Store ' + this.$store.state.toDate)
            
        }
    }

}
</script>

<style scoped>
.Slider{
    background-color: black;
}




</style>