<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card card-default">
                    <div class="card-header">{{id}}</div>

                    <div class="card-body">
                        <div class="form-group">
                            <label for="name">Имя</label>
                            <input type="text" class="form-control" id="name"  v-model="name">
                        </div>
                        <div class="form-group">
                            <label for="phone">Номер телефона</label>
                            <input type="text" class="form-control" id="phone" v-model="phone">
                        </div>
                        <div class="form-group">
                            <label for="comment">Коментарий</label>
                            <input type="text" class="form-control" id="comment" v-model="comment">
                        </div>

                        <div class="form-group">
                            <button class="btn btn-info" @click="postContact">Привязать</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data: function (){
            return {
                id: '',
                name:'',
                phone:'',
                comment:''
            }
        },
        mounted() {
            this.getOnePosition();
        },
        methods:{
            getOnePosition: function () {
                this.id = this.$route.params.id;
            },
            postContact: function () {
                axios.post('/addContact',{
                    name:this.name,
                    phone: this.phone,
                    comment: this.comment,
                    leads_id: this.id
                }).then((response)=>{
                    this.$router.push('/')
                });
            }
        }
    }
</script>
