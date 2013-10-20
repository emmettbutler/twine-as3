package org.twine {
    import com.adobe.serialization.json.JSON;

    public class TwineImporter {
        // CHANGE THIS PATH TO YOUR EXPORTED JSON
        [Embed(source='../../../assets/mystory.json', mimeType="application/octet-stream")] public static var twineFile:Class;

        private var twineFile_:Object = new twineFile();
        private var twineJson:String = twineFile_.toString();
        private var _data:Object;

        private var pages:Array;

        public function TwineImporter() {
            super();

            _data = com.adobe.serialization.json.JSON.decode(twineJson);
            parseTwine();
        }

        public function parseTwine():Array{
            pages = new Array();
            for (var i:Number = 0; i < _data['data'].length; i++) {
                var jsbit:Object = _data['data'][i];
                var title:String = jsbit['title'];
                var lines:Array = jsbit['text'].split('\n');
                var tags:Array = jsbit['tags'];
                var newPage:TwinePage = new TwinePage(title, jsbit['text'], jsbit['tags']);
                pages[i] = newPage;
            }
            return pages;
        }

        public function getPages():Array {
            return pages;
        }
    }
}
