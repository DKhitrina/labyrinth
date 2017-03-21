global		StrToNum
global		NumToStr

section .text


;transform string to number
;eax - that number
;string is placed in mass with length <= 20
;spoils eax, ebx, ecx, esi
;edi = array, edx = 19
StrToNum:
		push ebp
		mov ebp, esp
		mov eax, 0
		mov ecx, 0
		mov esi, 0			;esi - counter
.stn_lp:
		mov eax, [edi+esi*4]		;eax - current element
		cmp eax, 0			;end of massive
		je .stn_quit
		cmp eax, '0'
		jl .stn_quit
		cmp eax, '9'
		jg .stn_quit
		sub eax, '0'
		mov ebx, eax
		mov eax, ecx
		mov ecx, ebx
		mov ebx, 10
		mul ebx
		add ecx, eax
		inc esi
		jmp .stn_lp
.stn_quit:
		mov eax, ecx
		mov esp, ebp
		pop ebp
		ret

;eax = number
;move number that placed in eax in string (massive)
;spoils esi, ebx, edx
;edi = array, ecx = 19
NumToStr:
		push ebp
		mov ebp, esp
		mov ebx, 10
		mov esi, 0			; esi- index counter
.nts_lp:
		cmp esi, ecx
		je .nts_quit
		mov edx, 0
		div ebx
		add edx, '0'
		mov [edi+esi*4], edx
		cmp eax, 0
		je .nts_quit
		inc esi
		jmp .nts_lp
.nts_quit:
		inc esi
		mov dword [edi+esi*4], 0
		mov esi, 0
		mov ebx, 0
.nts_rev:
		cmp dword [edi+esi*4], 0
		je .nts_rev_q
		push dword [edi+esi*4]
		inc esi
		jmp .nts_rev
.nts_rev_q:
		mov ebx, 0
.nts_rev_lp:
		pop dword [edi+ebx*4]
		inc ebx
		cmp esi, ebx
		je .quit
		jmp .nts_rev_lp
.quit:
		mov esp, ebp
		pop ebp
		ret
