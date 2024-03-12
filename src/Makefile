# Makefile for HLKX

AS = has060
ASFLAGS = -c4 -s__CRLF__

ifeq ($(findstring hlkx,$(LD)),hlkx)
USE_HLKX = true
else
LD = hlk
endif

U8TOSJ = u8tosj

SRCDIR_MK = ../srcdir.mk
SRC_DIR = ../src
-include $(SRCDIR_MK)

#

HLK_R = hlkx.r
HLK_X = hlkx.x

#

SRCS = main.s getarg.o analyze.o label.o object.o make_exe.o make_map.o roffset.o file.o string.o
OBJS = $(SRCS:.s=.o)

TXTS = hlkx.txt kaiseki.txt CHANGELOG.txt

HLK_ZIP	= hlkx.zip

#

.PHONY: all archive

all: $(if $(USE_HLKX),$(HLK_R),$(HLK_X))

archive: $(HLK_ZIP)

#

$(HLK_ZIP): $(HLK_R) $(TXTS)
	rm -f $@
	zip -9 $@ $^

hlkx.txt: $(SRC_DIR)/../hlkx.txt
	$(U8TOSJ) < $^ > $@

kaiseki.txt: $(SRC_DIR)/../kaiseki.txt
	$(U8TOSJ) < $^ > $@

CHANGELOG.txt: $(SRC_DIR)/../CHANGELOG.md
	$(U8TOSJ) < $^ > $@

#

$(HLK_R): $(OBJS)
	$(LD) $(LDFLAGS) -r -o$@ $^

$(HLK_X): $(OBJS)
	$(LD) $(LDFLAGS) -o$@ $^

#

%.o: %.s hlk.mac
	$(AS) $(ASFLAGS) $<

main.o: string.mac
file.o: string.mac
analyze.o: sub_list.mac
make_exe.o: sub_list.mac
roffset.o: sub_list.mac

#

clean:
	rm *.o *.r *.bak

# EOF
