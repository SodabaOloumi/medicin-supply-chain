<template>
  <div class="body">
  
  <div class="card" >
            
            <TabMenu :model="items" space
            
            />
            <router-view/>
        </div>
      
       <div class="flex justify-content-center " style=" width: 100%;">
    <DataTable :value="requests" responsiveLayout="scroll" class="col-12">
              
                <template>
                 
               <Column v-for="col of columns" :field="col.field" :header="col.header" :sortable="true" :key="col.field">
               </Column> 
               
                <Column field="code" header="Total" style="width:20%">
                <template #body="slotProps">
                   {{ slotProps.data.price * slotProps.data.amount}}
                </template>
               </Column>
                <Column field="code" header="Company Virefy" style="width:20%">
                   <template #body="slotProps">
                 
                    
                    <p v-if="slotProps.data.state == 1 || slotProps.data.state == 3 "   @click="virefy(slotProps , index)"><i class="pi pi-check" style="color: purple; font-size: 20px; font-weight: bold;"></i></p>
                    <p v-if="slotProps.data.state == 2 || slotProps.data.state == 4 "   @click="virefy(slotProps , index)"><i class="pi pi-times" style="color: purple; font-size: 20px; font-weight: bold;"></i></p>
                    <p v-if="slotProps.data.state == 0 "    @click="virefy(slotProps , index)"><i class="pi pi-stop" style="color: blue; font-size: 20px; font-weight: bold;"></i></p>
          </template>
                </Column>
                 <Column field="code" header="GOV Check" style="width:20%">
                   
            <template #body="slotProps">
                   
                    <p v-if="slotProps.data.state == 3"   @click="virefyGOV(slotProps , index)"><i class="pi pi-check" style="color: blue; font-size: 20px; font-weight: bold;"></i></p>
                    <p v-if="slotProps.data.state == 4 "   @click="virefyGOV(slotProps , index)"><i class="pi pi-times" style="color: purple; font-size: 20px; font-weight: bold;"></i></p>
                    <p v-if="slotProps.data.state == 0 || slotProps.data.state == 2 || slotProps.data.state == 1 "    @click="virefyGOV(slotProps , index)"><i class="pi pi-stop" style="color: blue; font-size: 20px; font-weight: bold;"></i></p>
          </template>
                </Column>

                <Column field="code" header="PAY" style="width:20%">
                   
            <template #body="slotProps">
             
                    <Button
              v-if="slotProps.data.state == 3" 
              label="Pay"
              class="p-button-rounded p-button-help"
              @click="payD = true"
            />
            <p v-if="slotProps.data.state == 5" style="color:green; font-size:20px">This request is done</p>
                    
          </template>
                </Column>
                </template>
       
            
    </DataTable>
    
     
  
</div>

