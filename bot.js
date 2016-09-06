console.log('It lives!');

var Twit = require('twit');
var config = require('./config');
var T = new Twit(config);
var exec = require('child_process').exec;
var fs = require('fs');

postTweet();
// Interval: 3 hours
// 1000 milliseconds * 60 seconds * 60 minutes * 3 hours
setInterval(postTweet, 1000*60*60*3);

function postTweet() {
  var cmd = 'cellendipity_EC2/Cellendipity_EC2';
  exec (cmd, processing);

  function processing() {
    console.log('Uploading media...');
    var filename = 'cellendipity_EC2/output.png';
  	var params = {
      encoding: 'base64'
  	}
    var b64 = fs.readFileSync(filename, params);

    T.post('media/upload', { media_data: b64 }, uploaded);

    function uploaded(err, data, response) {
      var id = data.media_id_string;
      console.log("id=" + id)
  	  var tweet = {status: 'Generated cellular life stories. #cellendipity', media_ids: [id]}
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
