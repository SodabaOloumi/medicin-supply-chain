import Web3 from "web3";
import starNotaryArtifact from "../../back/build/contracts/supplyChain.json";
const App = {
  web3: null,
  account: null,
  meta: null,

  start: async function () {
    const { web3 } = this;

    try {
      // get contract instance
      const networkId = await web3.eth.net.getId();
      const deployedNetwork = starNotaryArtifact.networks[networkId];
      this.meta = new web3.eth.Contract(
        starNotaryArtifact.abi,
        deployedNetwork.address,
      );

      // get accounts
      const accounts = await web3.eth.getAccounts();
      this.account = accounts[0];
    } catch (error) {
      console.error("Could not connect to contract or chain.");
    }
  },

  setStatus: function (message) {
    const status = document.getElementById("status");
    status.innerHTML = message;
  },
  addUser:async function(_uadd,_name,_sate){
   const {addUser}=this.meta.methods;

   await addUser(_uadd,_name,_sate).send({ from: this.account });
  
 },
 getUser:async function(){
   const {getUser}= this.meta.methods;
    var user =await getUser().call();
  return user 
 },

 addRequest:async function(id,_name,amount,price,characteristics){
  const {addRequest}=this.meta.methods;

  await addRequest(id,_name,characteristics,amount,price).send({ from: this.account });
 
},
getDruges:async function(){
  const {getDruges}=this.meta.methods;

 var druges = await getDruges().call();

 return druges;
 
},
acceptByCompany:async function(id,address){
  const {acceptByCompany}=this.meta.methods;

  await acceptByCompany(id,address).send({ from: this.account });
 
},
companyReject:async function(id,address){
  const {companyReject}=this.meta.methods;

  await companyReject(id,address).send({ from: this.account });
 
},

GOVpermision:async function(id,address){
  const {GOVpermision}=this.meta.methods;

  await GOVpermision(id,address).send({ from: this.account });
 
},
GOVreject:async function(id,address){
  const {GOVreject}=this.meta.methods;

  await GOVreject(id,address).send({ from: this.account });
 
},
pay:async function(id,_value){
  const {pay}=this.meta.methods;
  var v = JSON.stringify(_value)
 console.log(_value, v)
  await pay(id).send({ from: this.account , value:this.web3.utils.toWei(v, "ether")});
 
},
 
//  deletePatient:async function(_id){
//    const {deletePatient}=this.meta.methods;

//    await deletePatient(_id).send({ from: this.account });
  
//  },
 




};

window.App = App;

window.addEventListener("load", async function () {
 
  if (window.ethereum) {
    // use MetaMask's provider
    App.web3 = new Web3(window.ethereum);
    await window.ethereum.enable(); // get permission to access accounts
  } else {
    console.warn("No web3 detected. Falling back to http://127.0.0.1:7545. You should remove this fallback when you deploy live");
    // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
    App.web3 = new Web3(new Web3.providers.HttpProvider("http://127.0.0.1:7545"));
  }
 
 
  

  App.start();
});
export default {App}