include macro.h

.8086
.model small
.stack 1024
.data
comparestart1 db ?
comparestart2 db ?
controlx dw ?
controly dw ?
numberx db ?
numbery db ?
outsid dw ?
insid dw ?
cc db 0fh
string db "22$"
X dd 1
randValue db ?
randValue24 db ?
randColor db ?
start1 db 0
color00 db ?
color44 db ?
color88 db ?
color1212 db ?
color0 db ?
color1 db ?
color2 db ?
color3 db ?
color4 db ?
color5 db ?
color6 db ?
color7 db ?
color8 db ?
color9 db ?
color10 db ?
color11 db ?
color12 db ?
color13 db ?
color14 db ?
color15 db ?
number dw 2
number00 dw 2
number44 dw 2
number88 dw 2
number1212 dw 2
number0 dw 2
number1 dw 2
number2 dw 2
number3 dw 2
number4 dw 2
number5 dw 2
number6 dw 2
number7 dw 2
number8 dw 2
number9 dw 2
number10 dw 2
number11 dw 2
number12 dw 2
number13 dw 2
number14 dw 2
number15 dw 2
x0 dw ?
y0 dw ?
x4 dw ?
y4 dw ?
x8 dw ?
y8 dw ?
x12 dw ?
y12 dw ?
xx0 db ?
yy0 db ?
xx4 db ?
yy4 db ?
xx8 db ?
yy8 db ?
xx12 db ?
yy12 db ?
store dw ?
stupid dw ?
final dw ?
score dw 0
start db "Press any key to start!!!$"
gameover db 'Thank for your playing $'
.code

abc proc near stdcall uses ax bx cx dx ,first:word,final1:word,hight:word
abc1:
  mov cx,final1
  cmp first,cx  
  jz abc2
  WrPixel hight,first,04h
  inc first
  jmp abc1

abc2:
ret
abc endp

.startup


  SetMode 12h
  SetColor 00h,09h
  call Gamestartprnt

L0:
  SetMode 12h
  SetColor 00h,0eh
  SetCursor 4,24
  SetChar '2',01h,1
  SetCursor 4,25
  SetChar '0',01h,1
  SetCursor 4,26
  SetChar '4',01h,1
  SetCursor 4,27
  SetChar '8',01h,1
  SetCursor 15,60
  SetChar 's',01h,1
  SetCursor 15,61
  SetChar 'c',01h,1
  SetCursor 15,62
  SetChar 'o',01h,1
  SetCursor 15,63
  SetChar 'r',01h,1
  SetCursor 15,64
  SetChar 'e',01h,1 
  SetCursor 15,65
  SetChar ':',01h,1 
  call Print_Frame
  mov score,0
  mov number,2
  mov number00,2
  mov number1,2
  mov number2,2
  mov number3,2
  mov number44,2
  mov number5,2
  mov number6,2
  mov number7,2
  mov number88,2
  mov number9,2
  mov number10,2
  mov number11,2
  mov number1212,2
  mov number13,2
  mov number14,2
  mov number15,2
L1:                                                ;見兩個方塊在"不同"位置
  call rand_Location
  Print_Rectangular controlx,controly,01h
  SetCursor numbery,numberx
  mov ax,number
  call Print_num
  cmp start1,1
  jb L3
  mov al,comparestart1
  cmp al,comparestart2 
  jne begin
L3:
  mov al,comparestart2
  mov comparestart1,al
  inc start1
  jmp L1
begin:
  mov start1,0

over:
  SetCursor 15,66
  mov ax,score
  call Print_num
  mov final,0
  mov stupid,0
  RePixel 120,224
  mov color00,al
  RePixel 120,288
  mov color1,al
  RePixel 120,352
  mov color2,al
  RePixel 120,416
  mov color3,al
  RePixel 180,224
  mov color44,al
  RePixel 180,288
  mov color5,al
  RePixel 180,352
  mov color6,al
  RePixel 180,416
  mov color7,al
  RePixel 250,224
  mov color88,al
  RePixel 250,288
  mov color9,al
  RePixel 250,352
  mov color10,al
  RePixel 250,416
  mov color11,al
  RePixel 308,224
  mov color1212,al
  RePixel 308,288
  mov color13,al
  RePixel 308,352
  mov color14,al
  RePixel 308,416
  mov color15,al
  
  cmp color00,00h
  je continue
  cmp color1,00h
  je continue
  cmp color2,00h
  je continue
  cmp color3,00h
  je continue
  cmp color44,00h
  je continue
  cmp color5,00h
  je continue
  cmp color6,00h
  je continue
  cmp color7,00h
  je continue
  cmp color88,00h
  je continue
  cmp color9,00h
  je continue
  cmp color10,00h
  je continue
  cmp color11,00h
  je continue
  cmp color1212,00h
  je continue
  cmp color13,00h
  je continue
  cmp color14,00h
  je continue
  cmp color15,00h
  je continue
  call Gameoveryn
  cmp final,1
  je allend
continue:
  GetChar
  cmp al,'8'
  je up
  cmp al,'2'
  je down
  cmp al,'4'
  je left
  cmp al,'6'
  je right
  cmp al,'e'
  je no
  jmp over
up:
  mov x0,194
  mov y0,114
  mov x4,194
  mov y4,178
  mov x8,194
  mov y8,242
  mov x12,194
  mov y12,306
  mov xx0,26
  mov yy0,9
  mov xx4,26
  mov yy4,13
  mov xx8,26
  mov yy8,17
  mov xx12,26
  mov yy12,21
  mov ax,number00
  mov number0,ax
  mov ax,number44
  mov number4,ax
  mov ax,number88
  mov number8,ax
  mov ax,number1212
  mov number12,ax
  mov al,color00
  mov color0,al
  mov al,color44
  mov color4,al
  mov al,color88
  mov color8,al
  mov al,color1212
  mov color12,al
 call direction 
  mov ax,number0
  mov number00,ax
  mov ax,number4
  mov number44,ax
  mov ax,number8
  mov number88,ax
  mov ax,number12
  mov number1212,ax
  mov al,color0
  mov color00,al
  mov al,color4
  mov color44,al
  mov al,color8
  mov color88,al
  mov al,color12
  mov color1212,al

  mov x0,258
  mov y0,114
  mov x4,258
  mov y4,178
  mov x8,258
  mov y8,242
  mov x12,258
  mov y12,306
  mov xx0,34
  mov yy0,9
  mov xx4,34
  mov yy4,13
  mov xx8,34
  mov yy8,17
  mov xx12,34
  mov yy12,21
  mov ax,number1
  mov number0,ax
  mov ax,number5
  mov number4,ax
  mov ax,number9
  mov number8,ax
  mov ax,number13
  mov number12,ax
  mov al,color1
  mov color0,al
  mov al,color5
  mov color4,al
  mov al,color9
  mov color8,al
  mov al,color13
  mov color12,al
 call direction 
  mov ax,number0
  mov number1,ax
  mov ax,number4
  mov number5,ax
  mov ax,number8
  mov number9,ax
  mov ax,number12
  mov number13,ax
  mov al,color0
  mov color1,al
  mov al,color4
  mov color5,al
  mov al,color8
  mov color9,al
  mov al,color12
  mov color13,al

  mov x0,322
  mov y0,114
  mov x4,322
  mov y4,178
  mov x8,322
  mov y8,242
  mov x12,322
  mov y12,306
  mov xx0,42
  mov yy0,9
  mov xx4,42
  mov yy4,13
  mov xx8,42
  mov yy8,17
  mov xx12,42
  mov yy12,21
  mov ax,number2
  mov number0,ax
  mov ax,number6
  mov number4,ax
  mov ax,number10
  mov number8,ax
  mov ax,number14
  mov number12,ax
  mov al,color2
  mov color0,al
  mov al,color6
  mov color4,al
  mov al,color10
  mov color8,al
  mov al,color14
  mov color12,al
 call direction 
  mov ax,number0
  mov number2,ax
  mov ax,number4
  mov number6,ax
  mov ax,number8
  mov number10,ax
  mov ax,number12
  mov number14,ax
  mov al,color0
  mov color2,al
  mov al,color4
  mov color6,al
  mov al,color8
  mov color10,al
  mov al,color12
  mov color14,al

  mov x0,386
  mov y0,114
  mov x4,386
  mov y4,178
  mov x8,386
  mov y8,242
  mov x12,386
  mov y12,306
  mov xx0,50
  mov yy0,9
  mov xx4,50
  mov yy4,13
  mov xx8,50
  mov yy8,17
  mov xx12,50
  mov yy12,21
  mov ax,number3
  mov number0,ax
  mov ax,number7
  mov number4,ax
  mov ax,number11
  mov number8,ax
  mov ax,number15
  mov number12,ax
  mov al,color3
  mov color0,al
  mov al,color7
  mov color4,al
  mov al,color11
  mov color8,al
  mov al,color15
  mov color12,al
 call direction 
  mov ax,number0
  mov number3,ax
  mov ax,number4
  mov number7,ax
  mov ax,number8
  mov number11,ax
  mov ax,number12
  mov number15,ax
  mov al,color0
  mov color3,al
  mov al,color4
  mov color7,al
  mov al,color8
  mov color11,al
  mov al,color12
  mov color15,al

  
  cmp stupid,4
  je over
  add score,10
  jmp create



 
down:
  mov x0,194
  mov y0,306
  mov x4,194
  mov y4,242
  mov x8,194
  mov y8,178
  mov x12,194
  mov y12,114
  mov xx0,26
  mov yy0,21
  mov xx4,26
  mov yy4,17
  mov xx8,26
  mov yy8,13
  mov xx12,26
  mov yy12,9
  mov ax,number1212
  mov number0,ax
  mov ax,number88
  mov number4,ax
  mov ax,number44
  mov number8,ax
  mov ax,number00
  mov number12,ax
  mov al,color1212
  mov color0,al
  mov al,color88
  mov color4,al
  mov al,color44
  mov color8,al
  mov al,color00
  mov color12,al
 call direction 
  mov ax,number0
  mov number1212,ax
  mov ax,number4
  mov number88,ax
  mov ax,number8
  mov number44,ax
  mov ax,number12
  mov number00,ax
  mov al,color0
  mov color1212,al
  mov al,color4
  mov color88,al
  mov al,color8
  mov color44,al
  mov al,color12
  mov color00,al

  mov x0,258
  mov y0,306
  mov x4,258
  mov y4,242
  mov x8,258
  mov y8,178
  mov x12,258
  mov y12,114
  mov xx0,34
  mov yy0,21
  mov xx4,34
  mov yy4,17
  mov xx8,34
  mov yy8,13
  mov xx12,34
  mov yy12,9
  mov ax,number13
  mov number0,ax
  mov ax,number9
  mov number4,ax
  mov ax,number5
  mov number8,ax
  mov ax,number1
  mov number12,ax
  mov al,color13
  mov color0,al
  mov al,color9
  mov color4,al
  mov al,color5
  mov color8,al
  mov al,color1
  mov color12,al
 call direction 
  mov ax,number0
  mov number13,ax
  mov ax,number4
  mov number9,ax
  mov ax,number8
  mov number5,ax
  mov ax,number12
  mov number1,ax
  mov al,color0
  mov color13,al
  mov al,color4
  mov color9,al
  mov al,color8
  mov color5,al
  mov al,color12
  mov color1,al

  mov x0,322
  mov y0,306
  mov x4,322
  mov y4,242
  mov x8,322
  mov y8,178
  mov x12,322
  mov y12,114
  mov xx0,42
  mov yy0,21
  mov xx4,42
  mov yy4,17
  mov xx8,42
  mov yy8,13
  mov xx12,42
  mov yy12,9
  mov ax,number14
  mov number0,ax
  mov ax,number10
  mov number4,ax
  mov ax,number6
  mov number8,ax
  mov ax,number2
  mov number12,ax
  mov al,color14
  mov color0,al
  mov al,color10
  mov color4,al
  mov al,color6
  mov color8,al
  mov al,color2
  mov color12,al
 call direction 
  mov ax,number0
  mov number14,ax
  mov ax,number4
  mov number10,ax
  mov ax,number8
  mov number6,ax
  mov ax,number12
  mov number2,ax
  mov al,color0
  mov color14,al
  mov al,color4
  mov color10,al
  mov al,color8
  mov color6,al
  mov al,color12
  mov color2,al

  mov x0,386
  mov y0,306
  mov x4,386
  mov y4,242
  mov x8,386
  mov y8,178
  mov x12,386
  mov y12,114
  mov xx0,50
  mov yy0,21
  mov xx4,50
  mov yy4,17
  mov xx8,50
  mov yy8,13
  mov xx12,50
  mov yy12,9
  mov ax,number15
  mov number0,ax
  mov ax,number11
  mov number4,ax
  mov ax,number7
  mov number8,ax
  mov ax,number3
  mov number12,ax
  mov al,color15
  mov color0,al
  mov al,color11
  mov color4,al
  mov al,color7
  mov color8,al
  mov al,color3
  mov color12,al
 call direction 
  mov ax,number0
  mov number15,ax
  mov ax,number4
  mov number11,ax
  mov ax,number8
  mov number7,ax
  mov ax,number12
  mov number3,ax
  mov al,color0
  mov color15,al
  mov al,color4
  mov color11,al
  mov al,color8
  mov color7,al
  mov al,color12
  mov color3,al


  cmp stupid,4
  je over
  add score,10
  jmp create




