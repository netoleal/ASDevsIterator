package com.asdevs.designpatterns.data
{
	import com.adobe.serialization.json.JSONDecoder;
	import com.asdevs.designpatterns.app.Services;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class FlickrRecentPhotosData extends EventDispatcher
	{
		private var loader:URLLoader;
		private var _collection:FlickrPhotosCollection;
		
		public function FlickrRecentPhotosData( )
		{
			super( null );
			
			loader = new URLLoader( );
			
			loader.addEventListener( Event.COMPLETE, onComplete );
		}
		
		public function loadRecentPhotos( ):void
		{
			var req:URLRequest = new URLRequest( Services.FLICKR_URL );
			
			loader.load( req );
		}
		
		private function onComplete( evt:Event ):void
		{
			var rawData:Object = new JSONDecoder( loader.data ).getValue( );
			var itemRaw:Object;
			
			_collection = new FlickrPhotosCollection( );
			
			for each( itemRaw in rawData.photos.photo )
			{
				_collection.addElement( new FlickrPhotoData( itemRaw ) );
			}
			
			this.dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		public function get photos( ):FlickrPhotosCollection
		{
			return _collection;
		}
	}
}