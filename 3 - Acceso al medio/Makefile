.phony: all clean


all:
#	cd mlfoundations ; make all
	@for a in $$(ls); do \
		if [ -d $$a -a $$a != ${EXCLUDE} ]; then \
		echo "Processing folder $$a"; \
		cd $$a; \
		make all; \
		cd ..; \
	fi; \
	done;
	@echo "Done!"

clean:
	@for a in $$(ls); do \
		if [ -d $$a -a $$a != ${EXCLUDE} ]; then \
		echo "Processing folder $$a"; \
		cd $$a; \
		make clean; \
		cd ..; \
	fi; \
	done;
	@echo "Done!"
