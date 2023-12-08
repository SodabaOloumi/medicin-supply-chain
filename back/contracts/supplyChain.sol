
// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24 < 0.9.0;


contract supplyChain {
    Drug[] private druges;
     enum State {
        DrugStore,
        company,
        GOV
    }

    enum DState {
        forsell,
        accepted,
        unaccepted,
        permision,
        unpermision,
        finishes
    }


    struct Drug{
        string name;
        uint price;
        uint amount;
        DState state;
        uint id;
        string characteristics;
        address buyerAdd;
        address company;
        

    }
    struct User{
        string Name;
        address uAddress;
        State state;
    }

    mapping (address => User) public users;

    mapping(uint256 => mapping(address => Drug) )public drugs;

    modifier isCompany(address uadd){
        require(users[uadd].state == State.company,"Caller is not a Company address!");
        _;
    }
    modifier isDrugStore(address uadd){
        require(users[uadd].state == State.DrugStore,"Caller is not a DrugStore address!");
        _;
    }
    modifier isGOV(address uadd){
        require(users[uadd].state == State.GOV,"Caller is not a GOV address!");
        _;
    }
    modifier forsell(uint id,address dAddress){
        
        require((drugs[id][dAddress].state == DState.forsell)||
        (drugs[id][dAddress].state == DState.unaccepted),"for sell....");
        _;
    }
     modifier isAccepted(uint id,address dAddress){
         
        require((drugs[id][dAddress].state == DState.accepted)||
        (drugs[id][dAddress].state == DState.unpermision),"not accpeted");
        _;
    }

    constructor(){

    }

    function addUser(address uadd,string memory name, string memory _state) public  returns(bool) {
        // check user is exist or no
        require(users[uadd].uAddress == address(0),"this User already Exited");
        
        
        //  choose sate 
        if(keccak256(abi.encodePacked('Company')) == keccak256(abi.encodePacked(_state))){
         
              users[uadd] = User({
                Name:name,
                uAddress:  uadd,
                state:State.company

            }); 
            
         }
        else if (keccak256(abi.encodePacked('GOV')) == keccak256(abi.encodePacked(_state))){
               
                users[uadd] = User({
                Name:name,
                uAddress:  uadd,
                state:State.GOV

            });  
        }else{
                users[uadd] = User({
                Name:name,
                uAddress:  uadd,
                state:State.DrugStore

            });
        }
        // add new user
       
        return true;

    }  

     function getUser() view public  returns(string memory name,address uAddress ,State){
      
        User storage d =users[msg.sender];
        return(d.Name,d.uAddress,d.state);
    }

     function addRequest(uint id,string memory name, string memory characteristics,uint amount,uint price) isDrugStore(msg.sender) public returns(bool){
        require(users[msg.sender].uAddress != address(0),"User Not Exited");
        drugs[id][msg.sender] = Drug({
            name:name,
            amount:amount,
            price:price,
            state:DState.forsell,
            id:id,
            characteristics:characteristics,
            buyerAdd: msg.sender,
            company:address(0)
        });
       addDruges(name , amount , price,id,characteristics);

        return true;

    }

     function acceptByCompany(uint id,address dAddress) public forsell(id,dAddress) isCompany(msg.sender) returns(bool){
        
        Drug storage d =drugs[id][dAddress];
        d.state = DState.accepted;
        d.company = msg.sender;
         uint index;
        for(uint i = 0; i<druges.length; i++){
            if (druges[i].id == id && druges[i].buyerAdd == dAddress) {
                index = i;
                break;
            }
        }
         
        druges[index].state = DState.accepted;
        druges[index].company = msg.sender;

        return true;

    }
    function companyReject(uint id,address dAddress) public  isCompany(msg.sender)  returns(bool){
         require((drugs[id][dAddress].state == DState.forsell)||
        (drugs[id][dAddress].state == DState.accepted),"not permision");
        Drug storage d =drugs[id][dAddress];
        d.state = DState.unaccepted;
        d.company = address(0);

        uint index;
        for(uint i = 0; i<druges.length; i++){
            if (druges[i].id == id && druges[i].buyerAdd == dAddress) {
                index = i;
                break;
            }
        }
         
        druges[index].state = DState.unaccepted;
        druges[index].company = address(0);
        return true;
    }

    //when the company senr a string to Gov and the GOV permision 
    function GOVpermision(uint id,address dAddress) public isGOV(msg.sender) isAccepted(id,dAddress) returns(bool){
        Drug storage d =drugs[id][dAddress];
        d.state = DState.permision;

        uint index;
        for(uint i = 0; i<druges.length; i++){
            if (druges[i].id == id && druges[i].buyerAdd == dAddress) {
                index = i;
                break;
            }
        }
         
        druges[index].state = DState.permision;
        return true;
    }

     function GOVreject(uint id,address dAddress) public isGOV(msg.sender)  returns(bool){
        require(drugs[id][dAddress].state == DState.permision,"not permision");
        Drug storage d =drugs[id][dAddress];
        d.state = DState.unpermision;

        uint index;
        for(uint i = 0; i<druges.length; i++){
            if (druges[i].id == id && druges[i].buyerAdd == dAddress) {
                index = i;
                break;
            }
        }
         
        druges[index].state = DState.unpermision;
        return true;
    }


      //get all requsets from mapping druge 
    function getReq(address _DS,uint id) view public  returns(uint _id,string memory name,uint price,uint amount,DState){
    //    require((drugs[id][_DS].state == DState.forsell) || 
    //     (drugs[id][_DS].state == DState.accepted)
    //   ," request not exist or campany not accept");
        Drug storage d =drugs[id][_DS];
        return(id,d.name,d.price,d.amount,d.state);
    }
    function addDruges(string memory name,uint amount,uint price,uint id, string memory characteristics) internal returns(bool) {
            druges.push(
            Drug({name:name,
            amount:amount,
            price:price,
            state:DState.forsell,
            id:id,
            characteristics:characteristics,
            buyerAdd: msg.sender,
            company:address(0)
            })
        );

        return true;
    }
    function getDruges() public view returns (Drug[] memory) {
        return druges;
    }

    function pay(uint id) isDrugStore(msg.sender) payable public returns(bool){
        require(drugs[id][msg.sender].state == DState.permision,"the GOV do not permision of the druge..");
        require(msg.value >= (drugs[id][msg.sender].amount * drugs[id][msg.sender].price )* 1 ether, "You must pay at least 1 ETH per cupcake");
       // require(users[dcompany].state == State.company,"Company address IS Wrong!");
         Drug storage d =drugs[id][msg.sender];
         d.state = DState.finishes; 
         uint index ;
         for(uint i = 0; i<druges.length; i++){
            if (druges[i].id == id && druges[i].buyerAdd == msg.sender) {
                index = i;
                break;
            }
        }
         
        druges[index].state = DState.finishes;
    //    msg.value = (d.price) *(d.amount);
       
        address company = d.company;
        payable(company).transfer(msg.value);
        // dcompany.transfer(value * (1 ether) );
        return true;
    }
    //  function getBalance() external view returns(uint){
    //     return address(this).balance;
    // }

}
