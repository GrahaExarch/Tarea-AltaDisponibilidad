export default ($axios)=>({
    getRating(params){return $axios.$get('rating/get',{params:{id:params.id}})} 
})