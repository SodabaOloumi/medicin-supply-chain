<template>
  <div>

  
   
     <!-- <ctreat-cirtific></ctreat-cirtific> -->
    <router-view></router-view>
  </div>
</template>

<script>

// import ctreatCirtific from "./home.vue";
export default {
  // components:{ctreatCirtific},
  
    data() {
        return {
            visibleLeft: true,
        }
    }

}
</script>

<style>
.h{
  backgroundColor:rgba(216, 186, 50, 0.402);
  height: 40px;
  
  
}
</style>