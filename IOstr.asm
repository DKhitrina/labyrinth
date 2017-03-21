%include "stud_io.inc"
global		read
global		write

section .text

;read string with length <= 20
;puts it in mass, which ends with '0'
;spoils eax, esi
;edi = array, edx = 19 (i=0..19, last one for '0')
read:
		push ebp
		mov ebp, esp
		mov eax, 0
		mov esi, 0		;esi - counter
.read_lp:
		GETCHAR
		cmp eax, ' '
		je .read_quit		;check for end of string
		cmp esi, edx
		je .read_quit		;check for end of massive
		mov [edi+esi*4], al
		inc esi
		jmp .read_lp
.read_quit:
		inc esi
		mov dword [edi+esi*4], 0
		mov esp, ebp
		pop ebp
		ret


;output string
;string is placed in massive
;spoils eax, esi
;edi = array
write:
		push ebp
		mov ebp,esp
		mov eax, 0
		mov esi, 0
.write_lp:
		mov al, [edi+esi*4]
		cmp al, 0
		je .write_quit
		PUTCHAR al
		inc esi
		jmp .write_lp
.write_quit:
		mov esp, ebp
		pop ebp
		ret
