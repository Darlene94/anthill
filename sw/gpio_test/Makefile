# and don't touch the rest unless you know what you're doing.
CROSS_COMPILE ?= /opt/riscv32i/bin/riscv32-unknown-elf-

CC      =	$(CROSS_COMPILE)gcc
LD      =	$(CROSS_COMPILE)ld
OBJDUMP =	$(CROSS_COMPILE)objdump
OBJCOPY =	$(CROSS_COMPILE)objcopy
SIZE    =	$(CROSS_COMPILE)size

BOARD_INCLUDE = /mnt/e/linux/dev/anthill/sw/headers
BSP  = ../anthill_hwlib

INCLUDE       = $(BSP)/periph_hwlib/include \
                $(BSP)/urv_hwlib/include

OBJS = $(BSP)/urv_hwlib/crt_boot.o\
       $(BSP)/urv_hwlib/irq.o\
       $(BSP)/urv_hwlib/urv_time.o\
       $(BSP)/periph_hwlib/uart.o\
       $(BSP)/periph_hwlib/gpio.o\
       main.o

LDS_BOOT = $(BSP)/urv_hwlib/user_boot.ld
OUTPUT = gpio_test

.PHONY: all
all: clean bootable

.PHONY: bootable
bootable: $(OUTPUT).bin
$(OUTPUT).elf $(OUTPUT).bin: $(LDS_BOOT) $(OBJS)
	${CC} $(INCLUDE:%=-I%) $(BOARD_INCLUDE:%=-I%) -flto -O2 -Wl,--gc-sections -o $(OUTPUT).elf -nostartfiles $(OBJS)  -lm -T $(LDS_BOOT) -lc
	${OBJCOPY} -O binary $(OUTPUT).elf $(OUTPUT).bin
	$(SIZE) $(OUTPUT).elf

.PHONY: disasm
disasm: $(OUTPUT).elf
	${OBJDUMP} -D $(OUTPUT).elf > disasm_emb.S

.PHONY: clean
clean:
	rm -f $(OBJS)
	rm -f $(OUTPUT).elf
	rm -f $(OUTPUT).bin
	rm -f disasm.S disasm_debug.S disasm_emb.S

%.o:%.S
	${CC} -c $^ -o $@

%.o:	%.c
	${CC} $(INCLUDE:%=-I%) $(BOARD_INCLUDE:%=-I%) -c $^ -o $@
