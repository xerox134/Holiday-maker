// vue.config.js
module.exports = {
    // https://cli.vuejs.org/config/#devserver-proxy
    devServer: {
        port: 3000,
        proxy: {
            '/rest': {
                target: 'http://localhost:8080',
                ws: true,
                changeOrigin: true
            },
            '/api': {
                target: 'http://localhost:8080',
                ws: true,
                changeOrigin: true
            },
            '/auth': {
                target: 'http://localhost:8080',
                ws: true,
                changeOrigin: true
            },
            '/login': {
                target: 'http://localhost:8080',
                ws: true,
                changeOrigin: true,
                secure: false
            },
            '/logout': {
                target: 'http://localhost:8080',
                ws: true,
                changeOrigin: true
            },
            '/auth/register': {
                target: 'http://localhost:8080',
                ws: true,
                changeOrigin: true,
                secure: false
            }
        },       
    }
}