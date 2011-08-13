package com.asdevs.designpatterns.view
{
	import br.pedromoraes.btween.ISequenceable;
	
	import com.asdevs.designpatterns.data.FlickrPhotoData;
	import com.asdevs.designpatterns.utils.FX;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class FlickrPhoto extends Sprite
	{
		public function FlickrPhoto( data:FlickrPhotoData )
		{
			super( );
			
			var loader:Loader = new Loader( );
			
			loader.load( new URLRequest( data.imageURL ) );
			loader.contentLoaderInfo.addEventListener( Event.COMPLETE, onLoad );
			
			addChild( loader );
			
			alpha = 0;
		}
		
		private function onLoad( evt:Event ):void
		{
			FX.fadeIn( this );
		}
		
		public function exit( delay:uint = 0 ):ISequenceable
		{
			return FX.fadeOut( this, 200, 0, delay );
		}
	}
}