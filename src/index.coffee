http = require("http")
connect = require("connect")
errorHandler = connect.errorHandler()

module.exports = (err, req, res, next)->
    switch toString.call(err)
        when "[object Number]"
            status = err
            err = new Error()
            err.status = status
        when "[object String]"
            err = new Error(err)

    if (err.status) then res.statusCode = err.status
    if (res.statusCode < 400) then res.statusCode = 500
    err.name = http.STATUS_CODES[res.statusCode]
    err.message or= "cannot #{req.method} #{req.path}"

    connect.errorHandler.title = 'Server Error'
    if (status >= 400 and status < 500)
        connect.errorHandler.title = 'Error'

    errorHandler(err, req, res, next)

    # delete details after logging the error, but before loading it into the template
    if (process.env.NODE_ENV is 'production' or req.app?.get?('env') is 'production')
        delete err.stack
