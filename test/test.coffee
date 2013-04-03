chai = require 'chai'
expect = chai.expect
chai.should()

describe('Middleware', ->
    it('should compile without errors', ->
        repl = require("../src")
        expect(repl).to.be.ok
    )
)