left:
  mov x0,194
  mov y0,114
  mov x4,258
  mov y4,114
  mov x8,322
  mov y8,114
  mov x12,386
  mov y12,114
  mov xx0,26
  mov yy0,9
  mov xx4,34
  mov yy4,9
  mov xx8,42
  mov yy8,9
  mov xx12,50
  mov yy12,9
  mov ax,number00
  mov number0,ax
  mov ax,number1
  mov number4,ax
  mov ax,number2
  mov number8,ax
  mov ax,number3
  mov number12,ax
  mov al,color00
  mov color0,al
  mov al,color1
  mov color4,al
  mov al,color2
  mov color8,al
  mov al,color3
  mov color12,al
 call direction 
  mov ax,number0
  mov number00,ax
  mov ax,number4
  mov number1,ax
  mov ax,number8
  mov number2,ax
  mov ax,number12
  mov number3,ax
  mov al,color0
  mov color00,al
  mov al,color4
  mov color1,al
  mov al,color8
  mov color2,al
  mov al,color12
  mov color3,al

  mov x0,194
  mov y0,178
  mov x4,258
  mov y4,178
  mov x8,322
  mov y8,178
  mov x12,386
  mov y12,178
  mov xx0,26
  mov yy0,13
  mov xx4,34
  mov yy4,13
  mov xx8,42
  mov yy8,13
  mov xx12,50
  mov yy12,13
  mov ax,number44
  mov number0,ax
  mov ax,number5
  mov number4,ax
  mov ax,number6
  mov number8,ax
  mov ax,number7
  mov number12,ax
  mov al,color44
  mov color0,al
  mov al,color5
  mov color4,al
  mov al,color6
  mov color8,al
  mov al,color7
  mov color12,al
 call direction 
  mov ax,number0
  mov number44,ax
  mov ax,number4
  mov number5,ax
  mov ax,number8
  mov number6,ax
  mov ax,number12
  mov number7,ax
  mov al,color0
  mov color44,al
  mov al,color4
  mov color5,al
  mov al,color8
  mov color6,al
  mov al,color12
  mov color7,al


  mov x0,194
  mov y0,242
  mov x4,258
  mov y4,242
  mov x8,322
  mov y8,242
  mov x12,386
  mov y12,242
  mov xx0,26
  mov yy0,17
  mov xx4,34
  mov yy4,17
  mov xx8,42
  mov yy8,17
  mov xx12,50
  mov yy12,17
  mov ax,number88
  mov number0,ax
  mov ax,number9
  mov number4,ax
  mov ax,number10
  mov number8,ax
  mov ax,number11
  mov number12,ax
  mov al,color88
  mov color0,al
  mov al,color9
  mov color4,al
  mov al,color10
  mov color8,al
  mov al,color11
  mov color12,al
 call direction 
  mov ax,number0
  mov number88,ax
  mov ax,number4
  mov number9,ax
  mov ax,number8
  mov number10,ax
  mov ax,number12
  mov number11,ax
  mov al,color0
  mov color88,al
  mov al,color4
  mov color9,al
  mov al,color8
  mov color10,al
  mov al,color12
  mov color11,al

  mov x0,194
  mov y0,306
  mov x4,258
  mov y4,306
  mov x8,322
  mov y8,306
  mov x12,386
  mov y12,306
  mov xx0,26
  mov yy0,21
  mov xx4,34
  mov yy4,21
  mov xx8,42
  mov yy8,21
  mov xx12,50
  mov yy12,21
  mov ax,number1212
  mov number0,ax
  mov ax,number13
  mov number4,ax
  mov ax,number14
  mov number8,ax
  mov ax,number15
  mov number12,ax
  mov al,color1212
  mov color0,al
  mov al,color13
  mov color4,al
  mov al,color14
  mov color8,al
  mov al,color15
  mov color12,al
 call direction 
  mov ax,number0
  mov number1212,ax
  mov ax,number4
  mov number13,ax
  mov ax,number8
  mov number14,ax
  mov ax,number12
  mov number15,ax
  mov al,color0
  mov color1212,al
  mov al,color4
  mov color13,al
  mov al,color8
  mov color14,al
  mov al,color12
  mov color15,al


  cmp stupid,4
  je over
  add score,10
  jmp create



right:
  mov x0,386
  mov y0,114
  mov x4,322
  mov y4,114
  mov x8,258
  mov y8,114
  mov x12,194
  mov y12,114
  mov xx0,50
  mov yy0,9
  mov xx4,42
  mov yy4,9
  mov xx8,34
  mov yy8,9
  mov xx12,26
  mov yy12,9
  mov ax,number3
  mov number0,ax
  mov ax,number2
  mov number4,ax
  mov ax,number1
  mov number8,ax
  mov ax,number00
  mov number12,ax
  mov al,color3
  mov color0,al
  mov al,color2
  mov color4,al
  mov al,color1
  mov color8,al
  mov al,color00
  mov color12,al
 call direction 
  mov ax,number0
  mov number3,ax
  mov ax,number4
  mov number2,ax
  mov ax,number8
  mov number1,ax
  mov ax,number12
  mov number00,ax
  mov al,color0
  mov color3,al
  mov al,color4
  mov color2,al
  mov al,color8
  mov color1,al
  mov al,color12
  mov color00,al

  mov x0,386
  mov y0,178
  mov x4,322
  mov y4,178
  mov x8,258
  mov y8,178
  mov x12,194
  mov y12,178
  mov xx0,50
  mov yy0,13
  mov xx4,42
  mov yy4,13
  mov xx8,34
  mov yy8,13
  mov xx12,26
  mov yy12,13
  mov ax,number7
  mov number0,ax
  mov ax,number6
  mov number4,ax
  mov ax,number5
  mov number8,ax
  mov ax,number44
  mov number12,ax
  mov al,color7
  mov color0,al
  mov al,color6
  mov color4,al
  mov al,color5
  mov color8,al
  mov al,color44
  mov color12,al
 call direction 
  mov ax,number0
  mov number7,ax
  mov ax,number4
  mov number6,ax
  mov ax,number8
  mov number5,ax
  mov ax,number12
  mov number44,ax
  mov al,color0
  mov color7,al
  mov al,color4
  mov color6,al
  mov al,color8
  mov color5,al
  mov al,color12
  mov color44,al


  mov x0,386
  mov y0,242
  mov x4,322
  mov y4,242
  mov x8,258
  mov y8,242
  mov x12,194
  mov y12,242
  mov xx0,50
  mov yy0,17
  mov xx4,42
  mov yy4,17
  mov xx8,34
  mov yy8,17
  mov xx12,26
  mov yy12,17
  mov ax,number11
  mov number0,ax
  mov ax,number10
  mov number4,ax
  mov ax,number9
  mov number8,ax
  mov ax,number88
  mov number12,ax
  mov al,color11
  mov color0,al
  mov al,color10
  mov color4,al
  mov al,color9
  mov color8,al
  mov al,color88
  mov color12,al
 call direction 
  mov ax,number0
  mov number11,ax
  mov ax,number4
  mov number10,ax
  mov ax,number8
  mov number9,ax
  mov ax,number12
  mov number88,ax
  mov al,color0
  mov color11,al
  mov al,color4
  mov color10,al
  mov al,color8
  mov color9,al
  mov al,color12
  mov color88,al

  mov x0,386
  mov y0,306
  mov x4,322
  mov y4,306
  mov x8,258
  mov y8,306
  mov x12,194
  mov y12,306
  mov xx0,50
  mov yy0,21
  mov xx4,42
  mov yy4,21
  mov xx8,34
  mov yy8,21
  mov xx12,26
  mov yy12,21
  mov ax,number15
  mov number0,ax
  mov ax,number14
  mov number4,ax
  mov ax,number13
  mov number8,ax
  mov ax,number1212
  mov number12,ax
  mov al,color15
  mov color0,al
  mov al,color14
  mov color4,al
  mov al,color13
  mov color8,al
  mov al,color1212
  mov color12,al
 call direction 
  mov ax,number0
  mov number15,ax
  mov ax,number4
  mov number14,ax
  mov ax,number8
  mov number13,ax
  mov ax,number12
  mov number1212,ax
  mov al,color0
  mov color15,al
  mov al,color4
  mov color14,al
  mov al,color8
  mov color13,al
  mov al,color12
  mov color1212,al


  cmp stupid,4
  je over
  add score,10
  jmp create


create:
L4:
 call rand_Location 
 call rand_24
 RePixel controly,controlx
 cmp al,00h
 jne L4
 Print_Rectangular controlx,controly,randColor
 SetCursor numbery,numberx
 mov ax,number
 call Print_num
 cmp randValue,0
 je C0
 cmp randValue,1
 je C1
 cmp randValue,2
 je C2
 cmp randValue,3
 je C3
 cmp randValue,4
 je C4
 cmp randValue,5
 je C5
 cmp randValue,6
 je C6
 cmp randValue,7
 je C7
 cmp randValue,8
 je C8
 cmp randValue,9
 je C9
 cmp randValue,10
 je C10
 cmp randValue,11
 je C11
 cmp randValue,12
 je C12
 cmp randValue,13
 je C13
 cmp randValue,14
 je C14
 cmp randValue,15
 je C15
C0:
 mov ax,number
 mov number00,ax
jmp over
C1:
 mov ax,number
 mov number1,ax
jmp over
C2:
 mov ax,number
 mov number2,ax
jmp over
C3:
 mov ax,number
 mov number3,ax
jmp over
C4:
 mov ax,number
 mov number44,ax
jmp over
C5:
 mov ax,number
 mov number5,ax
jmp over
C6:
 mov ax,number
 mov number6,ax
jmp over
C7:
 mov ax,number
 mov number7,ax
jmp over
C8:
 mov ax,number
 mov number88,ax
jmp over
C9:
 mov ax,number
 mov number9,ax
jmp over
C10:
 mov ax,number
 mov number10,ax
jmp over
C11:
 mov ax,number
 mov number11,ax
jmp over
C12:
 mov ax,number
 mov number1212,ax
jmp over
C13:
 mov ax,number
 mov number13,ax
jmp over
C14:
 mov ax,number
 mov number14,ax
jmp over
C15:
 mov ax,number
 mov number15,ax
 jmp over
  
allend:
call Gameoverprnt
back:
GetChar
cmp al,'y'
je L0
cmp al,'n'
je no
jmp back

no:
setMode 03h
.exit

Print_Frame proc
mov store,sp
mov dx,112
mov cx,192
Left1:
  push cx
  cmp dx,368
  je Top1
F1:
  cmp cx,194
  je F2
  WrPixel dx,cx,cc
  inc cx
  jmp F1
F2:
  inc dx
  pop cx
  jmp Left1


Top1:
  pop cx
  mov dx,112
  mov cx,192
F3:
  push dx
  cmp cx,448
  je Right1
F4:
  cmp dx,114
  je F5
  WrPixel dx,cx,cc
  inc dx
  jmp F4
F5:
  inc cx
  pop dx
  jmp F3



Right1:
  pop cx
  mov dx,112
  mov cx,446
F6:
  push cx
  cmp dx,368
  je Low1
F7:
  cmp cx,448
  je F8
  WrPixel dx,cx,cc
  inc cx
  jmp F7
F8:
  inc dx
  pop cx
  jmp F6


Low1:
  pop cx
  mov dx,366
  mov cx,192
F9:
  push dx
  cmp cx,448
  je Left2
F10:
  cmp dx,368
  je F11
  WrPixel dx,cx,cc
  inc dx
  jmp F10
F11:
  inc cx
  pop dx
  jmp F9


Left2:
  pop cx
  mov dx,112
  mov cx,254
F12:
  push cx
  cmp dx,368
  je Top2
F13:
  cmp cx,258
  je F14
  WrPixel dx,cx,cc
  inc cx
  jmp F13
