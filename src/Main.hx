/**
    Multi-line comments for documentation.
**/

/**
class Main {
    static public function main():Void {
        // Single line comment
        trace("Hello World");
    }
}
**/

class Main extends hxd.App {
    override function init() {
        var tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        tf.text = "Hello World !";
    }
    static public function main():Void {
        new Main();
    }
}