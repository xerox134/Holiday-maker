<template>
  <div>
    <div> {{currentValue}} km</div>
    <div class="slider-component">
      <div class="slidecontainer">
        <input
          ref="input"
          v-model="currentValue"
          type="range"
          :min="0"
          :max="10"
          class="slider"
          @input="onInput"
        >
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {

    value: {
      type: Number,
      required: true
    },
    min: {
      type: Number,
      required: true
    },
    max: {
      type: Number,
      required: true
    }
  },
  data(){
    return {
      currentValue: this.value
    };
  },
  methods: {
   onInput() {
      // this.currentValue is a string because HTML is weird
      this.$emit('input', parseInt(this.currentValue));
      this.$store.commit('setDistanceCenter',this.currentValue)
      console.log(this.$store.state.distanceCenter)
      const number = this.currentValue
      this.toggleBeach(number)
      this.toggleBeach2(number)
    },

    
    toggleBeach(distance) {
      console.log("max distance is " + distance)
      this.$store.state.hotels = this.$store.state.hotels.filter(hotel => {
        return hotel.distance_to_beach <= distance
      });},
     
     
     toggleBeach2(distance) {
      console.log("max distance is " + distance)
      this.$store.state.searchedHotels = this.$store.state.searchedHotels.filter(hotel => {
        return hotel.distance_to_beach <= distance
      });},
  }
};
</script>

<style scoped>
.slider-component .slidecontainer {
	width: 100%;
}

.slider-component .slidecontainer .slider {
	-webkit-appearance: none;
	appearance: none;
	width: 100%;
	height: 4px;
	border-radius: 2px;
	background: #c2c2c2;
	outline: none;
	opacity: 0.7;
	-webkit-transition: .2s;
	transition: opacity .2s;
}

.slider-component .slidecontainer .slider:hover {
	opacity: 1;
}

.slider-component .slidecontainer .slider::-webkit-slider-thumb {
	-webkit-appearance: none;
	appearance: none;
	width: 18px;
	height: 18px;
	background: #D8A22E;
	cursor: pointer;
	border-radius: 50%;
}

.slider-component .slidecontainer .slider::-moz-range-thumb {
	width: 18px;
	height: 18px;
	background: #D8A22E;
	cursor: pointer;
	border-radius: 50%;
}
</style>