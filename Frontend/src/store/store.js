import { createStore } from 'vuex';
import axios from 'axios';

export default createStore({
    name:'store',
  state: {
      hotels:[],
  },
  mutations: {
    addHotels(state, payload) {
        state.hotels = payload;
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
  },
  modules: {
  }
})
