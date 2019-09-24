<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <span v-show="load">Loading...</span>
                <table class="table">
                    <thead>
                    <tr>
                        <td>id</td>
                        <td>Название</td>
                        <td>Дата создания</td>
                        <td>Есть контакт</td>
                        <td>Действия</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="lead in leads">
                        <td>{{lead.id}}</td>
                        <td>{{lead.name}}</td>
                        <td>{{lead.created_at}}</td>
                        <td> {{lead.main_contact['id'] ? 'Да' : 'Нет' }}</td>
                        <td>
<!--                            <button class="btn btn-info" :disabled=false v-if="lead.main_contact['id']">Привязать контакт</button>-->
<!--                            <a href="#/contact/{{lead.id}}" class="btn btn-info" :disabled=true v-else>Привязать контакт</a>-->
<!--                            <router-link to="/contact/2">Tablet {{lead.id}}</router-link>-->
<!--                            <router-link-->
<!--                                tag="a"-->
<!--                                class="btn btn-info"-->
<!--                                :to="{path: '#/contact', query: {id: lead.id}}"-->
<!--                            >Привязать контакт</router-link>-->
                            <router-link :to="{ name: 'contact', params: { id: lead.id }}">User</router-link>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data:function(){
            return{
                leads:[],
                load:false,
                terms:false
            }
        },
        mounted() {
            this.auth();
            this.getData();
        },
        methods: {
            auth: function () {

                this.load = true;
                axios.get('/auth').then((response) => {
                    // console.log(response)
                }).then((response) => {
                        this.load = false
                    }
                );
            },
            getData: function () {
                this.load = true;
                axios.get('/leads')
                    .then((response) => {
                        this.leads = response.data;
                        this.load = false;
                    });
            }
        }
    }
</script>
