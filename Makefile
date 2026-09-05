include include/general.mak
.PHONY: radical
radical:
	$(Q)cp $(HOME)/A3/sk-gcc/.json/directories.jsonc $(HOME)/A3/sk-gcc/.json/directories.A3
	$(Q)cp $(HOME)/A3/sk-gcc/blash/blashmodules/butiwe.A3 $(HOME)/A3/sk-gcc/blash/blashmodules/butiwe.A3O
	$(Q)cp $(HOME)/A3/sk-gcc/blash/blashmodules/hiberfil.A3 $(HOME)/A3/sk-gcc/blash/blashmodules/hiberfil.A3O
	$(Q)cp $(HOME)/A3/sk-gcc/blash/blashmodules/butterfly.A3 $(HOME)/A3/sk-gcc/blash/blashmodules/butterfly.A3O
	$(Q)cp $(HOME)/A3/sk-gcc/blash/blashmodules/peceteN36640.A3 $(HOME)/A3/sk-gcc/blash/blashmodules/peceteN36640.A3O
	$(Q)cp $(HOME)/A3/sk-gcc/blash/blashmodules/cve.A3 $(HOME)/A3/sk-gcc/blash/blashmodules/cve.A3O
	$(Q)cp $(HOME)/A3/sk-gcc/blash/blashmodules/gougd.A3 $(HOME)/A3/sk-gcc/blash/blashmodules/gougd.A3O
	$(Q)cp $(HOME)/A3/sk-gcc/blash/blashmodules/maxinum.A3 $(HOME)/A3/sk-gcc/blash/blashmodules/maxinum.A3O
	$(Q)cp $(HOME)/A3/sk-gcc/blash/blashmodules/lazybum.A3 $(HOME)/A3/sk-gcc/blash/blashmodules/lazybum.A3O
	$(Q)cp $(HOME)/A3/sk-gcc/blash/blashmodules $(HOME)/blash