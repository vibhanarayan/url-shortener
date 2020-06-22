const express= require('express');
const router = express.Router();
const validUrl= require('valid-url');
const shortId= require('shortid');
const config= require('config');
const Url= require('../models/Url');
const { route } = require('.');

//@route POST api/url/shorten
//@desc create short url 

router.post('/', async(req, res)=>{
    const longUrl = req.body.fullUrl;
    const baseUrl = config.get('baseURL');
    if(!validUrl.isUri(baseUrl)){
       return res.status(401).json('Invalid base url');
    }
   
    //create url code
    const urlCode = shortId.generate();
    if(validUrl.isUri(longUrl)){
        try {
          let url = await Url.findOne({longUrl});
          if(url){
            res.render('index', {url:url});
          }
          else{
              const shortUrl= baseUrl+ '/' + urlCode;
              url = new Url({
                  longUrl,
                  shortUrl,
                  urlCode,
                  date:new Date()
              });
              await url.save();
              res.render('index', {url : url});
           
          }
        } catch (err) {
            console.log(err);
            res.status(500).json('Server Error');

        }

    }else{
        res.status(401).json('Invalid long url');
    }
});
module.exports=router;