<Dialog
      :closable="false"
      :visible="verifyDialog"
      :style="{ width: '550px' }"
      header="Confirm"
      :modal="true"
    >
      <div class="confirmation-content">
        
       
          Do you want to virefy or reject selected request with ID <b> {{ DId }} </b> ?
        
      </div>

      <Button
          label="Virefy"
          icon="pi pi-check"
          class="p-button-text"
          @click="acceptByCompany(DId,Baddress)"
        />
        <Button
          label="Reject"
          icon="pi pi-times"
          class="p-button-text"
          @click="companyReject(DId,Baddress)"
        />
      <template #footer>
         <Button label="Cancle" icon="pi pi-times" @click="verifyDialog = false , DId =null, Baddress=null" class="p-button-text"/>
      </template>
    </Dialog>


    <Dialog
      :closable="false"
      :visible="ckeckDialog"
      :style="{ width: '550px' }"
      header="Confirm"
      :modal="true"
    >
      <div class="confirmation-content">
        
       
          Do you want to virefy or reject selected request with ID <b> {{ DId }} </b> ?
        
      </div>

      <Button
          label="Virefy"
          icon="pi pi-check"
          class="p-button-text"
          @click="GOVpermision(DId,Baddress)"
        />
        <Button
          label="Reject"
          icon="pi pi-times"
          class="p-button-text"
          @click="GOVreject(DId,Baddress)"
        />
      <template #footer>
         <Button label="Cancle" icon="pi pi-times" @click="ckeckDialog = false , DId =null, Baddress=null" class="p-button-text"/>
      </template>
    </Dialog>

    <Dialog
      :closable="false"
      :visible="payD"
      :style="{ width: '550px' }"
      header="PAY"
      :modal="true"
    >
      <div class="confirmation-content">
        <form>
      <InputNumber  v-model="DId" name="email" placeholder="Enter id of drug"/>
      <InputNumber  v-model="value" name="name" placeholder="Enter the totla price of drug"/>
        </form>
      </div>

      <Button
          label="Pay"
          icon="pi pi-check"
          class="p-button-text"
          @click="pay(DId,value)"
        />
      <template #footer>
         <Button label="Cancle" icon="pi pi-times" @click="payD = false , DId =null, value=null" class="p-button-text"/>
      </template>
    </Dialog>
  
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
            verifyDialog:false,
            ckeckDialog:false,
            payD:false,
            DId:null,
            Baddress:null,
            value:null,
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
      
      columns : [
            {field: 'id', header: 'ID'},
            {field: 'name', header: 'Name'},
            {field: 'characteristics', header: 'Characteristics'},
            {field: 'buyerAdd', header: 'Address'},
            {field: 'price', header: 'Price'},
            {field: 'amount', header: 'Amount'},
            
           
            
            
        ],
            
        }
    },
     async created() {
   
      this.getDruges()
  },
  async computed(){
    this.getDruges()
  },
  async mounted() {
   
      this.getDruges()
  },
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
      
      async  acceptByCompany(id,address){
                
                
                console.log(id,address)
                await App.App.acceptByCompany(id,address)
                this.getDruges();
                this.verifyDialog = false;
                this.DId =null;
                this.Baddress = null;

      },
      virefy(x,index){
        console.log("fffff",x,index);
        this.DId = x.data.id ;
        // this.Baddress = JSON.stringify(x.data.buyerAdd)
         this.Baddress = x.data.buyerAdd
        this.verifyDialog = true
        
      },
       virefyGOV(x,index){
        console.log("fffff",x,index);
        this.DId = x.data.id ;
        // this.Baddress = JSON.stringify(x.data.buyerAdd)
         this.Baddress = x.data.buyerAdd
        this.ckeckDialog = true
        
      },
      async  companyReject(id,address){
                
                console.log(id,address)
                await App.App.companyReject(id, address)
                this.getDruges();
                 this.verifyDialog = false;
                this.DId =null;
                this.Baddress = null;
               
      },
      async  GOVpermision(id,address){
                
                console.log("HHHHHHHHHHHHHHHH",id,address)
                await App.App.GOVpermision(id,address)
                this.getDruges();
                 this.ckeckDialog = false;
                this.DId =null;
                this.Baddress = null;
               
      },
    async  GOVreject (id,address){
                
                console.log(id,address)
                await App.App.GOVreject(id, address)
                this.getDruges();
                 this.ckeckDialog = false;
                this.DId =null;
                this.Baddress = null;
               
      },
      async getDruges(){
        this.requests = await App.App.getDruges()
      },
    async  pay(id,value){
        await App.App.pay(id, value)
        this.payD = false
      
        
      },
    }
}
</script>

<style>
body {
  margin: 0;
 
  /* display: flex;
  justify-content: center;
  margin-top: 200px;
  background-image: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"%3E%3Cg fill-rule="evenodd"%3E%3Cg fill="%239C92AC" fill-opacity="0.4"%3E%3Cpath opacity=".5" d="M96 95h4v1h-4v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9zm-1 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm9-10v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm9-10v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm9-10v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9z"/%3E%3Cpath d="M6 5V0H5v5H0v1h5v94h1V6h94V5H6z"/%3E%3C/g%3E%3C/g%3E%3C/svg%3E'); */

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

#feedback-form input[type=text]{
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