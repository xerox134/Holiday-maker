<template>
  <div>
    <div>Max: {{ currentValue }} km</div>
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
        />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    value: {
      type: Number,
      required: true,
    },
    min: {
      type: Number,
      required: true,
    },
    max: {
      type: Number,
      required: true,
    },
  },
  data() {
    return {
      currentValue: this.value,
    };
  },
  methods: {
    onInput() {
      // this.currentValue is a string because HTML is weird
      this.$emit("input", parseInt(this.currentValue));
      this.$store.commit("setDistanceBeach", this.currentValue);
      console.log(this.$store.state.distance_to_beach);
      const number = this.currentValue;
      this.$store.state.hotels = this.$store.state.hotels2;
      this.$store.state.searchedHotels = this.$store.state.searchedHotels2;
      this.toggleBeach(number);
      this.toggleBeach2(number);
    },

    toggleBeach(distance) {
      if (this.$store.state.distanceCenter != null) {
        this.$store.state.hotels = this.$store.state.hotels.filter((hotel) => {
          return hotel.distance_to_center <= this.$store.state.distanceCenter;
        });
      }

      console.log(
        "max distance from center is: " + this.$store.state.distanceCenter
      );
      this.$store.state.hotels = this.$store.state.hotels.filter((hotel) => {
        return hotel.distance_to_beach <= distance;
      });
    },

    toggleBeach2(distance) {
      if (this.$store.state.distanceCenter != null) {
        this.$store.state.searchedHotels = this.$store.state.searchedHotels.filter(
          (hotel) => {
            return hotel.distance_to_center <= this.$store.state.distanceCenter;
          }
        );
      }

      console.log("max distance from beach is:" + distance);
      this.$store.state.searchedHotels = this.$store.state.searchedHotels.filter(
        (hotel) => {
          return hotel.distance_to_beach <= distance;
        }
      );
    },
  },
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
  -webkit-transition: 0.2s;
  transition: opacity 0.2s;
}

.slider-component .slidecontainer .slider:hover {
  opacity: 1;
}

.slider-component .slidecontainer .slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 18px;
  height: 18px;
  background: #d8a22e;
  cursor: pointer;
  border-radius: 50%;
}

.slider-component .slidecontainer .slider::-moz-range-thumb {
  width: 18px;
  height: 18px;
  background: #d8a22e;
  cursor: pointer;
  border-radius: 50%;
}
</style>