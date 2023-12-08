<template>
  <div>
  
  <div class="card">
            
            <TabMenu :model="items" 
            
            />
            <router-view/>
        </div>
        <div id="feedback-form">
  <h2 class="header">Application medicine</h2>
  <div>
    <form>
      <input type="number" v-model="id" name="email" placeholder="ID"/>
      <input type="text" v-model="name" name="name" placeholder="Name"/>
      <input type="number" v-model="amount" name="email" placeholder="Amount"/>
      <input type="number" v-model="price" name="email" placeholder="Price"/>
      <Textarea v-model="characteristics" placeholder="Drug'scharacteristics" rows="4"  />
      
      <!-- <label for="feedback-notify">Remind me about this event via SMS</label>
      <input type="checkbox" id="feedback-notify" name="notify">
      <input type="text" id="feedback-phone" name="phone" placeholder="Phone number"/> -->
      
    </form>
    <button @click="addRequest()" >Register</button>
    
       
  </div>
</div>
   

  </div>
</template>

<script>
// import getRegest from "./getRequest.vue"
import App from "./index"
// import jsonR from "./assets/request.json"
// import axios from "axios";
// import fs from "fs"
// const baseURL = "http://localhost:3001/";
export default {
    // components:{
    //   getRegest
    // },
    data(){
        return{
            verify:false,
            DId:null,
            Baddress:null,
            requests:[],
           types: [ 
            {type:"Company"},
            {type:"GOV"},
            {type:"Buyer"}    
            ],
            id:null,
            name:null,
            price:null,
            amount:null,
            characteristics:null,
            items: this.items = [
        {
                    label: 'Home',
                    icon: 'pi pi-fw pi-home',
                    to: '/home'
                },
                {
                    label: 'Add User',
                    icon: 'pi pi-users',
                    to: '/'
                },
                {
                    label: 'Add Reguest',
                    icon: 'pi pi-plus',
                    to: '/addRequest'
                },
                {
                    label: 'Reuests',
                    icon: 'pi pi-plus',
                    to: '/getRequest'
                },
      ] ,
            
        }
    },
  //    async created() {
  //   try {
  //     const res = await axios.get(baseURL);

  //     this.requests = res.data;
  //   } catch (e) {
  //     console.error(e);
  //   }
  // },
//       async created() {
//     this.user = await App.App.getUser()
//     console.log(this.user[2],"user")
//     if(this.user[2] == 0){
//       this.items = [
//         {
//                     label: 'Home',
//                     icon: 'pi pi-fw pi-home',
//                     to: '/home'
//                 },
//                 {
//                     label: 'Add User',
//                     icon: 'pi pi-users',
//                     to: '/'
//                 },
//                 {
//                     label: 'Add Reguest',
//                     icon: 'pi pi-plus',
//                     to: '/addRequest'
//                 },
//       ]  
//     }
//     else  {
//         this.items = [
//         {
//                     label: 'Home',
//                     icon: 'pi pi-fw pi-home',
//                     to: '/home'
//                 },
//                 {
//                     label: 'Add User',
//                     icon: 'pi pi-users',
//                     to: '/'
//                 },
//                 {
//                     label: 'Reguest',
//                     icon: 'pi pi-fw pi-pencil',
//                     to: '/addRequest'
//                 },
//       ] 
//     } 
    
    
// },
      methods: {
      async addRequest(){
              //  var arr =[]
               
                 
                let C = {
                    id:this.id,
                    name:this.name,
                    amount:this.amount,
                    price:this.price,
                    characteristics:this.characteristics
                }
                // var arr =[]
                console.log(C.id, C.name, C.amount)
                await App.App.addRequest(C.id, C.name, C.amount,C.price, C.characteristics)
                
                //  this.requests.push({id:C.id, name:C.name, amount:C.amount, price:C.price})

                

                // jsonR.request = JSON.stringify(arr)
                // let data = JSON.stringify(arr);
                // const fs = require('fs');
                //   try { fs.writeFileSync('myfile.txt', data, 'utf-8'); }
                //   catch(e) { alert('Failed to save the file !'); }
                   
                // console.log(jsonR.request)
                    // try {
                    //     const res = await axios.post(baseURL, {id:C.id, name:C.name, amount:C.amount, price:C.price});
                    //      console.log(res,"res")
                    //     this.requests = [...this.requests, res.data];

                    //     // this.todoName = "";
                    //   } catch (e) {
                    //     console.error(e);
                    //   }
                // arr.push({id:C.id , name:C.name})
                // console.log(arr,C.id)
                // const data = JSON.stringify(arr)
                // const data = "hello"
                // try { fs.write('request.json', jsonR.request, 'utf-8'); }
                // catch(e) { alert('Failed to save the file !'); }
                          
            },
      async  acceptByCompany(){
          let C = {
                    DId:this.DId,
                    Baddress:this.Baddress,
                   
                }
                // var arr =[]
                console.log(C.DId, C.Baddress)
                await App.App.acceptByCompany(C.DId, C.Baddress)

      },
      async  companyReject(){
          let C = {
                    DId:this.DId,
                    Baddress:this.Baddress,
                   
                }
                // var arr =[]
                console.log(C.DId, C.Baddress)
                await App.App.companyReject(C.DId, C.Baddress)

      },
      async getDruges(){
        this.requests = await App.App.getDruges()
      }
    }
}
</script>

