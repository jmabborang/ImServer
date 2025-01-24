const tokenRoute = require('./token')
const userLoginRoute = require('./login')

const mountRoutes = (app) => {
    


    
    app.use('/', tokenRoute)
    app.use('/userLogin', userLoginRoute)
}

module.exports = mountRoutes