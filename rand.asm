global		_start
section.text
;generate pseudo-random numbers
;spoils eax, ebx, edx
_start:
		mov eax, 13
		mov ebx, 0
		int 80h
		mov ecx, eax
		add ecx, '0'

		mov eax, 4		;write
		mov ebx, 1

		mov ecx, edi

		mov edx, 4
		int 80h

		mov eax, 1		;exit
		mov ebx, 0
		int 80h
