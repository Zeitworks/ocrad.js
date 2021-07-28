js:
	docker create -ti --name dummy ocrad bash
	docker cp dummy:/app/pkg/ocrad.js dist/ocrad.js
	docker cp dummy:/app/pkg/ocrad.wasm dist/ocrad.wasm
	docker rm -f dummy
	cp src/runtime.js dist/
	cp examples/browser/file.html dist/

build:
	docker build -t ocrad .
