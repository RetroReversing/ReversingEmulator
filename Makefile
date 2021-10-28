all: 
	git submodule update --init --recursive
	mkdir -p ./release/libRetroReversing/websrc/dist
	# cd ./libRetroReversing/websrc && npm install && npm run production
	cp -r ./libRetroReversing/websrc/dist ./release/libRetroReversing/websrc/
	cp *.sh ./release/
	cp *.bat ./release/
	cp -r *.app ./release/
	cd ./SameBoy && "$(MAKE)" libretro
	cp ./SameBoy/libretro/*.[ds][ylo]* ./release/ 2>/dev/null
	cd ./Genesis-Plus-GX/ && make && cp *.[ds][ylo]* ../release/
	cd ./PokeMini/ && make && cp *.[ds][ylo]* ../release/
	cd ./beetle-saturn-libretro && make && cp *.[ds][ylo]* ../release/
	cd ./snes9x2010 && make && cp *.[ds][ylo]* ../release/
	echo "Successful"
clean:
	cd ./SameBoy && "$(MAKE)" clean
	cd ./Genesis-Plus-GX && "$(MAKE)" clean
web:
	git submodule update --init --recursive
	echo "Building Web Source"
	mkdir -p ./release/libRetroReversing/websrc/dist
	cd ./libRetroReversing/websrc && npm install && npm run production
