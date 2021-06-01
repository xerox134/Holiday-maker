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

            

/*
            var newArray = arrayOfObjects.filter(function(obj){
                return toDelete.indexOf(obj) ==-1
                
            })
            console.log('test' + newArray)
            
            var newArray = arrayOfObjects.filter(function(obj) {
                return toDelete.indexOf(obj) === -1;
            })
            console.log('newArray' + newArray)

            const filterInPlace = (array, predicate) =>{
                console.log('1')
                let end = 0;
                console.log('2')
                for (let i = 0; i < array.length ; i++){
                    console.log('3')
                    const obj = array[i]
                    console.log('4')
                    if (predicate(obj)){
                        array[end++] = obj
                        console.log('5')
                    }
                    console.log('6')
                }
                console.log('7')
                array.length = end
                
            }
            console.log('8')

            filterInPlace(arrayOfObjects, obj => !toDelete.has(obj.id));
            console.log('Filtered arrayOfObjects \n' + arrayOfObjects)
            console.log('10')

*/
            

            var toDelete = this.$store.state.allBookings
            var arrayOfObjects = this.$store.state.allBookings2
            
            console.log('toDelete \n' + toDelete)
            console.log('Original arrayOfObjects' + arrayOfObjects)
            console.log('9')

            
            
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