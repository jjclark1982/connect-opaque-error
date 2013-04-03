connect = require("connect")
errorHandler = connect.errorHandler()

module.exports = (err, req, res, next)->
    connect.errorHandler.title = 'Server Error'
    status = err.status or res.statusCode or 500
    if (status >= 400 and status < 500)
        connect.errorHandler.title = 'Error'

    if (process.env.NODE_ENV is 'production' or req.app?.get?('env') is 'production')
        delete err.stack

    errorHandler(err, req, res, next)
