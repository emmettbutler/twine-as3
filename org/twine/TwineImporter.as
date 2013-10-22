/*
    This file is part of twine-as3.

    twine-as3 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    twine-as3 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
 */
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
