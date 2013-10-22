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
    along with twine-as3.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.twine {
    public class TwinePage {
        private var title:String;
        private var lines:Array;
        private var linesText:String;
        private var tags:Array;

        public function TwinePage(title:String, lines:String, tags:Array) {
            this.title = title;
            this.linesText = lines;
            this.lines = lines.split('\n');
            this.tags = tags;
        }

        public function getLine(_index:int):String {
            return lines[_index];
        }

        public function getTitle():String {
            return title;
        }

        public function getTags():Array {
            return tags;
        }

        public function getText():String {
            return linesText;
        }

        public function getNumberOfLines():int {
            return lines.length;
        }
    }
}
