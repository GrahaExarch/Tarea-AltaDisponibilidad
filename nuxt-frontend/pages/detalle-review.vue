<template>
  <StarsBanner :rating="3.5" />
</template>

<script>
export default {
  data() {
    return {
      listaReviews: null,
    }
  },
  mounted() {
    console.log('kkkk')
  },
  methods: {
    imprimir(texto) {
      return texto
    },
  },
}
</script>

<style scoped></style>
