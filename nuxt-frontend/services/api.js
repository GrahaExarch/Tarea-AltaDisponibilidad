export default ($axios)=>({
    getRating(params){return $axios.$get('rating/get',{params:{id:params.id}}
    )},
    getContents(){return $axios.$get('lista') },
    getTipoName(){return $axios.$get('tipos')} ,
    postNewTipo(payload){return $axios.$post('nuevotipo',payload)},
    postNewContenido(payload){return $axios.$post('nuevocontenido',payload)},
    deleteContenido(payload){return $axios.$delete('borrar',payload)},
    updateContenido(payload){return $axios.$put('actualizar',payload)},
})