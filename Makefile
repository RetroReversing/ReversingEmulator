all: 
	mkdir -p ./release
	cd ./libRetroReversing/websrc && npm install && npm run production
	cp -r ./libRetroReversing/websrc ./release/websrc
	git submodule update --init --recursive
	cd ./SameBoy && $(MAKE) libretro
	cp ./SameBoy/libretro/*.dylib ./release/