F14:
  inc dx
  pop cx
  jmp F12

Top2:
  pop cx
  mov dx,174
  mov cx,192
F15:
  push dx
  cmp cx,448
  je MidRow
F16:
  cmp dx,178
  je F17
  WrPixel dx,cx,cc
  inc dx
  jmp F16
F17:
  inc cx
  pop dx
  jmp F15

MidRow:
  pop cx
  mov dx,112
  mov cx,318
F18:
  push cx
  cmp dx,368
  je MidCol
F19:
  cmp cx,322
  je F20
  WrPixel dx,cx,cc
  inc cx
  jmp F19
F20:
  inc dx
  pop cx
  jmp F18

MidCol:
  pop cx
  mov dx,238
  mov cx,192
F21:
  push dx
  cmp cx,448
  je Right2
F22:
  cmp dx,242
  je F23
  WrPixel dx,cx,cc
  inc dx
  jmp F22
F23:
  inc cx
  pop dx
  jmp F21

Right2:
  pop cx
  mov dx,112
  mov cx,382
F24:
  push cx
  cmp dx,368
  je Low2
F25:
  cmp cx,386
  je F26
  WrPixel dx,cx,cc
  inc cx
  jmp F25
F26:
  inc dx
  pop cx
  jmp F24

Low2:
  pop cx
  mov dx,302
  mov cx,192
F27:
  push dx
  cmp cx,448
  je EndFrame
F28:
  cmp dx,306
  je F29
  WrPixel dx,cx,cc
  inc dx
  jmp F28
F29:
  inc cx
  pop dx
  jmp F27

EndFrame:
  pop cx
mov sp,store
ret
Print_Frame endp


rand_Location PROC
     mov store,sp
     ; 計算亂數值
     ; 傳回: AX = 介於0..32767之亂數值
     mov ah,2ch   ;取得電腦時間之1/100s
     int 21h
     mov byte ptr X,dl
     
     mov ax,15Ah ; 計算15A4E35h*X值
     mul word ptr X ; 拆成[ab][cd]計算 ->
     mov cx,ax ; 結果 = a*d + b*c + b*d
     mov ax,4E35h ; 其中a*d+b*c均在high word部份
     mul word ptr X+2
     add cx,ax ; CX = a*d+b*c (high word部份)
     mov ax,4E35h
     mul word ptr X
     add dx,cx ; DX:AX = 乘法結果
     add ax,1 ; 再加1
     adc dx,0
     mov word ptr X,ax ; 將新的值存起來
     mov word ptr X+2,dx
     mov ax,dx ; 計算傳回值
     and ax,7FFFh
     mov bx,16
     mov dx,0
     div bx
     mov randValue,dl
     mov comparestart2,dl
 cmp randValue,0
 je R0
 cmp randValue,1
 je R1
 cmp randValue,2
 je R2
 cmp randValue,3
 je R3
 cmp randValue,4
 je R4
 cmp randValue,5
 je R5
 cmp randValue,6
 je R6
 cmp randValue,7
 je R7
 cmp randValue,8
 je R8
 cmp randValue,9
 je R9
 cmp randValue,10
 je R10
 cmp randValue,11
 je R11
 cmp randValue,12
 je R12
 cmp randValue,13
 je R13
 cmp randValue,14
 je R14
 cmp randValue,15
 je R15

R0:
 mov numberx,26
 mov numbery,9
 mov controlx,194
 mov controly,114
 jmp endLoca
R1:
 mov numberx,34
 mov numbery,9
 mov controlx,258
 mov controly,114
 jmp endLoca
R2:
 mov numberx,42
 mov numbery,9
 mov controlx,322
 mov controly,114
 jmp endLoca
R3:
 mov numberx,50
 mov numbery,9
 mov controlx,386
 mov controly,114
 jmp endLoca
R4:
 mov numberx,26
 mov numbery,13
 mov controlx,194
 mov controly,178
 jmp endLoca
R5:
 mov numberx,34
 mov numbery,13
 mov controlx,258
 mov controly,178
 jmp endLoca
R6:
 mov numberx,42
 mov numbery,13
 mov controlx,322
 mov controly,178
 jmp endLoca
R7:
 mov numberx,50
 mov numbery,13
 mov controlx,386
 mov controly,178
 jmp endLoca
R8:
 mov numberx,26
 mov numbery,17
 mov controlx,194
 mov controly,242
 jmp endLoca
R9:
 mov numberx,34
 mov numbery,17
 mov controlx,258
 mov controly,242
 jmp endLoca
R10:
 mov numberx,42
 mov numbery,17
 mov controlx,322
 mov controly,242
 jmp endLoca
R11:
 mov numberx,50
 mov numbery,17
 mov controlx,386
 mov controly,242
 jmp endLoca
R12:
 mov numberx,26
 mov numbery,21
 mov controlx,194
 mov controly,306
 jmp endLoca
R13:
 mov numberx,34
 mov numbery,21
 mov controlx,258
 mov controly,306
 jmp endLoca
R14:
 mov numberx,42
 mov numbery,21
 mov controlx,322
 mov controly,306
 jmp endLoca
R15:
 mov numberx,50
 mov numbery,21
 mov controlx,386
 mov controly,306
 jmp endLoca

endLoca:
mov sp,store
 ret 
rand_Location ENDP

rand_24 PROC
     mov store,sp
     ; 計算亂數值
     ; 傳回: AX = 介於0..32767之亂數值
     mov ah,2ch   ;取得電腦時間之1/100s
     int 21h
     mov byte ptr X,dl
     
     mov ax,15Ah ; 計算15A4E35h*X值
     mul word ptr X ; 拆成[ab][cd]計算 ->
     mov cx,ax ; 結果 = a*d + b*c + b*d
     mov ax,4E35h ; 其中a*d+b*c均在high word部份
     mul word ptr X+2
     add cx,ax ; CX = a*d+b*c (high word部份)
     mov ax,4E35h
     mul word ptr X
     add dx,cx ; DX:AX = 乘法結果
     add ax,1 ; 再加1
     adc dx,0
     mov word ptr X,ax ; 將新的值存起來
     mov word ptr X+2,dx
     mov ax,dx ; 計算傳回值
     and ax,7FFFh
     mov bx,2
     mov dx,0
     div bx
     mov randValue24,dl
 cmp randValue24,0
 je R240
 cmp randValue24,1
 je R241
R240:
mov randColor,01h
mov number,2
mov sp,store
ret
R241:
mov randColor,02h
mov number,4
mov sp,store
ret
rand_24 ENDP

Print_num	proc near
			mov cx,0
	Hex2Dec:
			inc cx
			mov bx,10
			mov dx,0
			div bx
			push dx
			cmp ax,0
			jne Hex2Dec	
	dec2Ascll:
			pop ax
			add al,30h
			mov dl,al
			mov ah,02h
			int 21h
			loop dec2Ascll
			ret			
Print_num ENDP

direction   proc
mov store,sp
cmp color0,00h   ;0000
  jne up0
  cmp color4,00h
  jne up0
  cmp color8,00h
  jne up0
  cmp color12,00h
  jne up0
  jmp U0_0000
up0:
  cmp color0,00h   ;1000
  je up1
  cmp color4,00h
  jne up1
  cmp color8,00h
  jne up1
  cmp color12,00h
  jne up1
  jmp U0_1000
up1:
  cmp color0,00h   ;0100
  jne up2
  cmp color4,00h
  je up2
  cmp color8,00h
  jne up2
  cmp color12,00h
  jne up2
  jmp U0_0100
up2:
  cmp color0,00h   ;0010
  jne up3
  cmp color4,00h
  jne up3
  cmp color8,00h
  je up3
  cmp color12,00h
  jne up3
  jmp U0_0010
up3:
  cmp color0,00h   ;0001
  jne up4
  cmp color4,00h
  jne up4
  cmp color8,00h
  jne up4
  cmp color12,00h
  je up4
  jmp U0_0001
up4:
  cmp color0,00h   ;1100
  je up5
  cmp color4,00h
  je up5
  cmp color8,00h
  jne up5
  cmp color12,00h
  jne up5
  jmp U0_1100
up5:
  cmp color0,00h   ;1010
  je up6
  cmp color4,00h
  jne up6
  cmp color8,00h
  je up6
  cmp color12,00h
  jne up6
  jmp U0_1010
up6:
  cmp color0,00h   ;1001
  je up7
  cmp color4,00h
  jne up7
  cmp color8,00h
  jne up7
  cmp color12,00h
  je up7
  jmp U0_1001
up7:
  cmp color0,00h   ;0110
  jne up8
  cmp color4,00h
  je up8
  cmp color8,00h
  je up8
  cmp color12,00h
  jne up8
  jmp U0_0110
up8:
  cmp color0,00h   ;0101
  jne up9
  cmp color4,00h
  je up9
  cmp color8,00h
  jne up9
  cmp color12,00h
  je up9
  jmp U0_0101
up9:
  cmp color0,00h   ;0011
  jne up10
  cmp color4,00h
  jne up10
  cmp color8,00h
  je up10
  cmp color12,00h
  je up10
  jmp U0_0011 
up10:
  cmp color0,00h   ;1110
  je up11
  cmp color4,00h
  je up11
  cmp color8,00h
  je up11
  cmp color12,00h
  jne up11
  jmp U0_1110
up11:
  cmp color0,00h   ;1101
  je up12
  cmp color4,00h
  je up12
  cmp color8,00h
  jne up12
  cmp color12,00h
  je up12
  jmp U0_1101
up12:
  cmp color0,00h   ;1011
  je up13
  cmp color4,00h
  jne up13
  cmp color8,00h
  je up13
  cmp color12,00h
  je up13
  jmp U0_1011
up13:
  cmp color0,00h   ;0111
  jne up14
  cmp color4,00h
  je up14
  cmp color8,00h
  je up14
  cmp color12,00h
  je up14
  jmp U0_0111
up14:
  jmp U0_1111


U0_0000:
  add stupid,1
  jmp up33
U0_1000:
  add stupid,1
  jmp up33
U0_0100:
  Print_Rectangular x4,y4,00h
  Print_Rectangular x0,y0,color4
  SetCursor yy0,xx0
  mov ax,number4
  mov number0,ax
  call Print_num
  jmp up33
U0_0010:
  Print_Rectangular x8,y8,00h  
  Print_Rectangular x0,y0,color8
  SetCursor yy0,xx0
  mov ax,number8
  mov number0,ax
  call Print_num
  jmp up33
U0_0001:
  Print_Rectangular x12,y12,00h  
  Print_Rectangular x0,y0,color12 
  SetCursor yy0,xx0
  mov ax,number12
  mov number0,ax
  call Print_num
  jmp up33
U0_1100:
  mov al,color0
  cmp al,color4
  je up15
  add stupid,1
  jmp up33
 up15:
  add color0,1
  mov bx,number4
  add number0,bx
  Print_Rectangular x4,y4,00h  
  Print_Rectangular x0,y0,00h  
  Print_Rectangular x0,y0,color0
  SetCursor yy0,xx0
  mov ax,number0
  call Print_num
  jmp up33
U0_1010:
  mov al,color0
  cmp al,color8
  je up16
  Print_Rectangular x8,y8,00h  
  Print_Rectangular x4,y4,color8
  SetCursor yy4,xx4
  mov ax,number8
  mov number4,ax
  call Print_num  
  jmp up33
 up16:
  add color0,1
  mov bx,number8
  add number0,bx
  Print_Rectangular x0,y0,00h  
  Print_Rectangular x8,y8,00h 
  Print_Rectangular x0,y0,color0
  SetCursor yy0,xx0
  mov ax,number0
  call Print_num
  jmp up33
U0_1001:
  mov al,color0
  cmp al,color12
  je up17
  Print_Rectangular x12,y12,00h 
  Print_Rectangular x4,y4,color12
  SetCursor yy4,xx4
  mov ax,number12
  mov number4,ax
  call Print_num  
  jmp up33
 up17:
  add color0,1
  mov bx,number12
  add number0,bx
  Print_Rectangular x0,y0,00h  
  Print_Rectangular x12,y12,00h 
  Print_Rectangular x0,y0,color0
  SetCursor yy0,xx0
  mov ax,number0
  call Print_num
  jmp up33
