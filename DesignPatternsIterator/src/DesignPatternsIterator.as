package
{
	import br.com.netoleal.data.DescendingIterator;
	import br.com.netoleal.data.Iterator;
	import br.com.netoleal.data.RandomIterator;
	import br.com.netoleal.interfaces.IIterator;
	import br.pedromoraes.btween.ISequenceable;
	
	import com.asdevs.designpatterns.data.FlickrPhotoData;
	import com.asdevs.designpatterns.data.FlickrRecentPhotosData;
	import com.asdevs.designpatterns.view.FlickrPhoto;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import hype.extended.layout.GridLayout;
	
	[SWF( width="800", height="600", frameRate="31" )]
	
	public class DesignPatternsIterator extends Sprite
	{
		private var flickr:FlickrRecentPhotosData;
		private var photos:Array;
		
		public function DesignPatternsIterator( )
		{
			stage.mouseChildren = false;
			
			flickr = new FlickrRecentPhotosData( );
			photos = new Array( );
			
			flickr.addEventListener( Event.COMPLETE, onLoad );
			flickr.loadRecentPhotos( );
		}
		
		private function onMouseDown( evt:MouseEvent ):void
		{
			clear( ).queue( populate );
		}
		
		private function onLoad( evt:Event ):void
		{
			populate( );
			stage.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
		}
		
		private function populate( ):void
		{
			var photosIterator:IIterator = flickr.photos.iterator( );
			var photoData:FlickrPhotoData;
			var layout:GridLayout = new GridLayout( 0, 0, 80, 80, 10 );
			var photo:FlickrPhoto;
			
			clear( );
			
			while( photosIterator.hasNext( ) )
			{
				photoData = photosIterator.next( );
				photo = new FlickrPhoto( photoData );
				
				layout.applyLayout( photo );
				
				addChild( photo );
				photos.push( photo );
			}
		}
		
		private function clear( ):ISequenceable
		{
			var seq:ISequenceable;
			var item:FlickrPhoto;
			var n:uint = 0;
			var it:IIterator = new Iterator( photos );// new DescendingIterator( photos );// new RandomIterator( photos );
			
			while( it.hasNext( ) )
			{
				item = it.next( );
				seq = item.exit( 10 * ( n++ ) ).queue( removeChild, item );
			}
			
			photos = new Array( );
			
			return seq;
		}
	}
}