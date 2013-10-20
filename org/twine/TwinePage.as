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
