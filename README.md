# connect-opaque-error

Provide nice error pages like `connect.errorHandler`, but don't show the stack trace in production.

## Usage

    var connect = require('connect');
    var opaqueError = require('connect-opaque-error');

    var app = connect();
    app.use(function(req, res, next) {
        next(404, req.path);
    });
    app.use(opaqueError);

    app.listen(3000);