U0_0110: 
  mov al,color4
  cmp al,color8
  je up18
  Print_Rectangular x8,y8,00h 
  Print_Rectangular x4,y4,00h 
  Print_Rectangular x0,y0,color4
  Print_Rectangular x4,y4,color8
  SetCursor yy0,xx0
  mov ax,number4
  mov number0,ax
  call Print_num
  SetCursor yy4,xx4
  mov ax,number8
  mov number4,ax
  call Print_num  
  jmp up33
 up18:
  add color4,1
  mov bx,number8
  add number4,bx
  Print_Rectangular x8,y8,00h 
  Print_Rectangular x4,y4,00h 
  Print_Rectangular x0,y0,color4
  SetCursor yy0,xx0
  mov ax,number4
  mov number0,ax
  call Print_num  
  jmp up33
U0_0101:
  mov al,color4
  cmp al,color12
  je up19
  Print_Rectangular x12,y12,00h 
  Print_Rectangular x4,y4,00h 
  Print_Rectangular x0,y0,color4
  Print_Rectangular x4,y4,color12
  SetCursor yy0,xx0
  mov ax,number4
  mov number0,ax
  call Print_num
  SetCursor yy4,xx4
  mov ax,number12
  mov number4,ax
  call Print_num  
  jmp up33
 up19:
  add color4,1
  mov bx,number12
  add number4,bx
  Print_Rectangular x12,y12,00h 
  Print_Rectangular x4,y4,00h 
  Print_Rectangular x0,y0,color4
  SetCursor yy0,xx0
  mov ax,number4
  mov number0,ax
  call Print_num  
  jmp up33
U0_0011:
  mov al,color8
  cmp al,color12
  je up20
  Print_Rectangular x12,y12,00h 
  Print_Rectangular x8,y8,00h 
  Print_Rectangular x0,y0,color8
  Print_Rectangular x4,y4,color12
  SetCursor yy0,xx0
  mov ax,number8
  mov number0,ax
  call Print_num
  SetCursor yy4,xx4
  mov ax,number12
  mov number4,ax
  call Print_num  
  jmp up33
 up20:
  add color8,1
  mov bx,number12
  add number8,bx
  Print_Rectangular x12,y12,00h 
  Print_Rectangular x8,y8,00h 
  Print_Rectangular x0,y0,color8
  SetCursor yy0,xx0
  mov ax,number8
  mov number0,ax
  call Print_num 
  jmp up33
U0_1110:
  mov al,color0
  cmp al,color4
  je up21
  mov al,color4
  cmp al,color8
  je up22 
  add stupid,1
  jmp up33
 up22:
  add color4,1
  mov bx,number8
  add number4,bx
  Print_Rectangular x4,y4,00h  
  Print_Rectangular x8,y8,00h  
  Print_Rectangular x4,y4,color4 
  SetCursor yy4,xx4
  mov ax,number4
  call Print_num 
  jmp up33
 up21:
  add color0,1
  mov bx,number4
  add number0,bx
  Print_Rectangular x0,y0,00h  
  Print_Rectangular x4,y4,00h  
  Print_Rectangular x8,y8,00h  
  Print_Rectangular x0,y0,color0
  Print_Rectangular x4,y4,color8
  SetCursor yy0,xx0
  mov ax,number0
  call Print_num
  SetCursor yy4,xx4
  mov ax,number8
  mov number4,ax
  call Print_num 
  jmp up33
U0_1101:
  mov al,color0
  cmp al,color4
  je up23
  mov al,color4
  cmp al,color12
  je up24
  Print_Rectangular x12,y12,00h  
  Print_Rectangular x8,y8,color12
  SetCursor yy8,xx8
  mov ax,number12
  mov number8,ax
  call Print_num 
  jmp up33
 up24:
  add color4,1
  mov bx,number12
  add number4,bx
  Print_Rectangular x4,y4,00h  
  Print_Rectangular x12,y12,00h  
  Print_Rectangular x4,y4,color4  
  SetCursor yy4,xx4
  mov ax,number4
  call Print_num  
  jmp up33
 up23:
  add color0,1
  mov bx,number4
  add number0,bx
  Print_Rectangular x0,y0,00h  
  Print_Rectangular x4,y4,00h  
  Print_Rectangular x12,y12,00h  
  Print_Rectangular x0,y0,color0
  Print_Rectangular x4,y4,color12
  SetCursor yy0,xx0
  mov ax,number0
  call Print_num
  SetCursor yy4,xx4
  mov ax,number12
  mov number4,ax
  call Print_num  
  jmp up33
U0_1011:
  mov al,color0
  cmp al,color8
  je up25
  mov al,color8
  cmp al,color12
  je up26
  Print_Rectangular x8,y8,00h  
  Print_Rectangular x12,y12,00h  
  Print_Rectangular x4,y4,color8   
  Print_Rectangular x8,y8,color12  
  SetCursor yy4,xx4
  mov ax,number8
  mov number4,ax
  call Print_num 
  SetCursor yy8,xx8
  mov ax,number12
  mov number8,ax
  call Print_num 
  jmp up33
 up26:
  add color8,1
  mov bx,number12
  add number8,bx
  Print_Rectangular x12,y12,00h  
  Print_Rectangular x8,y8,00h  
  Print_Rectangular x4,y4,color8
  SetCursor yy4,xx4
  mov ax,number8
  mov number4,ax
  call Print_num    
  jmp up33
 up25:
  add color0,1
  mov bx,number8
  add number0,bx
  Print_Rectangular x0,y0,00h  
  Print_Rectangular x8,y8,00h  
  Print_Rectangular x12,y12,00h  
  Print_Rectangular x0,y0,color0
  Print_Rectangular x4,y4,color12
  SetCursor yy0,xx0
  mov ax,number0
  call Print_num
  SetCursor yy4,xx4
  mov ax,number12
  mov number4,ax
  call Print_num 
  jmp up33
U0_0111:
  mov al,color4
  cmp al,color8
  je up27
  mov al,color8
  cmp al,color12
  je up28
  Print_Rectangular x4,y4,00h  
  Print_Rectangular x8,y8,00h  
  Print_Rectangular x12,y12,00h  
  Print_Rectangular x0,y0,color4
  Print_Rectangular x4,y4,color8   
  Print_Rectangular x8,y8,color12  
  SetCursor yy0,xx0
  mov ax,number4
  mov number0,ax
  call Print_num
  SetCursor yy4,xx4
  mov ax,number8
  mov number4,ax
  call Print_num 
  SetCursor yy8,xx8
  mov ax,number12
  mov number8,ax
  call Print_num 
  jmp up33
 up28:
  add color8,1
  mov bx,number12
  add number8,bx
  Print_Rectangular x4,y4,00h  
  Print_Rectangular x8,y8,00h  
  Print_Rectangular x12,y12,00h 
  Print_Rectangular x0,y0,color4
  Print_Rectangular x4,y4,color8
  SetCursor yy0,xx0
  mov ax,number4
  mov number0,ax
  call Print_num
  SetCursor yy4,xx4
  mov ax,number8
  mov number4,ax
  call Print_num  
  jmp up33
 up27:
  add color4,1
  mov bx,number8
  add number4,bx
  Print_Rectangular x4,y4,00h  
  Print_Rectangular x8,y8,00h  
  Print_Rectangular x12,y12,00h 
  Print_Rectangular x0,y0,color4
  Print_Rectangular x4,y4,color12
  SetCursor yy0,xx0
  mov ax,number4
  mov number0,ax
  call Print_num
  SetCursor yy4,xx4
  mov ax,number12
  mov number4,ax
  call Print_num 
  jmp up33
U0_1111:
  mov al,color0
  cmp al,color4
  je up29
  mov al,color4
  cmp al,color8
  je up30
  mov al,color8
  cmp al,color12
  je up31
  add stupid,1
  jmp up33
 up31:
  add color8,1
  mov ax,number12
  add number8,ax
  Print_Rectangular x12,y12,00h  
  Print_Rectangular x8,y8,color8
  SetCursor yy8,xx8
  mov ax,number8
  call Print_num 
  jmp up33
 up30:
  add color4,1
  mov ax,number8
  add number4,ax
  Print_Rectangular x4,y4,00h  
  Print_Rectangular x8,y8,00h  
  Print_Rectangular x12,y12,00h  
  Print_Rectangular x4,y4,color4
  Print_Rectangular x8,y8,color12
  SetCursor yy4,xx4
  mov ax,number4
  call Print_num 
  SetCursor yy8,xx8
  mov ax,number12
  mov number8,ax
  call Print_num 
  jmp up33
 up29:
  mov al,color8
  cmp al,color12
  je up32 
  add color0,1
  mov ax,number4
  add number0,ax
  Print_Rectangular x0,y0,00h 
  Print_Rectangular x4,y4,00h  
  Print_Rectangular x8,y8,00h  
  Print_Rectangular x12,y12,00h 
  Print_Rectangular x0,y0,color0
  Print_Rectangular x4,y4,color8
  Print_Rectangular x8,y8,color12
  SetCursor yy0,xx0
  mov ax,number0
  call Print_num
  SetCursor yy4,xx4
  mov ax,number8
  mov number4,ax
  call Print_num 
  SetCursor yy8,xx8
  mov ax,number12
  mov number8,ax
  call Print_num 
  jmp up33
 up32: 
  add color0,1
  add color8,1
  mov ax,number4
  add number0,ax
  mov ax,number12
  add number8,ax
  Print_Rectangular x0,y0,00h 
  Print_Rectangular x4,y4,00h  
  Print_Rectangular x8,y8,00h  
  Print_Rectangular x12,y12,00h 
  Print_Rectangular x0,y0,color0
  Print_Rectangular x4,y4,color8
  SetCursor yy0,xx0
  mov ax,number0
  call Print_num
  SetCursor yy4,xx4
  mov ax,number8
  mov number4,ax
  call Print_num   
  jmp up33
up33:
  mov sp,store
  ret
  direction endp


Gameoveryn proc
mov store,sp
 mov al,color1
 cmp color00,al
 je Gend
 mov al,color44
 cmp color00,al
 je Gend
 mov al,color2
 cmp color1,al
 je Gend
 mov al,color5
 cmp color1,al
 je Gend
 mov al,color6
 cmp color2,al
 je Gend
 mov al,color3
 cmp color2,al
 je Gend
 mov al,color3
 cmp color7,al
 je Gend
 mov al,color88
 cmp color44,al
 je Gend
 mov al,color5
 cmp color44,al
 je Gend
 mov al,color6
 cmp color5,al
 je Gend
 mov al,color9
 cmp color5,al
 je Gend
 mov al,color10
 cmp color6,al
 je Gend
 mov al,color7
 cmp color6,al
 je Gend
 mov al,color11
 cmp color7,al
 je Gend
 mov al,color1212
 cmp color88,al
 je Gend
 mov al,color9
 cmp color88,al
 je Gend
 mov al,color13
 cmp color9,al
 je Gend
 mov al,color10
 cmp color9,al
 je Gend
 mov al,color14
 cmp color10,al
 je Gend
 mov al,color11
 cmp color10,al
 je Gend
 mov al,color15
 cmp color11,al
 je Gend
 mov al,color13
 cmp color1212,al
 je Gend
 mov al,color14
 cmp color13,al
 je Gend
 mov al,color15
 cmp color14,al
 je Gend
 mov final,1

Gend:
mov sp,store
ret
Gameoveryn endp

