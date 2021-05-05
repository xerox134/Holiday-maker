import { createStore } from 'vuex'
import axios from 'axios';

export default createStore({

  state: {
    favorites: [],
    addedFavorites:[]
  },
  
  mutations: {
    setFavorites(state,payload){
      state.favorites = payload;
    }
  },
  
  actions: {
    async fetchAllFavorites(){
      await axios.get("http://localhost:3000/rest/favorites/1")
      .then(response => {
      this.commit("setFavorites", response.data)
      console.log(response.data)
    })
  },
  },

  getters:{
    getAllFavorites(state){
      return state.favorites
    }

  },


  modules: {
  }
})
