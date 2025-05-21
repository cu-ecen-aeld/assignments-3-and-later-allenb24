CROSS_COMPILE ?= 

writer : writer.c
	$(CROSS_COMPILE)gcc $^ -o $@

clean:
	rm -f writer *.o