Gamestartprnt proc
two:
  invoke abc ,80,110,190
  invoke abc ,80,110,189
  invoke abc ,80,110,188
  invoke abc ,80,110,187
  invoke abc ,80,110,186
  invoke abc ,80,110,185
  invoke abc ,80,110,184
  invoke abc ,80,110,183
  invoke abc ,80,110,182
  invoke abc ,80,110,181

  invoke abc ,80,110,180
  invoke abc ,80,110,179
  invoke abc ,80,110,178
  invoke abc ,80,110,177
  invoke abc ,80,110,176
  invoke abc ,80,110,175
  invoke abc ,80,110,174
  invoke abc ,80,110,173
  invoke abc ,80,110,172
  invoke abc ,80,110,171

  invoke abc ,90,160,170
  invoke abc ,90,160,169
  invoke abc ,90,160,168
  invoke abc ,90,160,167
  invoke abc ,90,160,166 
  invoke abc ,90,160,165
  invoke abc ,90,160,164
  invoke abc ,90,160,163 
  invoke abc ,90,160,162
  invoke abc ,90,160,161

  invoke abc ,100,150,160
  invoke abc ,100,150,159
  invoke abc ,100,150,158
  invoke abc ,100,150,157
  invoke abc ,100,150,156
  invoke abc ,100,150,155
  invoke abc ,100,150,154
  invoke abc ,100,150,153
  invoke abc ,100,150,152
  invoke abc ,100,150,151

  invoke abc ,140,170,171
  invoke abc ,140,170,172
  invoke abc ,140,170,173
  invoke abc ,140,170,174
  invoke abc ,140,170,175
  invoke abc ,140,170,176
  invoke abc ,140,170,177
  invoke abc ,140,170,178
  invoke abc ,140,170,179
  invoke abc ,140,170,180

  invoke abc ,140,170,181
  invoke abc ,140,170,182
  invoke abc ,140,170,183
  invoke abc ,140,170,184
  invoke abc ,140,170,185
  invoke abc ,140,170,186
  invoke abc ,140,170,187
  invoke abc ,140,170,188
  invoke abc ,140,170,189
  invoke abc ,140,170,190

  invoke abc ,130,170,191
  invoke abc ,130,170,192
  invoke abc ,130,170,193
  invoke abc ,130,170,194
  invoke abc ,130,170,195
  invoke abc ,130,170,196
  invoke abc ,130,170,197
  invoke abc ,130,170,198
  invoke abc ,130,170,199
  invoke abc ,130,170,200

  invoke abc ,120,160,201
  invoke abc ,120,160,202
  invoke abc ,120,160,203
  invoke abc ,120,160,204
  invoke abc ,120,160,205
  invoke abc ,120,160,206
  invoke abc ,120,160,207
  invoke abc ,120,160,208
  invoke abc ,120,160,209
  invoke abc ,120,160,210

  invoke abc ,110,150,211
  invoke abc ,110,150,212
  invoke abc ,110,150,213
  invoke abc ,110,150,214
  invoke abc ,110,150,215
  invoke abc ,110,150,216
  invoke abc ,110,150,217
  invoke abc ,110,150,218
  invoke abc ,110,150,219
  invoke abc ,110,150,220

  invoke abc ,100,140,221
  invoke abc ,100,140,222
  invoke abc ,100,140,223
  invoke abc ,100,140,224
  invoke abc ,100,140,225
  invoke abc ,100,140,226
  invoke abc ,100,140,227
  invoke abc ,100,140,228
  invoke abc ,100,140,229
  invoke abc ,100,140,230

  invoke abc ,90,170,231
  invoke abc ,90,170,232
  invoke abc ,90,170,233
  invoke abc ,90,170,234
  invoke abc ,90,170,235
  invoke abc ,90,170,236
  invoke abc ,90,170,237
  invoke abc ,90,170,238
  invoke abc ,90,170,239
  invoke abc ,90,170,240

  invoke abc ,80,170,241
  invoke abc ,80,170,242
  invoke abc ,80,170,243
  invoke abc ,80,170,244
  invoke abc ,80,170,245
  invoke abc ,80,170,246
  invoke abc ,80,170,247
  invoke abc ,80,170,248
  invoke abc ,80,170,249
  invoke abc ,80,170,250

zero:

  invoke abc ,230,280,160
  invoke abc ,230,280,159
  invoke abc ,230,280,158
  invoke abc ,230,280,157
  invoke abc ,230,280,156
  invoke abc ,230,280,155
  invoke abc ,230,280,154
  invoke abc ,230,280,153
  invoke abc ,230,280,152
  invoke abc ,230,280,151 

  invoke abc ,220,240,170
  invoke abc ,220,240,169
  invoke abc ,220,240,168
  invoke abc ,220,240,167
  invoke abc ,220,240,166 
  invoke abc ,220,240,165
  invoke abc ,220,240,164
  invoke abc ,220,240,163 
  invoke abc ,220,240,162
  invoke abc ,220,240,161 

  invoke abc ,270,290,170
  invoke abc ,270,290,169
  invoke abc ,270,290,168
  invoke abc ,270,290,167
  invoke abc ,270,290,166 
  invoke abc ,270,290,165
  invoke abc ,270,290,164
  invoke abc ,270,290,163 
  invoke abc ,270,290,162
  invoke abc ,270,290,161 

  invoke abc ,210,240,171
  invoke abc ,210,240,172
  invoke abc ,210,240,173
  invoke abc ,210,240,174
  invoke abc ,210,240,175
  invoke abc ,210,240,176
  invoke abc ,210,240,177
  invoke abc ,210,240,178
  invoke abc ,210,240,179
  invoke abc ,210,240,180

  invoke abc ,270,300,171
  invoke abc ,270,300,172
  invoke abc ,270,300,173
  invoke abc ,270,300,174
  invoke abc ,270,300,175
  invoke abc ,270,300,176
  invoke abc ,270,300,177
  invoke abc ,270,300,178
  invoke abc ,270,300,179
  invoke abc ,270,300,180 

  invoke abc ,210,240,181
  invoke abc ,210,240,182
  invoke abc ,210,240,183
  invoke abc ,210,240,184
  invoke abc ,210,240,185
  invoke abc ,210,240,186
  invoke abc ,210,240,187
  invoke abc ,210,240,188
  invoke abc ,210,240,189
  invoke abc ,210,240,190 

  invoke abc ,270,300,181
  invoke abc ,270,300,182
  invoke abc ,270,300,183
  invoke abc ,270,300,184
  invoke abc ,270,300,185
  invoke abc ,270,300,186
  invoke abc ,270,300,187
  invoke abc ,270,300,188
  invoke abc ,270,300,189
  invoke abc ,270,300,190 

  invoke abc ,210,240,191
  invoke abc ,210,240,192
  invoke abc ,210,240,193
  invoke abc ,210,240,194
  invoke abc ,210,240,195
  invoke abc ,210,240,196
  invoke abc ,210,240,197
  invoke abc ,210,240,198
  invoke abc ,210,240,199
  invoke abc ,210,240,200 

  invoke abc ,270,300,191
  invoke abc ,270,300,192
  invoke abc ,270,300,193
  invoke abc ,270,300,194
  invoke abc ,270,300,195
  invoke abc ,270,300,196
  invoke abc ,270,300,197
  invoke abc ,270,300,198
  invoke abc ,270,300,199
  invoke abc ,270,300,200

  invoke abc ,210,240,201
  invoke abc ,210,240,202
  invoke abc ,210,240,203
  invoke abc ,210,240,204
  invoke abc ,210,240,205
  invoke abc ,210,240,206
  invoke abc ,210,240,207
  invoke abc ,210,240,208
  invoke abc ,210,240,209
  invoke abc ,210,240,210 

  invoke abc ,270,300,201
  invoke abc ,270,300,202
  invoke abc ,270,300,203
  invoke abc ,270,300,204
  invoke abc ,270,300,205
  invoke abc ,270,300,206
  invoke abc ,270,300,207
  invoke abc ,270,300,208
  invoke abc ,270,300,209
  invoke abc ,270,300,210

  invoke abc ,210,240,211
  invoke abc ,210,240,212
  invoke abc ,210,240,213
  invoke abc ,210,240,214
  invoke abc ,210,240,215
  invoke abc ,210,240,216
  invoke abc ,210,240,217
  invoke abc ,210,240,218
  invoke abc ,210,240,219
  invoke abc ,210,240,220 

  invoke abc ,270,300,211
  invoke abc ,270,300,212
  invoke abc ,270,300,213
  invoke abc ,270,300,214
  invoke abc ,270,300,215
  invoke abc ,270,300,216
  invoke abc ,270,300,217
  invoke abc ,270,300,218
  invoke abc ,270,300,219
  invoke abc ,270,300,220

  invoke abc ,210,240,221
  invoke abc ,210,240,222
  invoke abc ,210,240,223
  invoke abc ,210,240,224
  invoke abc ,210,240,225
  invoke abc ,210,240,226
  invoke abc ,210,240,227
  invoke abc ,210,240,228
  invoke abc ,210,240,229
  invoke abc ,210,240,230 

  invoke abc ,270,300,221
  invoke abc ,270,300,222
  invoke abc ,270,300,223
  invoke abc ,270,300,224
  invoke abc ,270,300,225
  invoke abc ,270,300,226
  invoke abc ,270,300,227
  invoke abc ,270,300,228
  invoke abc ,270,300,229
  invoke abc ,270,300,230 


  invoke abc ,220,240,231
  invoke abc ,220,240,232
  invoke abc ,220,240,233
  invoke abc ,220,240,234
  invoke abc ,220,240,235 
  invoke abc ,220,240,236
  invoke abc ,220,240,237
  invoke abc ,220,240,238 
  invoke abc ,220,240,239
  invoke abc ,220,240,240 

  invoke abc ,270,290,231
  invoke abc ,270,290,232
  invoke abc ,270,290,233
  invoke abc ,270,290,234
  invoke abc ,270,290,235 
  invoke abc ,270,290,236
  invoke abc ,270,290,237
  invoke abc ,270,290,238 
  invoke abc ,270,290,239
  invoke abc ,270,290,240

  invoke abc ,230,280,241
  invoke abc ,230,280,242
  invoke abc ,230,280,243
  invoke abc ,230,280,244
  invoke abc ,230,280,245
  invoke abc ,230,280,246
  invoke abc ,230,280,247
  invoke abc ,230,280,248
  invoke abc ,230,280,249
  invoke abc ,230,280,250 

four:

  invoke abc ,390,420,151
  invoke abc ,390,420,152
  invoke abc ,390,420,153
  invoke abc ,390,420,154
  invoke abc ,390,420,155
  invoke abc ,390,420,156
  invoke abc ,390,420,157
  invoke abc ,390,420,158
  invoke abc ,390,420,159
  invoke abc ,390,420,160

  invoke abc ,380,420,161
  invoke abc ,380,420,162
  invoke abc ,380,420,163
  invoke abc ,380,420,164
  invoke abc ,380,420,165
  invoke abc ,380,420,166
  invoke abc ,380,420,167
  invoke abc ,380,420,168
  invoke abc ,380,420,169
  invoke abc ,380,420,170

  invoke abc ,370,390,171
  invoke abc ,370,390,172
  invoke abc ,370,390,173
  invoke abc ,370,390,174
  invoke abc ,370,390,175
  invoke abc ,370,390,176
  invoke abc ,370,390,177
  invoke abc ,370,390,178
  invoke abc ,370,390,179
  invoke abc ,370,390,180

  invoke abc ,400,420,171
  invoke abc ,400,420,172
  invoke abc ,400,420,173
  invoke abc ,400,420,174
  invoke abc ,400,420,175
  invoke abc ,400,420,176
  invoke abc ,400,420,177
  invoke abc ,400,420,178
  invoke abc ,400,420,179
  invoke abc ,400,420,180

  invoke abc ,360,380,181
  invoke abc ,360,380,182
  invoke abc ,360,380,183
  invoke abc ,360,380,184
  invoke abc ,360,380,185
  invoke abc ,360,380,186
  invoke abc ,360,380,187
  invoke abc ,360,380,188
  invoke abc ,360,380,189
  invoke abc ,360,380,190

  invoke abc ,400,420,181
  invoke abc ,400,420,182
  invoke abc ,400,420,183
  invoke abc ,400,420,184
  invoke abc ,400,420,185
  invoke abc ,400,420,186
  invoke abc ,400,420,187
  invoke abc ,400,420,188
  invoke abc ,400,420,189
  invoke abc ,400,420,190

  invoke abc ,350,370,191
  invoke abc ,350,370,192
  invoke abc ,350,370,193
  invoke abc ,350,370,194
  invoke abc ,350,370,195
  invoke abc ,350,370,196
  invoke abc ,350,370,197
  invoke abc ,350,370,198
  invoke abc ,350,370,199
  invoke abc ,350,370,200

  invoke abc ,400,420,191
  invoke abc ,400,420,192
  invoke abc ,400,420,193
  invoke abc ,400,420,194
  invoke abc ,400,420,195
  invoke abc ,400,420,196
  invoke abc ,400,420,197
  invoke abc ,400,420,198
  invoke abc ,400,420,199
  invoke abc ,400,420,200

  invoke abc ,340,360,201
  invoke abc ,340,360,202
  invoke abc ,340,360,203
  invoke abc ,340,360,204
  invoke abc ,340,360,205
  invoke abc ,340,360,206
  invoke abc ,340,360,207
  invoke abc ,340,360,208
  invoke abc ,340,360,209
  invoke abc ,340,360,210

  invoke abc ,400,420,201
  invoke abc ,400,420,202
  invoke abc ,400,420,203
  invoke abc ,400,420,204
  invoke abc ,400,420,205
  invoke abc ,400,420,206
  invoke abc ,400,420,207
  invoke abc ,400,420,208
  invoke abc ,400,420,209
  invoke abc ,400,420,210

  invoke abc ,340,430,211
  invoke abc ,340,430,212
  invoke abc ,340,430,213
  invoke abc ,340,430,214
  invoke abc ,340,430,215
  invoke abc ,340,430,216
  invoke abc ,340,430,217
  invoke abc ,340,430,218
  invoke abc ,340,430,219
  invoke abc ,340,430,220

  invoke abc ,340,430,221
  invoke abc ,340,430,222
  invoke abc ,340,430,223
  invoke abc ,340,430,224
  invoke abc ,340,430,225
  invoke abc ,340,430,226
  invoke abc ,340,430,227
  invoke abc ,340,430,228
  invoke abc ,340,430,229
  invoke abc ,340,430,230

  invoke abc ,400,420,231
  invoke abc ,400,420,232
  invoke abc ,400,420,233
  invoke abc ,400,420,234
  invoke abc ,400,420,235
  invoke abc ,400,420,236
  invoke abc ,400,420,237
  invoke abc ,400,420,238
  invoke abc ,400,420,239
  invoke abc ,400,420,240

  invoke abc ,400,420,241
  invoke abc ,400,420,242
  invoke abc ,400,420,243
  invoke abc ,400,420,244
  invoke abc ,400,420,245
  invoke abc ,400,420,246
  invoke abc ,400,420,247
  invoke abc ,400,420,248
  invoke abc ,400,420,249
  invoke abc ,400,420,250

