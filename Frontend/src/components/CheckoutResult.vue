<template>
  <div>
    <h1>{{ result }}</h1>
  </div>
</template>

<script>
export default {
  computed: {
    result() {
      return this.$route.params.result;
    },
  },
};
</script>
