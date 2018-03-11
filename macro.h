PrintStr	macro	string
			mov ah,09h
			lea dx,string
			int 21h
			endm
pChar	macro	para1
	push    ax 	;save ax
	push	dx	;save dx( dx = (dh,dl) )
        mov     dl,para1;load value of para1
        mov     ah,02h	;display a character
        int     21h	;call dos routine
        pop	dx	;restore dx( dx = (dh,dl) )
        pop     ax	;restore ax( ax = (ah,al) )
	endm			
GetChar		macro	
			mov ah,07h
			int 21h
			endm
			
SetMode		macro	mode
			mov ah,00h
			mov al,mode
			int 10h
			endm

SetColor	macro mode,color
			mov ah,0bh
			mov bh,mode
			mov bl,color
			int 10h
			endm

WrPixel		macro row,col,color
			mov ah,0ch
			mov bh,00h
			mov al,color
			mov cx,col
			mov dx,row
			int 10h
			endm

RePixel         macro row,col
                        mov ah,0dh
                        mov bh,00h
			mov cx,col
			mov dx,row                        
                        int 10h
                        endm


			
SetCursor	macro     row,col
          	mov       dh,row
          	mov       dl,col
          	mov       bx,00h
          	mov       ah,02h
          	int       10h
          	endm
			
SetChar		macro	Char,type,times
			mov ah,09h
			mov al,Char
			mov bh,0
			mov bl,type
			mov cx,times
			int 10h
			endm

Complement	macro	SignNumber
			mov ax,SignNumber
			NOT ax
			inc ax
			mov SignNumber,ax
			endm
			
printstr13h	macro str,atr,len,row,col,cursor_move 
			mov ax,ds
			mov es,ax
			mov ah,13h
			lea bp,str
			mov al,cursor_move
			mov cx,len
			mov bh,00
			mov bl,atr
			mov dh,row
			mov dl,col
			int 10h
			endm

Print_Rectangular macro xx, yy, color
local T1,T2,T3,endRectan
  mov dx,yy
  mov cx,xx 
  add dx,60
  add cx,60
  mov outsid,dx
  mov insid,cx
  sub dx,60
  sub cx,60
T1:
  push cx
  cmp dx,outsid
  je endRectan
T2:
  cmp insid,cx
  je T3
  WrPixel dx,cx,color
  inc cx
  jmp T2
T3:
  inc dx
  pop cx
  jmp T1  
endRectan:
  pop cx
endm