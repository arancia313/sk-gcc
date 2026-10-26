SK = $(SKGCC)
include $(SK)/include/general.mak
.PHONY: radical
radical:
	$(Q)cp -r $(SK)/.json/directories.jsonc		$(SK)/.json/directories.A3
	$(Q)cp -r $(SK)/blash/blashmodules/butiwe.A3	$(SK)/blash/blashmodules/butiwe.A3O
	$(Q)cp -r $(SK)/blash/blashmodules/hiberfil.A3	$(SK)/blash/blashmodules/hiberfil.A3O
	$(Q)cp -r $(SK)/blash/blashmodules/butterfly.A3	$(SK)/blash/blashmodules/butterfly.A3O
	$(Q)cp -r $(SK)/blash/blashmodules/peceteN36640.A3	$(SK)/blash/blashmodules/peceteN36640.A3O
	$(Q)cp -r $(SK)/blash/blashmodules/cve.A3		$(SK)/blash/blashmodules/cve.A3O
	$(Q)cp -r $(SK)/blash/blashmodules/gougd.A3	$(SK)/blash/blashmodules/gougd.A3O
	$(Q)cp -r $(SK)/blash/blashmodules/maxinum.A3	$(SK)/blash/blashmodules/maxinum.A3O
	$(Q)cp -r $(SK)/blash/blashmodules/lazybum.A3	$(SK)/blash/blashmodules/lazybum.A3O
	$(Q)cp -r $(SK)/blash/blashmodules		$(HOME)/blash
clean:
	$(Q)rm -rf $(SK)/blash/blashmodules/*.A3O