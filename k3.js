var jimp=require('jimp')
var log=console.log
jimp.read('./x.bmp', function(err,image){
	image.write('./bmp2jpg.jpg')
	log('err',err);
});
