import { createApp } from 'vue'

import App from './App.vue'
import VueSidebarMenuAkahon from "vue-sidebar-menu-akahon";

import 'mdb-vue-ui-kit/css/mdb.min.css';

import router from './router'
import primevue from "primevue/config"
import "primevue/resources/themes/saga-blue/theme.css"
import "primevue/resources/primevue.min.css"                 
import "primeicons/primeicons.css"
import "primeflex/primeflex.css"

import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";

import Button from 'primevue/button'   
import InputText from "primevue/inputtext";
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import ColumnGroup from 'primevue/columngroup';     //optional for column grouping
import Row from 'primevue/row'; 
import Dialog from "primevue/dialog"
import Dropdown from "primevue/dropdown"
import Password  from "primevue/password"
import Calendar from "primevue/calendar"
import Textarea from 'primevue/textarea';
import Splitter from "primevue/splitter"
import SplitterPanel from "primevue/splitterpanel"
import Checkbox from "primevue/checkbox"
import Tree from "primevue/tree"
import Divider from "primevue/divider"
import Sidebar from 'primevue/sidebar';
import TabMenu from "primevue/tabmenu"
import InputNumber from "primevue/inputnumber"
const app = createApp(App)
// app.use(router)
app.use(router)
app.use(primevue)
app.component('vue-sidebar-menu-akahon', VueSidebarMenuAkahon);
app.component("Button", Button)
app.component("InputText", InputText)
app.component("DataTable",DataTable)
app.component("Column",Column)
app.component("ColumnGroup",ColumnGroup)
app.component("Row",Row)
app.component("Dialog",Dialog)
app.component("Dropdown", Dropdown)
app .component("Password",Password)
app.component("Calendar",Calendar)
app.component("Textarea",Textarea)
app.component("Splitter",Splitter)
app.component ("SplitterPanel", SplitterPanel)
app.component("Checkbox",Checkbox)
app.component("Tree",Tree)
app.component("Divider",Divider)
app.component("Sidebar",Sidebar)
app.component("TabMenu",TabMenu)
app.component("InputNumber",InputNumber)
// Vue.component("Button", Button)
// Vue.component("InputText", InputText)
// Vue.component("DataTable",DataTable)
// Vue.component("Column",Column)
// Vue.component("ColumnGroup",ColumnGroup)
// Vue.component("Row",Row)
// Vue.component("Dialog",Dialog)
// Vue.component("Dropdown", Dropdown)
// new Vue({
//     router,
//     primevue,
//     render: h => h(App)
//   }).$mount("#app");
app.mount('#app')
