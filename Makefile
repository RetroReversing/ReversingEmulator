all: 
	git submodule update --init --recursive
	mkdir -p ./release/websrc/dist
	cd ./libRetroReversing/websrc && npm install && npm run production
	cp -r ./libRetroReversing/websrc/dist ./release/websrc/
	cd ./SameBoy && $(MAKE) libretro
	cp ./SameBoy/libretro/*.dylib ./release/ 2>/dev/null
	cp ./SameBoy/libretro/*.so ./release/ 2>/dev/null
	cp ./SameBoy/libretro/*.dll ./release/ 2>/dev/null
	cp -r *.app ./release/
	cp *.sh ./release/