const userLoginRoute = require('./login')

const mountRoutes = (app) => {
    app.use('/userLogin', userLoginRoute)
}

module.exports = mountRoutes