<style>
body {
  display: flex;
  justify-content: center;
  margin-top: 200px;
  /* background-image: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"%3E%3Cg fill-rule="evenodd"%3E%3Cg fill="%239C92AC" fill-opacity="0.4"%3E%3Cpath opacity=".5" d="M96 95h4v1h-4v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9zm-1 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm9-10v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm9-10v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm9-10v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9z"/%3E%3Cpath d="M6 5V0H5v5H0v1h5v94h1V6h94V5H6z"/%3E%3C/g%3E%3C/g%3E%3C/svg%3E'); */

}
#feedback-form {
  width: 580px;
  margin: 0 auto;
  background-color: #fcfcfc;
  padding: 20px 50px 40px;
  box-shadow: 1px 4px 10px 1px #aaa;
  font-family: sans-serif;
  margin-top: 39px;
}

#feedback-form * {
    box-sizing: border-box;
}

#feedback-form h2{
  text-align: center;
  margin-bottom: 30px;
}

#feedback-form input {
  margin-bottom: 15px;
}
#feedback-form Textarea {
  margin-bottom: 15px;
}

#feedback-form input[type=text]{
  display: block;
  height: 32px;
  padding: 6px 16px;
  width: 100%;
  border: none;
  background-color: #f3f3f3;
}
#feedback-form Textarea{
  display: block;
  height: 32px;
  padding: 6px 16px;
  width: 100%;
  border: none;
  background-color: #f3f3f3;
}
#feedback-form input[type=number]{
  display: block;
  height: 32px;
  padding: 6px 16px;
  width: 100%;
  border: none;
  background-color: #f3f3f3;
}

#feedback-form label {
  color: #777;
  font-size: 0.8em;
}

#feedback-form input[type=checkbox] {
  float: left;
}

#feedback-form input:not(:checked) + #feedback-phone {
  height: 0;
  padding-top: 0;
  padding-bottom: 0;
}

#feedback-form #feedback-phone {
  transition: .3s;
}

#feedback-form button {
  display: block;
  margin: 20px auto 0;
  width: 150px;
  height: 40px;
  border-radius: 25px;
  border: none;
  color: #eee;
  font-weight: 700;
  box-shadow: 1px 4px 10px 1px #aaa;
  
  background: #dba00c; /* Old browsers */
  background: -moz-linear-gradient(left, #dba00c 0%, #f5e832 100%); /* FF3.6-15 */
  background: -webkit-linear-gradient(left, #dba00c 0%,#f5e832 100%); /* Chrome10-25,Safari5.1-6 */
  background: linear-gradient(to right, #dba00c 0%,#f5e832 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#207cca', endColorstr='#9f58a3',GradientType=1 ); /* IE6-9 */
}

</style>