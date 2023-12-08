# Medicin Supply chain


## Workflow Contacts Steps:

1. Company, Government, and Drug Store register themselves on the contract.
- Each entity provides necessary information and documentation to complete the registration process.
- Contract terms and conditions are agreed upon by all parties.

2. Drug Store user adds a request for drugs with characteristics (name, amount, price, etc.).
- The request is submitted through the designated platform or system.
- Necessary details and specifications are provided for the requested drugs.

3. When the drug store user adds a drug store's request, a company accepts the request when it accepts the entered drug specification.
- The company reviews the request and verifies that it aligns with their capabilities and requirements.
- Upon acceptance, the company communicates its decision to the drug store user.

4. After the company user accepts a request, government user can accept or reject the request.
- The government reviews the accepted request to ensure compliance with regulations and policies.
- A decision is made to either approve or reject the request based on regulatory considerations.

5. When the government accepts the request, after that drug store user pays the fee for company user.
- Upon approval from the government, the drug store user proceeds to make payment for the approved drugs.
- Payment is processed through an agreed-upon method and is received by the company as per contractual terms.

These steps outline a workflow for interactions between Company, Government, and Drug Store entities in registering contracts and processing requests for drugs. Each step involves communication and decision-making processes to ensure compliance and successful transactions.


## How to run this project locally:

### Prerequisites
- Node.js >= v14
- Truffle and Ganache
- npm
### Contracts
- Clone code 
 ``
git clone https://github.com/SodabaOloumi/medicin-supply-chain.git

- `cd back`
- Run `npm install` in root to install Truffle build and smart contract dependencies
- Run local testnet in port `7545` with an Ethereum client, e.g. Ganache
- `truffle migrate --network development `
- In truffle-config.js file , Fill in the following below.
  - MNEMONIC=" your mnemonic here in quotes"
  - INFURA_URL=insert your infura url
  - `truffle migrate --network ropsten `

- Run tests `truffle test`

### Frontend
- `cd primevue-test`
- `npm install`
- `npm run serve`
- Open `http://localhost:8080` 

## structure
- `primevue-test`: Project's Vue frontend.
- `back`: Backend file
    - `contracts`: supplyChain.sol 
    - `test` : this is where the tests are stored. The test is written in truffle. The purpose and expected outcome of each test is explained in the code. 
     to run the test
    `
    truffle test
    `
    - `build`: When compile the contract this folder created , its save **data/abi** .
    - `migrations`: Migration files for deploying contracts in `contracts` directory.