eight:

  invoke abc ,490,540,151
  invoke abc ,490,540,152
  invoke abc ,490,540,153
  invoke abc ,490,540,154
  invoke abc ,490,540,155
  invoke abc ,490,540,156
  invoke abc ,490,540,157
  invoke abc ,490,540,158
  invoke abc ,490,540,159
  invoke abc ,490,540,160

  invoke abc ,480,500,161
  invoke abc ,480,500,162
  invoke abc ,480,500,163
  invoke abc ,480,500,164
  invoke abc ,480,500,165
  invoke abc ,480,500,166
  invoke abc ,480,500,167
  invoke abc ,480,500,168
  invoke abc ,480,500,169
  invoke abc ,480,500,170

  invoke abc ,530,550,161
  invoke abc ,530,550,162
  invoke abc ,530,550,163
  invoke abc ,530,550,164
  invoke abc ,530,550,165
  invoke abc ,530,550,166
  invoke abc ,530,550,167
  invoke abc ,530,550,168
  invoke abc ,530,550,169
  invoke abc ,530,550,170


  invoke abc ,470,500,171
  invoke abc ,470,500,172
  invoke abc ,470,500,173
  invoke abc ,470,500,174
  invoke abc ,470,500,175
  invoke abc ,470,500,176
  invoke abc ,470,500,177
  invoke abc ,470,500,178
  invoke abc ,470,500,179
  invoke abc ,470,500,180

  invoke abc ,530,560,171
  invoke abc ,530,560,172
  invoke abc ,530,560,173
  invoke abc ,530,560,174
  invoke abc ,530,560,175
  invoke abc ,530,560,176
  invoke abc ,530,560,177
  invoke abc ,530,560,178
  invoke abc ,530,560,179
  invoke abc ,530,560,180

  invoke abc ,480,550,181
  invoke abc ,480,550,182
  invoke abc ,480,550,183
  invoke abc ,480,550,184
  invoke abc ,480,550,185
  invoke abc ,480,550,186
  invoke abc ,480,550,187
  invoke abc ,480,550,188
  invoke abc ,480,550,189
  invoke abc ,480,550,190

  invoke abc ,490,540,191
  invoke abc ,490,540,192
  invoke abc ,490,540,193
  invoke abc ,490,540,194
  invoke abc ,490,540,195
  invoke abc ,490,540,196
  invoke abc ,490,540,197
  invoke abc ,490,540,198
  invoke abc ,490,540,199
  invoke abc ,490,540,200

  invoke abc ,480,500,201
  invoke abc ,480,500,202
  invoke abc ,480,500,203
  invoke abc ,480,500,204
  invoke abc ,480,500,205
  invoke abc ,480,500,206
  invoke abc ,480,500,207
  invoke abc ,480,500,208
  invoke abc ,480,500,209
  invoke abc ,480,500,210

  invoke abc ,530,550,201
  invoke abc ,530,550,202
  invoke abc ,530,550,203
  invoke abc ,530,550,204
  invoke abc ,530,550,205
  invoke abc ,530,550,206
  invoke abc ,530,550,207
  invoke abc ,530,550,208
  invoke abc ,530,550,209
  invoke abc ,530,550,210

  invoke abc ,470,500,211
  invoke abc ,470,500,212
  invoke abc ,470,500,213
  invoke abc ,470,500,214
  invoke abc ,470,500,215
  invoke abc ,470,500,216
  invoke abc ,470,500,217
  invoke abc ,470,500,218
  invoke abc ,470,500,219
  invoke abc ,470,500,220

  invoke abc ,530,560,211
  invoke abc ,530,560,212
  invoke abc ,530,560,213
  invoke abc ,530,560,214
  invoke abc ,530,560,215
  invoke abc ,530,560,216
  invoke abc ,530,560,217
  invoke abc ,530,560,218
  invoke abc ,530,560,219
  invoke abc ,530,560,220

  invoke abc ,470,500,221
  invoke abc ,470,500,222
  invoke abc ,470,500,223
  invoke abc ,470,500,224
  invoke abc ,470,500,225
  invoke abc ,470,500,226
  invoke abc ,470,500,227
  invoke abc ,470,500,228
  invoke abc ,470,500,229
  invoke abc ,470,500,230

  invoke abc ,530,560,221
  invoke abc ,530,560,222
  invoke abc ,530,560,223
  invoke abc ,530,560,224
  invoke abc ,530,560,225
  invoke abc ,530,560,226
  invoke abc ,530,560,227
  invoke abc ,530,560,228
  invoke abc ,530,560,229
  invoke abc ,530,560,230

  invoke abc ,480,550,231
  invoke abc ,480,550,232
  invoke abc ,480,550,233
  invoke abc ,480,550,234
  invoke abc ,480,550,235
  invoke abc ,480,550,236
  invoke abc ,480,550,237
  invoke abc ,480,550,238
  invoke abc ,480,550,239
  invoke abc ,480,550,240

  invoke abc ,490,540,241
  invoke abc ,490,540,242
  invoke abc ,490,540,243
  invoke abc ,490,540,244
  invoke abc ,490,540,245
  invoke abc ,490,540,246
  invoke abc ,490,540,247
  invoke abc ,490,540,248
  invoke abc ,490,540,249
  invoke abc ,490,540,250
  SetCursor 23,29
  PrintStr start
  GetChar
ret
Gamestartprnt endp


Gameoverprnt proc
  invoke abc ,20,70,371
  invoke abc ,20,70,372
  invoke abc ,20,70,373
  invoke abc ,20,70,374
  invoke abc ,20,70,375
  invoke abc ,20,70,376
  invoke abc ,20,70,377
  invoke abc ,20,70,378
  invoke abc ,20,70,379
  invoke abc ,20,70,380

  invoke abc ,10,30,381
  invoke abc ,10,30,382
  invoke abc ,10,30,383
  invoke abc ,10,30,384
  invoke abc ,10,30,385
  invoke abc ,10,30,386
  invoke abc ,10,30,387
  invoke abc ,10,30,388
  invoke abc ,10,30,389
  invoke abc ,10,30,390
  
  invoke abc ,0,20,391
  invoke abc ,0,20,392
  invoke abc ,0,20,393
  invoke abc ,0,20,394
  invoke abc ,0,20,395
  invoke abc ,0,20,396
  invoke abc ,0,20,397
  invoke abc ,0,20,398
  invoke abc ,0,20,399
  invoke abc ,0,20,400

  invoke abc ,0,20,401
  invoke abc ,0,20,402
  invoke abc ,0,20,403
  invoke abc ,0,20,404
  invoke abc ,0,20,405
  invoke abc ,0,20,406
  invoke abc ,0,20,407
  invoke abc ,0,20,408
  invoke abc ,0,20,409
  invoke abc ,0,20,410

  invoke abc ,40,70,401
  invoke abc ,40,70,402
  invoke abc ,40,70,403
  invoke abc ,40,70,404
  invoke abc ,40,70,405
  invoke abc ,40,70,406
  invoke abc ,40,70,407
  invoke abc ,40,70,408
  invoke abc ,40,70,409
  invoke abc ,40,70,410

  invoke abc ,0,20,411
  invoke abc ,0,20,412
  invoke abc ,0,20,413
  invoke abc ,0,20,414
  invoke abc ,0,20,415
  invoke abc ,0,20,416
  invoke abc ,0,20,417
  invoke abc ,0,20,418
  invoke abc ,0,20,419
  invoke abc ,0,20,420

  invoke abc ,50,70,411
  invoke abc ,50,70,412
  invoke abc ,50,70,413
  invoke abc ,50,70,414
  invoke abc ,50,70,415
  invoke abc ,50,70,416
  invoke abc ,50,70,417
  invoke abc ,50,70,418
  invoke abc ,50,70,419
  invoke abc ,50,70,420

  invoke abc ,10,30,421
  invoke abc ,10,30,422
  invoke abc ,10,30,423
  invoke abc ,10,30,424
  invoke abc ,10,30,425
  invoke abc ,10,30,426
  invoke abc ,10,30,427
  invoke abc ,10,30,428
  invoke abc ,10,30,429
  invoke abc ,10,30,430

  invoke abc ,50,70,421
  invoke abc ,50,70,422
  invoke abc ,50,70,423
  invoke abc ,50,70,424
  invoke abc ,50,70,425
  invoke abc ,50,70,426
  invoke abc ,50,70,427
  invoke abc ,50,70,428
  invoke abc ,50,70,429
  invoke abc ,50,70,430

  invoke abc ,20,70,431
  invoke abc ,20,70,432
  invoke abc ,20,70,433
  invoke abc ,20,70,434
  invoke abc ,20,70,435
  invoke abc ,20,70,436
  invoke abc ,20,70,437
  invoke abc ,20,70,438
  invoke abc ,20,70,439
  invoke abc ,20,70,440

A:
  invoke abc ,100,130,371
  invoke abc ,100,130,372
  invoke abc ,100,130,373
  invoke abc ,100,130,374
  invoke abc ,100,130,375
  invoke abc ,100,130,376
  invoke abc ,100,130,377
  invoke abc ,100,130,378
  invoke abc ,100,130,379
  invoke abc ,100,130,380
   
  invoke abc ,90,110,381
  invoke abc ,90,110,382
  invoke abc ,90,110,383
  invoke abc ,90,110,384
  invoke abc ,90,110,385
  invoke abc ,90,110,386
  invoke abc ,90,110,387
  invoke abc ,90,110,388
  invoke abc ,90,110,389
  invoke abc ,90,110,390

  invoke abc ,120,140,381
  invoke abc ,120,140,382
  invoke abc ,120,140,383
  invoke abc ,120,140,384
  invoke abc ,120,140,385
  invoke abc ,120,140,386
  invoke abc ,120,140,387
  invoke abc ,120,140,388
  invoke abc ,120,140,389
  invoke abc ,120,140,390  

  invoke abc ,80,100,391
  invoke abc ,80,100,392
  invoke abc ,80,100,393
  invoke abc ,80,100,394
  invoke abc ,80,100,395
  invoke abc ,80,100,396
  invoke abc ,80,100,397
  invoke abc ,80,100,398
  invoke abc ,80,100,399
  invoke abc ,80,100,400

  invoke abc ,130,150,391
  invoke abc ,130,150,392
  invoke abc ,130,150,393
  invoke abc ,130,150,394
  invoke abc ,130,150,395
  invoke abc ,130,150,396
  invoke abc ,130,150,397
  invoke abc ,130,150,398
  invoke abc ,130,150,399
  invoke abc ,130,150,400

  invoke abc ,80,100,401
  invoke abc ,80,100,402
  invoke abc ,80,100,403
  invoke abc ,80,100,404
  invoke abc ,80,100,405
  invoke abc ,80,100,406
  invoke abc ,80,100,407
  invoke abc ,80,100,408
  invoke abc ,80,100,409
  invoke abc ,80,100,410

  invoke abc ,130,150,401
  invoke abc ,130,150,402
  invoke abc ,130,150,403
  invoke abc ,130,150,404
  invoke abc ,130,150,405
  invoke abc ,130,150,406
  invoke abc ,130,150,407
  invoke abc ,130,150,408
  invoke abc ,130,150,409
  invoke abc ,130,150,410


  invoke abc ,80,150,411
  invoke abc ,80,150,412
  invoke abc ,80,150,413
  invoke abc ,80,150,414
  invoke abc ,80,150,415
  invoke abc ,80,150,416
  invoke abc ,80,150,417
  invoke abc ,80,150,418
  invoke abc ,80,150,419
  invoke abc ,80,150,420

 
  invoke abc ,80,100,421
  invoke abc ,80,100,422
  invoke abc ,80,100,423
  invoke abc ,80,100,424
  invoke abc ,80,100,425
  invoke abc ,80,100,426
  invoke abc ,80,100,427
  invoke abc ,80,100,428
  invoke abc ,80,100,429
  invoke abc ,80,100,430

  invoke abc ,130,150,421
  invoke abc ,130,150,422
  invoke abc ,130,150,423
  invoke abc ,130,150,424
  invoke abc ,130,150,425
  invoke abc ,130,150,426
  invoke abc ,130,150,427
  invoke abc ,130,150,428
  invoke abc ,130,150,429
  invoke abc ,130,150,430

  invoke abc ,80,100,431
  invoke abc ,80,100,432
  invoke abc ,80,100,433
  invoke abc ,80,100,434
  invoke abc ,80,100,435
  invoke abc ,80,100,436
  invoke abc ,80,100,437
  invoke abc ,80,100,438
  invoke abc ,80,100,439
  invoke abc ,80,100,440

  invoke abc ,130,150,431
  invoke abc ,130,150,432
  invoke abc ,130,150,433
  invoke abc ,130,150,434
  invoke abc ,130,150,435
  invoke abc ,130,150,436
  invoke abc ,130,150,437
  invoke abc ,130,150,438
  invoke abc ,130,150,439
  invoke abc ,130,150,440

