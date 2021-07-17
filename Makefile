build:
	haxe -cp src/ -hl bin/output.hl -main Main
run:
	hl bin/output.hl
hide-build:
	haxe --cwd hide/ hide.hxml
	chmod +x ./hide/bin/hide.cmd
hide-run:
	(nohup nice ./hide/bin/hide.cmd &) > /dev/null 2>&1 &