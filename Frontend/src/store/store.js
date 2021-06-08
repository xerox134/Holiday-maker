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
    HotelSearchPhrase: null,
    searchedHotels:[],
    searchedHotels2:[],
    toggleList: true,
    totalPrice: 0,
    bedPriceManipulator:0,
    roomPrice:0,
    bedPrice: 100,
    numberOfAdults: 1,
    numberOfChildren:0,
    temporaryNumber: 0,
    allInclusivePrice: 200,
    fromDate: new Date().toISOString().substr(0, 10),
    toDate: new Date().toISOString().substr(0, 10),
    distanceCenter:null,
    distanceBeach:null,
    numberOfAll: 1,
    extraBed: false,
    wholePension: false,
    halfPension: false,
    allInclusive: false,
    reviews: [],
    allBookings: [],
    allBookings2: [],
  },
  
  mutations: {
    addAPerson(state,payload){
      state.numberOfAll += payload
    },
    setNumberOfAdults(state, payload){
      state.numberOfAdults = payload
    },
    setNumberOfChildren(state, payload){
      state.numberOfChildren = payload
    },
    setbedPriceManipulator(state,payload){
      state.bedPriceManipulator = payload
    },
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
    setRoomPrice(state, payload){
      state.roomPrice = payload;
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
      state.searchedHotels2 = payload;
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
    removeABed(state, payload){
      state.totalPrice -= payload;
    },
    addAllInclusive(state, payload){
      state.totalPrice += payload;
    },
    addRoomPriceToTotal(state, payload){
      state.totalPrice +=payload;
    },
    setFromDate(state, payload){
      state.fromDate = payload
    },
    setToDate(state, payload){
      state.toDate = payload
    },
    setTemporaryNumber(state, payload) {
      state.temporaryNumber = payload
    },
    setAllBookings(state, payload){
      state.allBookings = payload,
      state.allBookings2 = payload
    },
    setExtraBed(state, payload) {
      state.extraBed = payload
    },
    setWholePension(state, payload) {
      state.wholePension = payload
    },
    setHalfPension(state, payload) {
      state.halfPension = payload
    },
    setAllInclusive(state, payload) {
      state.allInclusive = payload
    },
    setReviewsByHotelId(state, payload) {
      state.reviews = payload
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
    async fetchBookings(){
      await axios.get("http://localhost:3000/rest/bookings/")
      .then(response => {
        this.commit("setAllBookings", response.data)
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
    async fetchReviewsByHotelId() {
      await axios.get("http://localhost:3000/rest/reviews/hotel/" + this.state.hotelId)
      .then(response => {
        this.commit("setReviewsByHotelId", response.data)
        console.log(response.data)
      })
    },
  },


  getters:{
    getAllPeople(state){
      return state.numberOfAll
    },
    getNumberOfAdults(state){
      return state.numberOfAdults
    },
    getNumberOfChildren(state){
      return state.numberOfChildren
    },
    getSearchedHotels(state){
      return state.searchedHotels
    },
    getSearchedHotels2(state){
      return state.searchedHotels2
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
    },
    getFromDate(state){
      return state.fromDate
    },
    getToDate(state){
      return state.toDate
    },
    getTemporaryNumber(state) {
      return state.temporaryNumber
    },
    getAllAllBookings (state){
      return state.allBookings
    },
    getExtraBed(state) {
      return state.extraBed
    },
    getWholePension(state) {
      return state.wholePension
    },
    getHalfPension(state) {
      return state.halfPension
    },
    getAllInclusive(state) {
      return state.allInclusive
    },
    getReviewsByHotelId(state) {
      return state.reviews
    }
  


},

  modules: {
  
  }

})
