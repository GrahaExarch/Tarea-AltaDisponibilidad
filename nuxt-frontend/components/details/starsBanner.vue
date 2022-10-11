<template>
  <div>
    <v-icon v-for="(item, index) in stars" :key="index" color="red">
      {{ `mdi-${item}` }}
    </v-icon>
  </div>
</template>

<script>
// star-outline star-half star
export default {
  props: {
    rating: {
      type: Number,
      default: 5,
    },
  },
  data() {
    return {
      stars: null,
    }
  },
  mounted() {
    this.stars = this.starsQuantity(this.rating)
  },
  methods: {
    starsQuantity(rating) {
      const intRating = Math.trunc(rating)
      const decRating = rating - intRating
      const starList = []
      for (let i = 0; i < intRating; i++) {
        starList.push('star')
      }

      if (decRating !== 0) starList.push('star-half-full')

      if (starList.length < 5) {
        for (let i = starList.length; i < 5; i++) {
          starList.push('star-outline')
        }
      }

      return starList
    },
  },
}
</script>
