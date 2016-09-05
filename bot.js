console.log('It lives!');

var Twit = require('twit');
var config = require('./config');
var T = new Twit(config);
var exec = require('child_process').exec;
var fs = require('fs');

postTweet();
// 1000 milliseconds * 60 seconds * 120 minutes = 2 hours
setInterval(postTweet, 1000*60*120);

function postTweet() {
  var cmd = 'cellendipity\cellendipity';
  exec (cmd, processing);

  function processing() {
    console.log('Uploading media...');
    var filename = 'cellendipity/output.png';
  	var params = {
      encoding: 'base64'
  	}
    var b64 = fs.readFileSync(filename, params);
    
    T.post('media/upload', { media_data: b64 }, uploaded);

    function uploaded(err, data, response) {
      var id = data.media_id_string;
      console.log("id=" + id)
  	  var tweet = {status: 'A generated life story. #cellendipity', media_ids: [id]}
      T.post('statuses/update', tweet, tweeted);
    }

    function tweeted (err, data, response) {
      if (err) {
  	  	console.log("Something went wrong!");
  	  } else {
  	    console.log("It worked!");
  	  }
    }
  }
}
