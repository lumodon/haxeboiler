init:
	haxelib git heaps https://github.com/HeapsIO/heaps
	haxelib git castle https://github.com/ncannasse/castle
	haxelib git hxbit https://github.com/ncannasse/hxbit
	haxelib git hscript https://github.com/HaxeFoundation/hscript
	haxelib git hxnodejs https://github.com/HaxeFoundation/hxnodejs
	haxelib git domkit https://github.com/HeapsIO/domkit
	haxelib git hx3compat https://github.com/HaxeFoundation/hx3compat
	haxelib install hlsdl
build:
	haxe -cp src/ -hl bin/output.hl -main Main
run:
	hl bin/output.hl
hide-build:
	haxe --cwd hide/ hide.hxml
	chmod +x ./hide/bin/hide.cmd
hide-run:
	(nohup nice ./hide/bin/hide.cmd &) > /dev/null 2>&1 &