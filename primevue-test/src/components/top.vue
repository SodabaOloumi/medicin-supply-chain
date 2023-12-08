<template>
  <div>
     <div class="card">
            
            <TabMenu :model="items" 
            
            />
            <router-view/>
        </div>

  
  </div>
</template>

<script>
import App from "../index.js"
export default {
  
data() {
        return {
            visibleLeft: true,
            user:null,
             items: [ ],
            
        }
    },
    
    async mounted() {
    this.user = await App.App.getUser()
    console.log(this.user[2],"user")
    if(this.user[2] == 0){
      this.items = [
        {
                    label: 'Home',
                    icon: 'pi pi-fw pi-home',
                    to: '/home'
                },
                {
                    label: 'Add User',
                    icon: 'pi pi-users',
                    to: '/addUser'
                },
                {
                    label: 'Add Reguest',
                    icon: 'pi pi-fw pi-pencil',
                    to: '/addRequest'
                },
      ]  
    }
    else  {
        this.items = [
        {
                    label: 'Home',
                    icon: 'pi pi-fw pi-home',
                    to: '/home'
                },
                {
                    label: 'Add User',
                    icon: 'pi pi-users',
                    to: '/addUser'
                },
                {
                    label: 'Reguest',
                    icon: 'pi pi-fw pi-pencil',
                    to: '/addRequest'
                },
      ] 
    } 
    
    
},
created() {
    
    
}
    
}
</script>

<style  scoped>
.card{
    width: 100%;
    margin-top:14px ;
}
</style>
