<template>
  <div>
     <Sidebar></Sidebar>
    
        <h1 style="text-align: center; color: #197a75;">Virefy Certificate </h1>
       
<!-- <div class="login-box" style="margin-top: 40px ;">
 <form>
    
    <div class="user-box">
      <input v-model="idc" type="text" name="" required="">
      <label>id</label>
    </div>
    <a href="#" @click="getData()">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
       Verify
    </a>
  </form>
</div> -->


     
        
        <div class="card" >
           
            <div class="grid">
                <div class="col-5 flex align-items-center justify-content-center">
                    <div class="p-fluid">
                        <div class="field">
                            
                            <InputText v-model="idc" id="username" type="text" placeholder="Enter Id" />
                        </div>
                      
                        <Button class="bg-teal-600 " @click="getData()" label="Verify"></Button>
                     </div>
                </div>
                <div class="col-2">
                    <Divider layout="vertical">
                        <b class="teal-600">RESULT</b>
                    </Divider>
                </div>
                <div v-if="certificate != null" >
                  <br>
                   <h3>Certificate with following dettails found</h3>
                   <br>
                   <hr>
                   <pre style="font-size:22px "> <b>Name : {{certificate[0]}} {{certificate[1]}} </b> </pre>
                   <pre style="font-size:22px "> <b>Course: {{certificate[2]}}</b></pre>
                   <pre style="font-size:22px "> <b>Issued: {{certificate[3]}}</b></pre>
                </div>
                <div v-if="message != null && certificate != null" >
                  <br>
                   <h3>Not Found</h3>
                   <br>
                   <hr>
                   
                </div>
            </div>
        </div>
    </div>
         <!-- <div  v-if="certificate != null">
         <h1 style="padding-top: 120px ;">Certificate of Completion</h1>
          
          <h5 style="margin-top: 40px ;"><b>{{certificate[0]}} {{certificate[1]}}</b></h5>

          <h5 style="margin-top: 30px ;">has successfully completed <br><b>{{certificate[2]}}</b></h5>

          <pre style="margin-top: 70px ; padding-left: 48px;">Issued:{{certificate[3]}}                  Certificate Id : {{certificate[0]}}{{certificate[1]}} 
            <br>Certificate hash ID : {{certificate[4]}} 
           </pre> -->
          
          
          
          <!-- <br><br><br>
          
      
        </div> -->
              
  
  
      
    
      
  
</template>

<script>
import App from "./index.js";
import Sidebar from "./components/top.vue"
import printJS from 'print-js'
export default {
    components: { Sidebar },
    data (){
      return{
       displayC:false,
       idc:null,
       certificate:null,
       message:null
      }
    },

    methods: {
    
      async getData(){
               
               this.certificate = await App.App.getData(this.idc)
                console.log("idc", this.idc,this.certificate)
                this.displayC =true
                this.idc = null
                this.message = "Not Found"
                
            },      
        printTWo() {
        printJS({
          printable: "tg-wrap",
          type: "html",
          targetStyles: ["*"],
          maxWidth: 1200,
          scanStyles: true,
          style: "",
          onError: function (error) {
            console.log(error);
          },
        });
      }
    }

}
</script>

<style  scoped>


html {
  height: 100%;
  
}
.card{
  margin:64px;
  padding:14px;
}
/* body {
  margin:0;
  padding:0;
  font-family: sans-serif;
  background: linear-gradient(#fcfdfe, #197a75);
} */
.certificate{
   
   background-repeat: no-repeat;
   width: 100%;
   background-size: cover; 
    text-align: center; 
    color: #d6d0c08a;
    border: #03e9f4;
    
}

.login-box {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 400px;
  padding: 40px;
  transform: translate(-50%, -50%);
  background: rgba(0,0,0,.5);
  box-sizing: border-box;
  box-shadow: 0 15px 25px rgba(0,0,0,.6);
  border-radius: 10px;
}

.login-box h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
  
}

.login-box .user-box {
  position: relative;
}

.login-box .user-box input {
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  margin-bottom: 30px;
  border: none;
  border-bottom: 1px solid #fff;
  outline: none;
  background: transparent;
}
.login-box .user-box label {
  position: absolute;
  top:0;
  left: 0;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  pointer-events: none;
  transition: .5s;
}

.login-box .user-box input:focus ~ label,
.login-box .user-box input:valid ~ label {
  top: -20px;
  left: 0;
  color: #03e9f4;
  font-size: 12px;
}

.login-box form a {
  position: relative;
  display: inline-block;
  padding: 10px 20px;
  color: #03e9f4;
  font-size: 16px;
  text-decoration: none;
  text-transform: uppercase;
  overflow: hidden;
  transition: .5s;
  margin-top: 40px;
  letter-spacing: 4px
}

.login-box a:hover {
  background: #03e9f4;
  color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 5px #03e9f4,
              0 0 25px #03e9f4,
              0 0 50px #03e9f4,
              0 0 100px #03e9f4;
           
}

.login-box a span {
  position: absolute;
  display: block;
}

.login-box a span:nth-child(1) {
  top: 0;
  left: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(90deg, transparent, #03e9f4);
  animation: btn-anim1 1s linear infinite;
}

@keyframes btn-anim1 {
  0% {
    left: -100%;
  }
  50%,100% {
    left: 100%;
  }
}

.login-box a span:nth-child(2) {
  top: -100%;
  right: 0;
  width: 2px;
  height: 100%;
  background: linear-gradient(180deg, transparent, #03e9f4);
  animation: btn-anim2 1s linear infinite;
  animation-delay: .25s
}

@keyframes btn-anim2 {
  0% {
    top: -100%;
  }
  50%,100% {
    top: 100%;
  }
}

.login-box a span:nth-child(3) {
  bottom: 0;
  right: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(270deg, transparent, #03e9f4);
  animation: btn-anim3 1s linear infinite;
  animation-delay: .5s
}

@keyframes btn-anim3 {
  0% {
    right: -100%;
  }
  50%,100% {
    right: 100%;
  }
}

.login-box a span:nth-child(4) {
  bottom: -100%;
  left: 0;
  width: 2px;
  height: 100%;
  background: linear-gradient(360deg, transparent, #03e9f4);
  animation: btn-anim4 1s linear infinite;
  animation-delay: .75s
}

@keyframes btn-anim4 {
  0% {
    bottom: -100%;
  }
  50%,100% {
    bottom: 100%;
  }
}

</style>