; Bootheader - Minix Boot header
; Programming Language: NASM (Netwide Assembler)
; Author: Winzic
;=============================================
; Definitions & Externs from boothead.s
;=============================================
; Imported variables and functions:
extern _caddr, _daddr, _runsize, _edata, _end	; Runtime environment
extern _device									; BIOS device number
extern _rem_part								; To pass partition info
extern _k_flags									; Special kernel flags
extern _mem										; Free memory list
extern _cdbooted								; Whether we booted from CD
extern _cddevice								; Whether we booted from CD

	;	Exit the monitor by rebooting the system.
	; void ..exit(int status)
%define	_exit, __exit, ___exit					; Make various compilers happy
	; u32_t mon2abs(void *ptr)
	;	Address in monitor data to absolute address.
%define _mon2abs
; u32_t vec2abs(vector *vec)
;	8086 interrupt vector to absolute address.
%define _vec2abs
; void raw_copy(u32_t dstaddr, u32_t srcaddr, u32_t count)
;	Copy count bytes from srcaddr to dstaddr.  Don't do overlaps.
;	Also handles copying words to or from extended memory.
%define _raw_copy
; void relocate(void);
;	After the program has copied itself to a safer place, it needs to change
;	the segment registers.  Caddr has already been set to the new location.
%define _relocate
; u16_t get_word(u32_t addr);
; void put_word(u32_t addr, u16_t word);
;	Read or write a 16 bits word at an arbitrary location.
%define	_get_word, _put_word

; void *brk(void *addr)
; void *sbrk(size_t incr)
;	Cannot fail implementations of brk(2) and sbrk(3), so we can use
;	malloc(3).  They reboot on stack collision instead of returning -1.
%define _brk, __brk, _sbrk, __sbrk
; int dev_open(void);
;	Given the device "_device" figure out if it exists and what its number
;	of heads and sectors may be.  Return the BIOS error code on error,
;	otherwise 0.
%define	_dev_open
; int dev_close(void);
;	Close the current device.  Under the BIOS this does nothing much.
%define	_dev_close
; int dev_boundary(u32_t sector);
;	True if a sector is on a boundary, i.e. sector % sectors == 0.
%define	_dev_boundary
; int biosreadsectors(u32_t bufaddr, u32_t sector, u8_t count)
; int writesectors(u32_t bufaddr, u32_t sector, u8_t count)
;	Read/write several sectors from/to disk or floppy.  The buffer must
;	be between 64K boundaries!  Count must fit in a byte.  The external
;	variables _device, sectors and secspcyl describe the disk and its
;	geometry.  Returns 0 for success, otherwise the BIOS error code.
;
%define _biosreadsectors, _writesectors
; int getch(void);
;	Read a character from the keyboard, and check for an expired timer.
;	A carriage return is changed into a linefeed for UNIX compatibility.
%define _getch
; int ungetch(void);
;	Return a character to undo a getch().
%define _ungetch
; int escape(void);
;	True if ESC has been typed.
%define _escape
; int putch(int c);
;	Write a character in teletype mode.  The putk synonym is
;	for the kernel printf function that uses it.
;	Newlines are automatically preceded by a carriage return.
;
%define _putch, _putk
; void pause(void);
;	Wait for an interrupt using the HLT instruction.  This either saves
;	power, or tells an x86 emulator that nothing is happening right now.
%define _pause
; void set_mode(unsigned mode);
; void clear_screen(void);
;	Set video mode / clear the screen.
%define _set_mode, _clear_screen
; void serial_init(int line)
;	Initialize copying console I/O to a serial line.
%define	_serial_init
; u32_t get_tick(void);
;	Return the current value of the clock tick counter.  This counter
;	increments 18.2 times per second.  Poll it to do delays.  Does not
;	work on the original PC, but works on the PC/XT.
%define _get_tick
; Functions used to obtain info about the hardware.  Boot uses this information
; itself, but will also pass them on to a pure 386 kernel, because one can't
; make BIOS calls from protected mode.  The video type could probably be
; determined by the kernel too by looking at the hardware, but there is a small
; chance on errors that the monitor allows you to correct by setting variables.

%define _get_bus					; returns type of system bus
%define _get_video					; returns type of display
; Functions to leave the boot monitor.
%define _bootstrap					; Call another bootstrap
%define _minix						; Call Minix
; void int15(bios_env_t *ep)
;	Do an "INT 15" call, primarily for APM (Power Management).
%define _int15
; void scan_keyboard(void)
;	Read keyboard character. Needs to be done in case one is waiting.
%define _scan_keyboard

;=========================================================
; Definitions & Externs from Doshead.s
;=========================================================
extern _vdisk						; Name of the virtual disk

%define _PSP

;==============================================================
; Definitions & Externs from mkhead.s
;==============================================================
; int creat(const char *path, mode_t mode)
;	Create a file with the old creat() call.
%define _creat
; int open(const char *path, int oflag)
;	Open a file with the oldfashioned two-argument open() call.
%define _open
; int close(int fd)
;	Close an open file.
%define _close
; ssize_t read(int fd, void *buf, size_t n)
;	Read bytes from an open file.
%define _read
; ssize_t write(int fd, const void *buf, size_t n)
;	Write bytes to an open file.
%define _write
; off_t lseek(int fd, off_t offset, int whence)
;	Set file position for read or write.
%define _lseek








;=========================================
; Bootblock 1.5- Minix boot block
; From bootblock.s "src/boot/bootblock.s"
;==========================================
;LOADOFF		    EQU		   	0x7C00		; 0x0000:LOADOFF is where this code
											; loaded
BOOTSEG		    EQU			0x1000		; Secondary boot code
BOOTOFF		    EQU			0x0030		; Offset into /boot above header
BUFFER		    EQU			0x0600		; First free memory
LOWSEC		    EQU			8			; Offset of logical first in 
										; partition table
; Variable addressed using bp register
device        	EQU     	0			; The boot device
lowsec			EQU			2			; Offset of boot partition within drive
secpcyl			EQU			6			; Sector per cylinder = heads * sectors

;=======================================
; Boothead.s - BIOS support for boot.c
; From Boothead.s "src/boot/boothead.s"
;=======================================
PENTRYSIZE		EQU			16			; Partition table entry size.
a_flags			EQU			2			; From a.out.h, struct exec
a_text			EQU 		8		
a_data			EQU			12
a_bss			EQU			16
a_total			EQU			24
A_SEP			EQU 		0x20		; Separate I&D flag
K_I386			EQU			0x0001		; Call Minix in 386 mode
K_RET			EQU			0x0020		; Returns to the monitor on reboot
K_INT86			EQU			0x0040		; Requires generic INT support
K_MEML			EQU  		0x0080		; Pass a list of free memory

DS_SELECTOR			EQU   		3*8			; Kernel data selector
ES_SELECTOR			EQU 		4*8			; Flat 4 Gb
SS_SELECTOR			EQU			5*8			; Monitor stack
CS_SELECTOR			EQU  		6*8			; Kernel code
MCS_SELECTOR		EQU  		7*8			; Monitor code

ESC					EQU	  		0x1B		; Escape character


;============================================
; Doshead.s - DOS & BIOS support for boot.c
; From Doshead.s "src/boot/doshead.s 
;============================================
STACK			EQU			16384		; Number of bytes for the stack



;=============================================
; Jumpboot 0.1 - Jump to another bootstrap
; From jumpboot.s "src/boot/jumpboot.s"
;===============================================
PART_TABLE			EQU			446		; Location of partition table within master










