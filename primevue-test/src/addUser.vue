<template>
  <div>
  
  <div class="card">
            
            <TabMenu :model="items" 
            
            />
            <router-view/>
        </div>

       
  <div class="modal-content" style=" width: 100%;">
  <div class="modal-body">
        <div class="column" id="main">
          <h1>Registration Form </h1>
          
          <form>
                <div class="user-box">
                <input v-model="name" type="text" name="" required="">
                <label>Name</label>
                </div>
                <div class="user-box">
                <input v-model="uadd" type="text" name="" required="">
                <label>Ethereum Address </label>
                </div>
                <div class="user-box" style="margin-bottom:12px;">
                <input type="text" v-model="userTypes" list="types" />
                <datalist id="types">
                        <option v-for="c in types" :key="c">{{c.type}}</option>
                        </datalist>
                </div>
                
                
            
          </form>
          <button type="" @click="addUser()" class="btn btn-primary">Register</button>
        </div>
        <div>
          <!-- <?xml version="1.0" encoding="UTF-8"?> -->
          <svg width="67px" height="578px" viewBox="0 0 67 578" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
              <!-- Generator: Sketch 53.2 (72643) - https://sketchapp.com -->
              <title>Path</title>
              <desc>Created with Sketch.</desc>
              <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <path d="M11.3847656,-5.68434189e-14 C-7.44726562,36.7213542 5.14322917,126.757812 49.15625,270.109375 C70.9827986,341.199016 54.8877465,443.829224 0.87109375,578 L67,578 L67,-5.68434189e-14 L11.3847656,-5.68434189e-14 Z" id="Path" fill="#F9BC35"></path>
              </g>
          </svg>
        </div>
        <div class="column" id="secondary">
          <div class="sec-content">
            <h2>Welcome!</h2>
            <h3>You can register three type, Buyer,Company,GOV. </h3>
          </div>
        </div>
  </div>
</div>
  </div>
</template>

<script>

import App from "./index"

export default {

    data(){
        return{
            visibleRight:true,
           types: [ 
            {type:"Company"},
            {type:"GOV"},
            {type:"Buyer"}    
            ],
            userTypes:null,
            name:null,
            uadd:null,
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
      async addUser(){
                let C = {
                    uadd:this.uadd,
                    name:this.name,
                    userTypes:this.userTypes,
                }
                
                console.log(C.uadd, C.name, C.userTypes)
                await App.App.addUser(C.uadd, C.name, C.userTypes)
               
            },

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

.modal-body {
  display: flex;
  padding: 0;
  border-radius: 4rem;
  font-family: 'PT Sans', sans-serif;
}

.modal-content {
  border-radius: 4rem;
  width: 140%;
  margin-top: 73px;
  -webkit-box-shadow: -1px -2px 42px -19px rgba(0,0,0,0.74);
-moz-box-shadow: -1px -2px 42px -19px rgba(0,0,0,0.74);
box-shadow: -1px -2px 42px -19px rgba(0,0,0,0.74);
}
.modal-content h1, .modal-content h2, .modal-content h3 {
    text-align: center;
}
.modal-content h1 {
  font-size: 1.3em;
  text-transform: uppercase;
}

.modal-content h2 {
    font-size: 1.1em;
}
.modal-content h3 {
  font-size: .8em;
  letter-spacing: 2px;
}
form {
    font-size: .8em;
}
.column {
  flex: 50%;
  padding: 10px;
}

.column#main {
  flex: 75%;
  padding: 50px;
  margin-top: 30px;
  margin-left: 15px;
}

#secondary {
  background-color: #F9BC35;
  border-radius: 0 4rem 4rem 0;
  text-align: center;
}

#main .form-control {
  border-radius: 0;
  font-size: .9em;
}

.btn {
  text-transform: uppercase;
  border-radius: .15rem;
  width: 200px;
  padding: .150rem .75rem;
  margin: 30px auto;
  font-family: 'PT Sans', sans-serif;
  letter-spacing: 2px;
}

.btn-primary {
  border-color: rgba( 255, 255, 255, 0);
  background: #f1da36; /* Old browsers */
background: -moz-linear-gradient(left, #f1da36 0%, #fca86c 99%); /* FF3.6-15 */
background: -webkit-linear-gradient(left, #f1da36 0%,#fca86c 99%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to right, #f1da36 0%,#fca86c 99%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f1da36', endColorstr='#fca86c',GradientType=1 ); /* IE6-9 */
/* Color format:     Comments */
}

.btn-primary:hover {
  border-color: rgba( 255, 255, 255, 0);
}

#main .btn-primary {
  width: 100%;
}
#secondary .btn-primary {
  background: #f8f9fa4f;
  color: #000;
}
.modal-body label {
  margin-bottom: 0;
}

.sec-content {
  margin-top: 70%;
}
.user-box {
  position: relative;
}

.user-box input {
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  color: rgb(10, 6, 6);
  margin-bottom: 30px;
  border: none;
  border-bottom: 1px solid rgb(3, 2, 2);
  outline: none;
  background: transparent;
}
 .user-box label {
  position: absolute;
  top:0;
  left: 0;
  padding: 10px 0;
  font-size: 16px;
  color: rgb(27, 22, 22);
  pointer-events: none;
  transition: .5s;
}

.user-box input:focus ~ label,
.user-box input:valid ~ label {
  top: -20px;
  left: 0;
  color: #f1da36;
  font-size: 12px;
}
</style>