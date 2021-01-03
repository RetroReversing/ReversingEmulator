all: 
	git submodule update --init --recursive
	mkdir -p ./release/websrc/dist
	cd ./libRetroReversing/websrc && npm install && npm run production
	cp -r ./libRetroReversing/websrc/dist ./release/websrc/
	cd ./SameBoy && $(MAKE) libretro
	cp ./SameBoy/libretro/*.[ds][ylo]* ./release/ 2>/dev/null
	cp -r *.app ./release/
	cp *.sh ./release/