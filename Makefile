all: 
	git submodule update --init --recursive
	mkdir -p ./release
	cd ./libRetroReversing/websrc && npm install && npm run production
	cp -r ./libRetroReversing/websrc ./release/websrc
	cd ./SameBoy && $(MAKE) libretro
	cp ./SameBoy/libretro/*.dylib ./release/