M:
  invoke abc ,160,180,371
  invoke abc ,160,180,372
  invoke abc ,160,180,373
  invoke abc ,160,180,374
  invoke abc ,160,180,375
  invoke abc ,160,180,376
  invoke abc ,160,180,377
  invoke abc ,160,180,378
  invoke abc ,160,180,379
  invoke abc ,160,180,380

  invoke abc ,210,230,371
  invoke abc ,210,230,372
  invoke abc ,210,230,373
  invoke abc ,210,230,374
  invoke abc ,210,230,375
  invoke abc ,210,230,376
  invoke abc ,210,230,377
  invoke abc ,210,230,378
  invoke abc ,210,230,379
  invoke abc ,210,230,380

  invoke abc ,160,190,381
  invoke abc ,160,190,382
  invoke abc ,160,190,383
  invoke abc ,160,190,384
  invoke abc ,160,190,385
  invoke abc ,160,190,386
  invoke abc ,160,190,387
  invoke abc ,160,190,388
  invoke abc ,160,190,389
  invoke abc ,160,190,390

  invoke abc ,200,230,381
  invoke abc ,200,230,382
  invoke abc ,200,230,383
  invoke abc ,200,230,384
  invoke abc ,200,230,385
  invoke abc ,200,230,386
  invoke abc ,200,230,387
  invoke abc ,200,230,388
  invoke abc ,200,230,389
  invoke abc ,200,230,390

  invoke abc ,160,230,391
  invoke abc ,160,230,392
  invoke abc ,160,230,393
  invoke abc ,160,230,394
  invoke abc ,160,230,395
  invoke abc ,160,230,396
  invoke abc ,160,230,397
  invoke abc ,160,230,398
  invoke abc ,160,230,399
  invoke abc ,160,230,400

  invoke abc ,160,230,401
  invoke abc ,160,230,402
  invoke abc ,160,230,403
  invoke abc ,160,230,404
  invoke abc ,160,230,405
  invoke abc ,160,230,406
  invoke abc ,160,230,407
  invoke abc ,160,230,408
  invoke abc ,160,230,409
  invoke abc ,160,230,410

  invoke abc ,160,180,411
  invoke abc ,160,180,412
  invoke abc ,160,180,413
  invoke abc ,160,180,414
  invoke abc ,160,180,415
  invoke abc ,160,180,416
  invoke abc ,160,180,417
  invoke abc ,160,180,418
  invoke abc ,160,180,419
  invoke abc ,160,180,420

  invoke abc ,190,200,411
  invoke abc ,190,200,412
  invoke abc ,190,200,413
  invoke abc ,190,200,414
  invoke abc ,190,200,415
  invoke abc ,190,200,416
  invoke abc ,190,200,417
  invoke abc ,190,200,418
  invoke abc ,190,200,419
  invoke abc ,190,200,420

  invoke abc ,210,230,411
  invoke abc ,210,230,412
  invoke abc ,210,230,413
  invoke abc ,210,230,414
  invoke abc ,210,230,415
  invoke abc ,210,230,416
  invoke abc ,210,230,417
  invoke abc ,210,230,418
  invoke abc ,210,230,419
  invoke abc ,210,230,420

  invoke abc ,160,180,421
  invoke abc ,160,180,422
  invoke abc ,160,180,423
  invoke abc ,160,180,424
  invoke abc ,160,180,425
  invoke abc ,160,180,426
  invoke abc ,160,180,427
  invoke abc ,160,180,428
  invoke abc ,160,180,429
  invoke abc ,160,180,430

  invoke abc ,210,230,421
  invoke abc ,210,230,422
  invoke abc ,210,230,423
  invoke abc ,210,230,424
  invoke abc ,210,230,425
  invoke abc ,210,230,426
  invoke abc ,210,230,427
  invoke abc ,210,230,428
  invoke abc ,210,230,429
  invoke abc ,210,230,430


  invoke abc ,160,180,431
  invoke abc ,160,180,432
  invoke abc ,160,180,433
  invoke abc ,160,180,434
  invoke abc ,160,180,435
  invoke abc ,160,180,436
  invoke abc ,160,180,437
  invoke abc ,160,180,438
  invoke abc ,160,180,439
  invoke abc ,160,180,440

  invoke abc ,210,230,431
  invoke abc ,210,230,432
  invoke abc ,210,230,433
  invoke abc ,210,230,434
  invoke abc ,210,230,435
  invoke abc ,210,230,436
  invoke abc ,210,230,437
  invoke abc ,210,230,438
  invoke abc ,210,230,439
  invoke abc ,210,230,440

E1:
  invoke abc ,240,310,371
  invoke abc ,240,310,372
  invoke abc ,240,310,373
  invoke abc ,240,310,374
  invoke abc ,240,310,375
  invoke abc ,240,310,376
  invoke abc ,240,310,377
  invoke abc ,240,310,378
  invoke abc ,240,310,379
  invoke abc ,240,310,380

  invoke abc ,240,260,381
  invoke abc ,240,260,382
  invoke abc ,240,260,383
  invoke abc ,240,260,384
  invoke abc ,240,260,385
  invoke abc ,240,260,386
  invoke abc ,240,260,387
  invoke abc ,240,260,388
  invoke abc ,240,260,389
  invoke abc ,240,260,390

  invoke abc ,240,260,391
  invoke abc ,240,260,392
  invoke abc ,240,260,393
  invoke abc ,240,260,394
  invoke abc ,240,260,395
  invoke abc ,240,260,396
  invoke abc ,240,260,397
  invoke abc ,240,260,398
  invoke abc ,240,260,399
  invoke abc ,240,260,400

  invoke abc ,240,300,401
  invoke abc ,240,300,402
  invoke abc ,240,300,403
  invoke abc ,240,300,404
  invoke abc ,240,300,405
  invoke abc ,240,300,406
  invoke abc ,240,300,407
  invoke abc ,240,300,408
  invoke abc ,240,300,409
  invoke abc ,240,300,410

  invoke abc ,240,260,411
  invoke abc ,240,260,412
  invoke abc ,240,260,413
  invoke abc ,240,260,414
  invoke abc ,240,260,415
  invoke abc ,240,260,416
  invoke abc ,240,260,417
  invoke abc ,240,260,418
  invoke abc ,240,260,419
  invoke abc ,240,260,420

  invoke abc ,240,260,421
  invoke abc ,240,260,422
  invoke abc ,240,260,423
  invoke abc ,240,260,424
  invoke abc ,240,260,425
  invoke abc ,240,260,426
  invoke abc ,240,260,427
  invoke abc ,240,260,428
  invoke abc ,240,260,429
  invoke abc ,240,260,430

  invoke abc ,240,310,431
  invoke abc ,240,310,432
  invoke abc ,240,310,433
  invoke abc ,240,310,434
  invoke abc ,240,310,435
  invoke abc ,240,310,436
  invoke abc ,240,310,437
  invoke abc ,240,310,438
  invoke abc ,240,310,439
  invoke abc ,240,310,440

O:
  invoke abc ,340,390,371
  invoke abc ,340,390,372
  invoke abc ,340,390,373
  invoke abc ,340,390,374
  invoke abc ,340,390,375
  invoke abc ,340,390,376
  invoke abc ,340,390,377
  invoke abc ,340,390,378
  invoke abc ,340,390,379
  invoke abc ,340,390,380

  invoke abc ,330,350,381
  invoke abc ,330,350,382
  invoke abc ,330,350,383
  invoke abc ,330,350,384
  invoke abc ,330,350,385
  invoke abc ,330,350,386
  invoke abc ,330,350,387
  invoke abc ,330,350,388
  invoke abc ,330,350,389
  invoke abc ,330,350,390

  invoke abc ,380,400,381
  invoke abc ,380,400,382
  invoke abc ,380,400,383
  invoke abc ,380,400,384
  invoke abc ,380,400,385
  invoke abc ,380,400,386
  invoke abc ,380,400,387
  invoke abc ,380,400,388
  invoke abc ,380,400,389
  invoke abc ,380,400,390


  invoke abc ,330,350,391
  invoke abc ,330,350,392
  invoke abc ,330,350,393
  invoke abc ,330,350,394
  invoke abc ,330,350,395
  invoke abc ,330,350,396
  invoke abc ,330,350,397
  invoke abc ,330,350,398
  invoke abc ,330,350,399
  invoke abc ,330,350,400

  invoke abc ,380,400,391
  invoke abc ,380,400,392
  invoke abc ,380,400,393
  invoke abc ,380,400,394
  invoke abc ,380,400,395
  invoke abc ,380,400,396
  invoke abc ,380,400,397
  invoke abc ,380,400,398
  invoke abc ,380,400,399
  invoke abc ,380,400,400

  invoke abc ,330,350,401
  invoke abc ,330,350,402
  invoke abc ,330,350,403
  invoke abc ,330,350,404
  invoke abc ,330,350,405
  invoke abc ,330,350,406
  invoke abc ,330,350,407
  invoke abc ,330,350,408
  invoke abc ,330,350,409
  invoke abc ,330,350,410

  invoke abc ,380,400,401
  invoke abc ,380,400,402
  invoke abc ,380,400,403
  invoke abc ,380,400,404
  invoke abc ,380,400,405
  invoke abc ,380,400,406
  invoke abc ,380,400,407
  invoke abc ,380,400,408
  invoke abc ,380,400,409
  invoke abc ,380,400,410

  invoke abc ,330,350,411
  invoke abc ,330,350,412
  invoke abc ,330,350,413
  invoke abc ,330,350,414
  invoke abc ,330,350,415
  invoke abc ,330,350,416
  invoke abc ,330,350,417
  invoke abc ,330,350,418
  invoke abc ,330,350,419
  invoke abc ,330,350,420

  invoke abc ,380,400,411
  invoke abc ,380,400,412
  invoke abc ,380,400,413
  invoke abc ,380,400,414
  invoke abc ,380,400,415
  invoke abc ,380,400,416
  invoke abc ,380,400,417
  invoke abc ,380,400,418
  invoke abc ,380,400,419
  invoke abc ,380,400,420

  invoke abc ,330,350,421
  invoke abc ,330,350,422
  invoke abc ,330,350,423
  invoke abc ,330,350,424
  invoke abc ,330,350,425
  invoke abc ,330,350,426
  invoke abc ,330,350,427
  invoke abc ,330,350,428
  invoke abc ,330,350,429
  invoke abc ,330,350,430

  invoke abc ,380,400,421
  invoke abc ,380,400,422
  invoke abc ,380,400,423
  invoke abc ,380,400,424
  invoke abc ,380,400,425
  invoke abc ,380,400,426
  invoke abc ,380,400,427
  invoke abc ,380,400,428
  invoke abc ,380,400,429
  invoke abc ,380,400,430

  invoke abc ,340,390,431
  invoke abc ,340,390,432
  invoke abc ,340,390,433
  invoke abc ,340,390,434
  invoke abc ,340,390,435
  invoke abc ,340,390,436
  invoke abc ,340,390,437
  invoke abc ,340,390,438
  invoke abc ,340,390,439
  invoke abc ,340,390,440

