package com.asdevs.designpatterns.data
{
	import br.com.netoleal.data.DescendingIterator;
	import br.com.netoleal.data.Iterator;
	import br.com.netoleal.data.RandomIterator;
	import br.com.netoleal.interfaces.ICollection;
	import br.com.netoleal.interfaces.IIterator;
	
	public class FlickrPhotosCollection implements ICollection
	{
		private var allData:Array;
		
		public function FlickrPhotosCollection( )
		{
			
		}
		
		public function addElement( value:FlickrPhotoData ):void
		{
			if( !allData ) allData = new Array( );
			allData.push( value );
		}
		
		public function count( ):uint
		{
			return allData? allData.length: 0;
		}
		
		public function iterator( ):IIterator
		{
			//return new Iterator( allData );
			return new RandomIterator( allData );
			//return new DescendingIterator( allData );
		}
	}
}