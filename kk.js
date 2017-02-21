var log=console.log
var request=require('request')
var fs=require('fs')
var path=require('path')
request.get('https://www.cleverfiles.com/howto/wp-content/uploads/2016/08/mini.jpg').pipe(fs.createWriteStream(path.join(__dirname,'x.jpg')));

function x(err,resp,data){
	//log('data',data);
	var jpg=require('jpeg-js')
	raw=jpg.decode(data);
	var bmp=require('bmp-js')
	x=bmp.encode(raw);
	log('x',x);
}
