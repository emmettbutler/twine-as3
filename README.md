Twine for Actionscript
======================

twine-as3 is a set of classes used to import stories written in
[twine](http://www.gimcrackd.com/etc/src/) to
Actionscript 3 data structures. With this, you can easily prototype
story-based games in twine and import those stories into flash-based games,
including [flixel](http://www.flixel.org/) projects.

Formatting twine stories for import is a multi-step process:

Once you have a complete twine project, use the
[twee json exporter](https://github.com/emmett9001/twee) to
convert your twine .tw file to the JSON data format.

    ./twee my/file.tw -t json > out.json

Copy this repo's `org` directory into your project. If your project already
contains an `org` directory, copy `org/twine` into the existing `org`
directory.

Copy this repo's `lib` directory into your project. If your project already
contains a `lib` directory, copy `lib/as3corelib.swc` to the existing `lib`
directory.

Import the library

    import org.twine.*;

Embed your exported JSON file anywhere in your code

    [Embed(source='../assets/my_story.json', mimeType="application/octet-stream")] public static var twineFile:Class;

Get the story as an imported AS3 array by calling

    var pages:Array = (new org.twine.TwineImporter(twineFile)).getPages();

Compile the project by linking to the `as3corelib` library

    mxmlc my/project.as -include-libraries=lib/as3corelib.swc
