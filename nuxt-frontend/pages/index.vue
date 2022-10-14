<template>
  <v-row justify="center">
    <ResumenCard
      v-for="(item, index) in datos"
      :key="index"
      :name="item.nombre"
      :description="item.detalle"
      :imgroute="item.urlimagen"
      :type="item.idtipo"
      :rating="item.rating"
    />
    <v-col cols="auto" class="pa-4 my-auto">
      <v-card align="center">
        <v-btn color="primary" nuxt to="/agregar-medio"
          ><span><v-icon>mdi-plus</v-icon> Agregar </span>
        </v-btn>
      </v-card>
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
    }
  },
  async mounted() {
    this.datos = await this.getContents()
    this.tipos = await this.getTipoName()
    this.datos.forEach((element) => {
      this.tipos.forEach((types) => {
        if (types.id === element.idtipo) element.idtipo = types.nombre
      })
    })
  },
  methods: {
    ...mapActions({
      getContents: 'getContents',
      getTipoName: 'getTipoName',
    }),
  },
}
</script>
