import { createStore } from 'vuex';
import axios from 'axios';

export default createStore({
  name:'store',
  
  state: {
    favorites: [],
    bookings: [],
    addedFavorites:[],
    hotels:[],
    hotels2:[],
    loggedInUser: null,
    loggedInUserId: 0,
    allUsers: [],
    isLoggedIn: "Login",
    rooms:[],
    hotelId: null,
    hotelById:[],
    roomId: null,
    bookedRoom: [],
    HotelSearchPhrase: '',
    searchedHotels:[],
    toggleList: true,
    totalPrice: 0,
    bedPrice: 100,
    allInclusivePrice: 200,
    dateRange: null,
    fromDate: '',
    toDate: '',
    distanceCenter:null,
    distanceBeach:null
  },
  
  mutations: {
    
    setDistanceBeach(state,payload){
      state.distanceBeach=payload
    },
    
    setDistanceCenter(state,payload){
      state.distanceCenter=payload
    },

    setDateRange(state,payload){
      state.dateRange = payload
    },
    setToggleList(state,payload){
      state.toggleList = payload
    },
    addHotels(state, payload) {
      state.hotels = payload;
      state.hotels2 = payload;
    },
    setFavorites(state,payload){
      state.favorites = payload;
    },
    setBookings(state,payload){
      state.bookings = payload;
    },
    setLoggedInUser (state, user) {
      state.loggedInUser = user
    },
    setAllUsers(state, payload) {
      state.allUsers = payload
    },
    setLoggedInUserId(state, user) {
      state.loggedInUserId = user
    },
    setUser(state, user) {
      state.loggedInUser = user
    }, 
    setRoomsByHotelId (state, payload) {
      state.rooms = payload
    },
  
    setBarFilter (state, payload){
      state.barFilter = payload
    },
    setHotelId (state,payload){
      state.hotelId =payload
    },
    setHotelById (state,payload){
      state.hotelById =payload
    },
    setHotelSearchPhrase(state, payload) {
      state.HotelSearchPhrase = payload;
    },
    sethotelsBySearch(state,payload){
      state.searchedHotels = payload;
    },
    setFilteredHotels(state, payload){
      state.filteredHotels = payload
    },
   setRoomsWithRoomId(state, payload){
    state.bookedRoom= payload
   },
    setHotelsWithPool(state, payload){
      state.hotelsWithPool = payload;
    },
    setHotelsWithEntertainment(state, payload){
      state.hotelsWithEntertainment = payload;
    },
    addABed(state, payload){
      state.totalPrice += payload;
    },
    addAllInclusive(state, payload){
      state.totalPrice += payload;
    }
    


  },
  
  actions: {
    async fetchHotels(){
      await axios.get("http://localhost:3000/rest/hotels")
      .then(response => {
        this.commit("addHotels", response.data)
        console.log(response.data)
      })
    },
    async fetchRoomsByHotelId(){
      await axios.get("http://localhost:3000/rest/room/" + this.state.hotelId)
      .then(response => {
        this.commit("setRoomsByHotelId", response.data)
        console.log(response.data)
      })
    },
    async fetchHotelById(){
      await axios.get("http://localhost:3000/rest/hotel/" + this.state.hotelId)
      .then(response => {
        this.commit("setHotelById", response.data)
        console.log(response.data)
      })
    },
    async fetchRoomsWithRoomId(){
      await axios.get("http://localhost:3000/rest/room/roomid/" + this.state.roomId)
      .then(response => {
        this.commit("setRoomsWithRoomId", response.data)
        console.log(response.data)
      })
    },
    async fetchUser(){
      await axios.get("http://localhost:3000/auth/whoami/")
      .then(response => {
        this.commit("setUser", response.data)
        if(response != null)
        console.log(response.data)
      })
    },
    async fetchAllUsers(){
      await axios.get("http://localhost:3000/rest/users")
      .then(response => {
        this.commit("setAllUsers", response.data)
        if(response != null)
        console.log(response.data)
      })
    },
    async fetchAllFavorites(){
      await axios.get("http://localhost:3000/rest/favorites/user/"+ this.state.loggedInUserId)
      .then(response => {
      this.commit("setFavorites", response.data)
      console.log(response.data)
    })
  }, 
    async fetchAllBookings(){
     await axios.get("http://localhost:3000/rest/bookings/"+ this.state.loggedInUserId)
     .then(response => {
     this.commit("setBookings", response.data)
     console.log(response.data)
    })
  },
  
  async fetchHotelBySearchPhrase(){
      await axios.get("http://localhost:3000/rest/hotel/search/"+ this.state.HotelSearchPhrase)
      .then(response => {
      this.commit("sethotelsBySearch", response.data)
      console.log(response.data)
    })
  },

  async fetchHotelByPool(){
    await axios.get("http://localhost:3000/rest/hotels/filter/pool")
    .then(response => {
      this.commit("setFilteredHotels", response.data)
      console.log(response.data)
    })
  },
  async fetchHotelByEntertainment(){
    await axios.get("http://localhost:3000/rest/hotels/filter/entertainment")
    .then(response => {
      this.commit("setFilteredHotels", response.data)
      console.log(response.data)
    })
  },
  async fetchHotelByRestaurant(){
    await axios.get("http://localhost:3000/rest/hotels/filter/restaurant")
    .then(response => {
      this.commit("setFilteredHotels", response.data)
      console.log(response.data)
    })
  },
  async fetchHotelByWifi(){
    await axios.get("http://localhost:3000/rest/hotels/filter/wifi")
    .then(response => {
      this.commit("setFilteredHotels", response.data)
      console.log(response.data)
    })
  },
  async fetchHotelByBar(){
    await axios.get("http://localhost:3000/rest/hotels/filter/bar")
    .then(response => {
      this.commit("setFilteredHotels", response.data)
      console.log(response.data)
    })
  },
  


},

getters:{
  getSearchedHotels(state){
    return state.searchedHotels
  },
  getLoginUserId(state){
    return state.loggedInUserId
  },
  getCurrentUser(state) {
    return state.loggedInUser
  },
  getAllUsers(state) {
    return state.allUsers
  },
  getAllFavorites(state){
    return state.favorites
  },
  getAllBookings(state){
    return state.bookings
  },
  getAllHotels(state){
    return state.hotels
  },
  getRoomByHotelId(state){
    return state.rooms
  }, 
  getRoomsWithRoomId(state){
    return state.bookedRoom
  },
  getHotelId(state){
    return state.hotelId
  }, 
  getHotelById(state){
    return state.hotelById
  },  
  getLoginStatus(state) {
    console.log(state.isLoggedIn)
    return state.isLoggedIn
  },
  getToggleList(state){
    return state.toggleList
  },
  getFilteredHotels(state){
    return state.filteredHotels
  },
  getHotelsWithPool(state){
    return state.hotelsWithPool
  },
  getHotelsWithEntertainment(state){
    return state.hotelsWithEntertainment
  },
  totalPrice(state){
    return state.totalPrice
  },
  getDateRange(state){
    return state.dateRange
  },
  
  getBeach(state){
    return state.distanceBeach
  }
},

  modules: {
  }

})
