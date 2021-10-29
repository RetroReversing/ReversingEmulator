all: 
	# git submodule update --init --recursive # only should be run first time (make it conditional?)
	@make common
	# cd ./libRetroReversing/websrc && npm install && npm run production
	@make sameboy_core
	cd ./Genesis-Plus-GX/ && make && cp *.[ds][ylo]* ../release/
	cd ./PokeMini/ && make && cp *.[ds][ylo]* ../release/
	cd ./beetle-saturn-libretro && make && cp *.[ds][ylo]* ../release/
	# cd ./snes9x2010 && make && cp *.[ds][ylo]* ../release/
	@echo "Successful"
common:
	@echo "Moving Common files"
	mkdir -p ./release/libRetroReversing/websrc/dist
	cp -r ./libRetroReversing/websrc/dist ./release/libRetroReversing/websrc/
	cp *.sh ./release/
	cp *.bat ./release/
	cp -r *.app ./release/
sameboy_core:
	@echo Building SameBoy
	cd ./SameBoy && "$(MAKE)" libretro
	cp ./SameBoy/libretro/*.[ds][ylo]* ./release/ 2>/dev/null
	@echo "SameBoy Core Built"
clean:
	cd ./SameBoy && "$(MAKE)" clean
	cd ./Genesis-Plus-GX && "$(MAKE)" clean
web:
	@echo "Building Web Source"
	git submodule update --init --recursive
	mkdir -p ./release/libRetroReversing/websrc/dist
	cd ./libRetroReversing/websrc && npm install && npm run production