V:
  invoke abc ,410,430,371
  invoke abc ,410,430,372
  invoke abc ,410,430,373
  invoke abc ,410,430,374
  invoke abc ,410,430,375
  invoke abc ,410,430,376
  invoke abc ,410,430,377
  invoke abc ,410,430,378
  invoke abc ,410,430,379
  invoke abc ,410,430,380

  invoke abc ,460,480,371
  invoke abc ,460,480,372
  invoke abc ,460,480,373
  invoke abc ,460,480,374
  invoke abc ,460,480,375
  invoke abc ,460,480,376
  invoke abc ,460,480,377
  invoke abc ,460,480,378
  invoke abc ,460,480,379
  invoke abc ,460,480,380

  invoke abc ,410,430,381
  invoke abc ,410,430,382
  invoke abc ,410,430,383
  invoke abc ,410,430,384
  invoke abc ,410,430,385
  invoke abc ,410,430,386
  invoke abc ,410,430,387
  invoke abc ,410,430,388
  invoke abc ,410,430,389
  invoke abc ,410,430,390

  invoke abc ,460,480,381
  invoke abc ,460,480,382
  invoke abc ,460,480,383
  invoke abc ,460,480,384
  invoke abc ,460,480,385
  invoke abc ,460,480,386
  invoke abc ,460,480,387
  invoke abc ,460,480,388
  invoke abc ,460,480,389
  invoke abc ,460,480,390

  invoke abc ,410,430,391
  invoke abc ,410,430,392
  invoke abc ,410,430,393
  invoke abc ,410,430,394
  invoke abc ,410,430,395
  invoke abc ,410,430,396
  invoke abc ,410,430,397
  invoke abc ,410,430,398
  invoke abc ,410,430,399
  invoke abc ,410,430,400

  invoke abc ,460,480,391
  invoke abc ,460,480,392
  invoke abc ,460,480,393
  invoke abc ,460,480,394
  invoke abc ,460,480,395
  invoke abc ,460,480,396
  invoke abc ,460,480,397
  invoke abc ,460,480,398
  invoke abc ,460,480,399
  invoke abc ,460,480,400


  invoke abc ,410,440,401
  invoke abc ,410,440,402
  invoke abc ,410,440,403
  invoke abc ,410,440,404
  invoke abc ,410,440,405
  invoke abc ,410,440,406
  invoke abc ,410,440,407
  invoke abc ,410,440,408
  invoke abc ,410,440,409
  invoke abc ,410,440,410

  invoke abc ,450,480,401
  invoke abc ,450,480,402
  invoke abc ,450,480,403
  invoke abc ,450,480,404
  invoke abc ,450,480,405
  invoke abc ,450,480,406
  invoke abc ,450,480,407
  invoke abc ,450,480,408
  invoke abc ,450,480,409
  invoke abc ,450,480,410

  invoke abc ,420,470,411
  invoke abc ,420,470,412
  invoke abc ,420,470,413
  invoke abc ,420,470,414
  invoke abc ,420,470,415
  invoke abc ,420,470,416
  invoke abc ,420,470,417
  invoke abc ,420,470,418
  invoke abc ,420,470,419
  invoke abc ,420,470,420

  invoke abc ,430,460,421
  invoke abc ,430,460,422
  invoke abc ,430,460,423
  invoke abc ,430,460,424
  invoke abc ,430,460,425
  invoke abc ,430,460,426
  invoke abc ,430,460,427
  invoke abc ,430,460,428
  invoke abc ,430,460,429
  invoke abc ,430,460,430


  invoke abc ,440,450,431
  invoke abc ,440,450,432
  invoke abc ,440,450,433
  invoke abc ,440,450,434
  invoke abc ,440,450,435
  invoke abc ,440,450,436
  invoke abc ,440,450,437
  invoke abc ,440,450,438
  invoke abc ,440,450,439
  invoke abc ,440,450,440

E2:
  invoke abc ,490,560,371
  invoke abc ,490,560,372
  invoke abc ,490,560,373
  invoke abc ,490,560,374
  invoke abc ,490,560,375
  invoke abc ,490,560,376
  invoke abc ,490,560,377
  invoke abc ,490,560,378
  invoke abc ,490,560,379
  invoke abc ,490,560,380

  invoke abc ,490,510,381
  invoke abc ,490,510,382
  invoke abc ,490,510,383
  invoke abc ,490,510,384
  invoke abc ,490,510,385
  invoke abc ,490,510,386
  invoke abc ,490,510,387
  invoke abc ,490,510,388
  invoke abc ,490,510,389
  invoke abc ,490,510,390

  invoke abc ,490,510,391
  invoke abc ,490,510,392
  invoke abc ,490,510,393
  invoke abc ,490,510,394
  invoke abc ,490,510,395
  invoke abc ,490,510,396
  invoke abc ,490,510,397
  invoke abc ,490,510,398
  invoke abc ,490,510,399
  invoke abc ,490,510,400

  invoke abc ,490,550,401
  invoke abc ,490,550,402
  invoke abc ,490,550,403
  invoke abc ,490,550,404
  invoke abc ,490,550,405
  invoke abc ,490,550,406
  invoke abc ,490,550,407
  invoke abc ,490,550,408
  invoke abc ,490,550,409
  invoke abc ,490,550,410

  invoke abc ,490,510,411
  invoke abc ,490,510,412
  invoke abc ,490,510,413
  invoke abc ,490,510,414
  invoke abc ,490,510,415
  invoke abc ,490,510,416
  invoke abc ,490,510,417
  invoke abc ,490,510,418
  invoke abc ,490,510,419
  invoke abc ,490,510,420

  invoke abc ,490,510,421
  invoke abc ,490,510,422
  invoke abc ,490,510,423
  invoke abc ,490,510,424
  invoke abc ,490,510,425
  invoke abc ,490,510,426
  invoke abc ,490,510,427
  invoke abc ,490,510,428
  invoke abc ,490,510,429
  invoke abc ,490,510,430

  invoke abc ,490,560,431
  invoke abc ,490,560,432
  invoke abc ,490,560,433
  invoke abc ,490,560,434
  invoke abc ,490,560,435
  invoke abc ,490,560,436
  invoke abc ,490,560,437
  invoke abc ,490,560,438
  invoke abc ,490,560,439
  invoke abc ,490,560,440

R:
  invoke abc ,570,630,371
  invoke abc ,570,630,372
  invoke abc ,570,630,373
  invoke abc ,570,630,374
  invoke abc ,570,630,375
  invoke abc ,570,630,376
  invoke abc ,570,630,377
  invoke abc ,570,630,378
  invoke abc ,570,630,379
  invoke abc ,570,630,380

  invoke abc ,570,590,381
  invoke abc ,570,590,382
  invoke abc ,570,590,383
  invoke abc ,570,590,384
  invoke abc ,570,590,385
  invoke abc ,570,590,386
  invoke abc ,570,590,387
  invoke abc ,570,590,388
  invoke abc ,570,590,389
  invoke abc ,570,590,390

  invoke abc ,620,640,381
  invoke abc ,620,640,382
  invoke abc ,620,640,383
  invoke abc ,620,640,384
  invoke abc ,620,640,385
  invoke abc ,620,640,386
  invoke abc ,620,640,387
  invoke abc ,620,640,388
  invoke abc ,620,640,389
  invoke abc ,620,640,390

  invoke abc ,570,590,391
  invoke abc ,570,590,392
  invoke abc ,570,590,393
  invoke abc ,570,590,394
  invoke abc ,570,590,395
  invoke abc ,570,590,396
  invoke abc ,570,590,397
  invoke abc ,570,590,398
  invoke abc ,570,590,399
  invoke abc ,570,590,400

  invoke abc ,620,640,391
  invoke abc ,620,640,392
  invoke abc ,620,640,393
  invoke abc ,620,640,394
  invoke abc ,620,640,395
  invoke abc ,620,640,396
  invoke abc ,620,640,397
  invoke abc ,620,640,398
  invoke abc ,620,640,399
  invoke abc ,620,640,400

  invoke abc ,570,590,401
  invoke abc ,570,590,402
  invoke abc ,570,590,403
  invoke abc ,570,590,404
  invoke abc ,570,590,405
  invoke abc ,570,590,406
  invoke abc ,570,590,407
  invoke abc ,570,590,408
  invoke abc ,570,590,409
  invoke abc ,570,590,410

  invoke abc ,610,640,401
  invoke abc ,610,640,402
  invoke abc ,610,640,403
  invoke abc ,610,640,404
  invoke abc ,610,640,405
  invoke abc ,610,640,406
  invoke abc ,610,640,407
  invoke abc ,610,640,408
  invoke abc ,610,640,409
  invoke abc ,610,640,410

  invoke abc ,570,620,411
  invoke abc ,570,620,412
  invoke abc ,570,620,413
  invoke abc ,570,620,414
  invoke abc ,570,620,415
  invoke abc ,570,620,416
  invoke abc ,570,620,417
  invoke abc ,570,620,418
  invoke abc ,570,620,419
  invoke abc ,570,620,420

  invoke abc ,570,590,421
  invoke abc ,570,590,422
  invoke abc ,570,590,423
  invoke abc ,570,590,424
  invoke abc ,570,590,425
  invoke abc ,570,590,426
  invoke abc ,570,590,427
  invoke abc ,570,590,428
  invoke abc ,570,590,429
  invoke abc ,570,590,430

  invoke abc ,610,630,421
  invoke abc ,610,630,422
  invoke abc ,610,630,423
  invoke abc ,610,630,424
  invoke abc ,610,630,425
  invoke abc ,610,630,426
  invoke abc ,610,630,427
  invoke abc ,610,630,428
  invoke abc ,610,630,429
  invoke abc ,610,630,430

  invoke abc ,570,590,431
  invoke abc ,570,590,432
  invoke abc ,570,590,433
  invoke abc ,570,590,434
  invoke abc ,570,590,435
  invoke abc ,570,590,436
  invoke abc ,570,590,437
  invoke abc ,570,590,438
  invoke abc ,570,590,439
  invoke abc ,570,590,440

  invoke abc ,620,640,431
  invoke abc ,620,640,432
  invoke abc ,620,640,433
  invoke abc ,620,640,434
  invoke abc ,620,640,435
  invoke abc ,620,640,436
  invoke abc ,620,640,437
  invoke abc ,620,640,438
  invoke abc ,620,640,439
  invoke abc ,620,640,440
  SetCursor 2,10
  SetChar 'D',01h,1
  SetCursor 3,10
  SetChar 'o',02h,1
  SetCursor 5,10
  SetChar 'y',03h,1
  SetCursor 6,10
  SetChar 'o',04h,1
  SetCursor 7,10
  SetChar 'u',05h,1 
  SetCursor 9,10
  SetChar 'w',06h,1 
  SetCursor 10,10
  SetChar 'a',07h,1 
  SetCursor 11,10
  SetChar 'n',08h,1 
  SetCursor 12,10
  SetChar 't',09h,1 
  SetCursor 14,10
  SetChar 't',01h,1 
  SetCursor 15,10
  SetChar 'o',02h,1 
  SetCursor 17,10
  SetChar 'p',0ch,1 
  SetCursor 18,10
  SetChar 'l',0dh,1 
  SetCursor 19,10
  SetChar 'a',01h,1 
  SetCursor 20,10
  SetChar 'y',02h,1 
  SetCursor 2,13
  SetChar 'a',03h,1 
  SetCursor 3,13
  SetChar 'g',04h,1 
  SetCursor 4,13
  SetChar 'a',05h,1 
  SetCursor 5,13
  SetChar 'i',06h,1 
  SetCursor 6,13
  SetChar 'n',07h,1 
  SetCursor 8,13
  SetChar 'y',08h,1 
  SetCursor 8,14
  SetChar '(',09h,1 
  SetCursor 8,15
  SetChar 'y',01h,1 
  SetCursor 8,16
  SetChar 'e',02h,1 
  SetCursor 8,17
  SetChar 's',0ch,1 
  SetCursor 8,18
  SetChar ')',0dh,1 
  SetCursor 10,13
  SetChar 'o',01h,1 
  SetCursor 11,13
  SetChar 'r',02h,1 
  SetCursor 13,13
  SetChar 'n',03h,1 
  SetCursor 13,14
  SetChar '(',04h,1 
  SetCursor 13,15
  SetChar 'n',05h,1 
  SetCursor 13,16
  SetChar 'o',06h,1 
  SetCursor 13,17
  SetChar ')',07h,1 
  SetCursor 15,13
  SetChar '?',08h,1 
ret
Gameoverprnt endp

end