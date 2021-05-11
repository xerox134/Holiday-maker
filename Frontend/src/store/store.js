import { createStore } from 'vuex';
import axios from 'axios';

export default createStore({
    name:'store',
  state: {
    favorites: [],
    addedFavorites:[],
      hotels:[],
      loggedInUser: null,
      loggedInUserId: 0,
      allUsers: [],
      isLoggedIn: "Login",
      rooms:[],
      hotelId: null
      
  },
  
  mutations: {

    addHotels(state, payload) {
        state.hotels = payload;
      },
    setFavorites(state,payload){
      state.favorites = payload;
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

      setHotelId (state,payload){
        state.hotelId =payload
      },

  },
  
  actions: {
    async fetchHotels(){
        await axios.get("http://localhost:3000/rest/hotels")
        .then(response => {
          this.commit("addHotels", response.data)
          console.log(response.data)
        })
      },
      async fetchRoomsById(){
        await axios.get("http://localhost:3000/rest/room/" + this.state.hotelId)
        .then(response => {
          this.commit("setRoomsByHotelId", response.data)
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
},

getters:{
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
  
  getAllHotels(state){
    return state.hotels
  },

  getRoomByHotelId(state){
    return state.rooms
  },
  getLoginStatus(state) {
    console.log(state.isLoggedIn)
    return state.isLoggedIn
  },

},

  modules: {
  }
})
