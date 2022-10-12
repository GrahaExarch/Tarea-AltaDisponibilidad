<template>
  <v-row justify="center">
    <ResumenCard
      :name="'Bayonetta 3'"
      :description="'OMG HOLY SHIT LA WEA BKN'"
      :imgroute="'/Bayonetta3.jpg'"
      :type="'Nintendo Switch'"
    />
    <ResumenCard
      :name="'Xenoblade Chronicles 3'"
      :description="'Besto juego 2022'"
      :imgroute="'/xenoblade3.jpg'"
      :rating="5"
      :type="'Nintendo Switch'"
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
export default {
  name: 'IndexPage',
}
</script>
