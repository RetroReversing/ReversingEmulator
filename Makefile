all: 
	# git submodule update --init --recursive # only should be run first time (make it conditional?)
	@make common
	# cd ./libRetroReversing/websrc && npm install && npm run production
	@make sameboy_core
	@make genesis_core
	@make pokemini_core
	@make saturn_core
	@make snes_core
	@make n64_core
	@echo "Successful"
common:
	@echo "Moving Common files"
	mkdir -p ./release/libRetroReversing/websrc/dist
	cp -r ./libRetroReversing/websrc/dist ./release/libRetroReversing/websrc/
	cp -r ./libRetroReversing/export_templates ./release/libRetroReversing/export_templates/
	cp *.sh ./release/
	cp *.bat ./release/
	cp -r *.app ./release/
sameboy_core:
	@echo Building SameBoy
	cd ./SameBoy && "$(MAKE)" libretro
	cp ./SameBoy/libretro/*.[ds][ylo]* ./release/ 2>/dev/null
	@echo "SameBoy Core Built"
pokemini_core:
	@echo Building PokeMini
	cd ./PokeMini && "$(MAKE)"
	cp ./PokeMini/*.[ds][ylo]* ./release/ 2>/dev/null
	@echo "PokeMini Core Built"
saturn_core:
	@echo Building Saturn
	cd ./beetle-saturn-libretro && "$(MAKE)"
	cp ./beetle-saturn-libretro/*.[ds][ylo]* ./release/ 2>/dev/null
	@echo "Saturn Core Built"
snes_core:
	@echo Building SNES
	cd ./snes9x2010 && "$(MAKE)"
	cp ./snes9x2010/*.[ds][ylo]* ./release/ 2>/dev/null
	@echo "SNES Core Built"
n64_core:
	@echo Building N64
	# brew install pkg-config
	cd ./mupen64plus-core/projects/unix && "$(MAKE)" all SHAREDIR=.
	cp ./mupen64plus-core/projects/unix/*.[ds][ylo]* ./release/ 2>/dev/null
	@echo "N64 Core Built"
genesis_core:
	@echo "Building GenesisPlusDX for SMS and GG"
	cd ./Genesis-Plus-GX/ && make && cp *.[ds][ylo]* ../release/
	@echo "Genesis Core Built"
clean:
	cd ./SameBoy && "$(MAKE)" clean
	cd ./Genesis-Plus-GX && "$(MAKE)" clean
web:
	@echo "Building Web Source"
	git submodule update --init --recursive
	mkdir -p ./release/libRetroReversing/websrc/dist
	cd ./libRetroReversing/websrc && npm install && npm run production
