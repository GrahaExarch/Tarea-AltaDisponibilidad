<template>
  <v-row v-if="!loading" justify="center">
    <v-col v-for="(item, index) in datos" :key="index" cols="4" lg="3">
      <ResumenCard
        :id="item.id"
        :name="item.nombre"
        :description="item.detalle"
        :imgroute="item.urlimagen"
        :type="item.idtipo"
        :rating="item.rating"
      />
    </v-col>

    <v-col cols="4" lg="3" class="pa-4 my-auto">
      <v-btn color="primary" nuxt to="/agregar-medio"
        ><span><v-icon>mdi-plus</v-icon> Agregar </span>
      </v-btn>
    </v-col>
  </v-row>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  name: 'IndexPage',
  data() {
    return {
      datos: {},
      tipos: {},
      loading: true,
    }
  },
  async mounted() {
    this.loading = true
    this.datos = await this.getContents()
    this.tipos = await this.getTipoName()
    this.datos.forEach((element) => {
      this.tipos.forEach((types) => {
        if (types.id === element.idtipo) element.idtipo = types.nombre
      })
    })
    this.loading = false
  },
  methods: {
    ...mapActions({
      getContents: 'getContents',
      getTipoName: 'getTipoName',
    }),
  },
}
</script>
