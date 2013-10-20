package org.twine {
    import com.adobe.serialization.json.JSON;

    public class TwineImporter {
        private var twineFile_:Object;
        private var twineJson:String;
        private var _data:Object;

        private var pages:Array;

        public function TwineImporter(twineFile:Class) {
            super();

            twineFile_ = new twineFile();
            twineJson = twineFile_.toString();
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
