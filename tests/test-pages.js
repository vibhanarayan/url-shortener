var expect  = require('chai').expect;
var request = require('request');
var mongoose = require('mongoose');
const Schema = mongoose.Schema;
var config = require('config');
var dbName = config.get('mongoTestURI');
const testSchema = new Schema({
    name: { type: String, required: true }
  });
const Name = mongoose.model('Name', testSchema);

describe('Test ejs templates', function(){
  it('Main page status', function(done) {
    request('http://localhost:8080' , function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        done();
    });
});
})


describe('Database Tests', function() {
    
    before(function (done) {
      mongoose.connect(dbName,{
        useNewUrlParser:true,
        useUnifiedTopology: true
      });
      const db = mongoose.connection;
      db.on('error', console.error.bind(console, 'connection error'));
      db.once('open', function() {
        console.log('We are connected to test database!');
        done();
      });
    });
    describe('Test Database', function() {
   
      it('New name saved to test database', function(done) {
        var testName = Name({
          name: 'Mike'
        });
   
        testName.save(done);
      });
      it('Dont save incorrect format to database', function(done) {
        var wrongSave = Name({
          notName: 'Not Mike'
        });
        wrongSave.save(err => {
          if(err) { return done(); }
          throw new Error('Should generate error!');
        });
      });
      it('Should retrieve data from test database', function(done) {
        Name.find({name: 'Mike'}, (err, name) => {
          if(err) {throw err;}
          if(name.length === 0) {throw new Error('No data!');}
          done();
        });
      });
    });
    after(function(done){
      mongoose.connection.db.dropDatabase(function(){
        mongoose.connection.close(done);
      });
    });
  });