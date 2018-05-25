//console.log(process.argv)
l=process.argv[2];
post=process.argv[3];

var ssbClient = require('ssb-client')
var ssbKeys = require('ssb-keys')
var ssbFeed = require('ssb-feed')

//console.log("/var/www/backend/keys/" + post);
var keyz = ssbKeys.load('/var/www/backend/keys/' + l , function(err, k) {
	console.log(err)
        ssbClient(keyz,
        function (err, sbot) {
                var feed = ssbFeed(sbot, k)

                feed.publish({
                        type: 'post',
                        text: post
                }, function (err) { console.log(err); process.exit(1); })
        })

});
