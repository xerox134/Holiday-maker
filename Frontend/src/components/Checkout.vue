<template>
    <div class="intro text">
        <h2>{{title}}</h2>

        <ul>
            <li v-for="(item, i) in items" :key="i">
                {{item.title}} {{item.amount}} x {{item.price}} = {{item.amount * item.price}}
            </li>            
        </ul>
        <p>Total: {{total}}</p>

        <button @click="checkout">Checkout</button>

    </div>
</template>

<script>

export default{
    data(){
        return {
            title: "Checkout"
        }
    },
    computed:{
        items(){
            return this.$store.state.cartItems
        },
        total(){
            let t = 0
            for(let item of this.items){
                t = t + item.price * item.amount
            }
            return t
        }
    },
    methods:{
        checkout(){
            this.$store.dispatch('checkout', this.total)
        }
    }
}
</script>
