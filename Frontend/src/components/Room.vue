<template>
<div>{{this.$store.state.allBookings}}</div>
<button @click="filterRooms()"></button>
<button @click="$router.push('ongoingbooking')">Continue to booking</button>
    <div>
        <ol id="HotelList">
            <li v-for="(hotel, index) in getHotelById"  :key="index" >   <!--false=boolean till episodeToggle-->
                <Card :card="hotel"  :type="'hotel'"/>  
            </li>
        </ol>
    </div>
    <h2>Available rooms</h2>
    <div>
        <ol id="RoomsList">
            <li v-for="(room, index) in getRoomByHotelId"  :key="index" >   <!--false=boolean till episodeToggle-->
                <Card :card="room"  :type="'room'"/>  
            </li>
        </ol>
  
    </div>
</template>


<script>
import Card from "../components/Card";
export default {
    name: "Hotels",
    

    components: {
        Card,   
    },
    
    computed: {
        getRoomByHotelId(){
            return this.$store.getters.getRoomByHotelId
        }, 
        getHotelById(){
            return this.$store.getters.getHotelById
        },
        
    },

    methods:{
        toggle () {
        this.active = !this.active
      },

        filterRooms(){
            

            this.filterBookableRooms()
            console.log(this.$store.state.allBookings)
            this.filterBookableRooms2()
            console.log(this.$store.state.allBookings)
            console.log('bokade rum ' + this.$store.state.allBookings)

            

            const filterInPlace = (array, predicate) =>{
                let end = 0;
                for (let i = 0; i < array.length ; i++){
                    const obj = array[i];
                    if (predicate(obj)){
                        array[end++] = obj
                    }
                }
                array.length = end;
            };

            var toDelete = this.$store.state.allBookings
            var arrayOfObjects = this.$store.state.allBookings2
            
            console.log(toDelete)
            console.log(arrayOfObjects)

            filterInPlace(arrayOfObjects, obj => !toDelete.has(obj.id));
            console.log(arrayOfObjects)
            
/*
            var idIDid = this.$store.state.allBookings = this.$store.state.allBookings.filter(id => {
                console.log(id.id)
                return id.id 
            })
            var asd = parseInt(idIDid.id)
            console.log(asd)
            var dsa = JSON.stringify(asd)
            console.log(dsa)
            var sad = parseInt(dsa)
            console.log(sad)
            console.log('all bookings id? ' + this.$store.state.allBookings.id)
*/         
        },

        filterBookableRooms(){
            this.$store.state.allBookings = this.$store.state.allBookings.filter(bookedRooms => {
                return bookedRooms.toDate <= this.$store.state.toDate
            } )  
        },
        filterBookableRooms2(){
            this.$store.state.allBookings = this.$store.state.allBookings.filter(bookedRooms => {
                return bookedRooms.fromDate >= this.$store.state.fromDate
            } )
        },
        
        
    },

    mounted(){
        console.log("we fetching")
        this.$store.dispatch("fetchHotelById")
        this.$store.dispatch("fetchRoomsByHotelId")
        this.$store.dispatch("fetchBookings")
        console.log("hotelId = " + this.$store.getters.getHotelId)
    },
 
}
</script>