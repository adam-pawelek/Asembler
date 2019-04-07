; program Dodawanie

; jak dodać do siebie dwie liczby całkowite o wartościach znanych 
; w trakcie pisania programu ?

; można je umieścić w obszarze kodu, po dyrektywie .text jako argumenty ADDI
; albo w obszarze deklaracji danych, po dyrektywie .data jako argumenty LOAD a potem ADD
; albo jedną w obszarze kodu a drugą w obszarze danych

.data
tablica: .word 0,1,2,3,4,5,6,7,8,9
.text

; pierwszy argument (ładowany bezpośrednio do rejestru) ma wartość 12, drugi 8, suma ma trafić do r17
; przygotowanie argumentów do dodawania w rejestrach r15 i r16,wykorzystując instrukcję addi i rejestr r0 

addi   r15, r0, #12
addi   r16, r0, #8
add    r17, r15, r16


; można też oczywiście załadować do rejestru GPR pierwszy argument, a drugi dodać w trybie natychmiastowym (ang. immediate)
; do obu tych zadań wykorzystamy instrukcję addi:
; w pierwszym wypadku jako zamiennik nieistniejącej instrukcji
; "ładuj argument natychmiastowy"
; a drugim jako "zwykłą" instrukcję "dodaj argument natychmiastowy do rejestru"
; wynik ma trafić do r12
addi   r11, r0, #12
addi   r12, r11, #8


; teraz przygotowanie do dodawania zawartości elementów zadeklarowanej tablicy

; adresy argumentów zostają przygotowane 
; w rejestrach pomocniczych r10 i r20
addi r10, r0, tablica+4
addi r20, r0, tablica+16


; dodawanie zawartości komórek pamięci operacyjnej nie jest możliwe bezpośrednio, 
; ale wymaga wcześniejszego przesłania argumentów do rejestrów - architektura load/store
; wynik do r3

lw r1, 0(r10)
lw r2, 0(r20)
add r3, r1, r2

; to samo, ale z bezpośrednim wskazaniem elementów
; wynik do r6
lw r4, tablica+4(r0)
lw r5, tablica+16(r0)
add r6, r4, r5

trap 0 ; Koniec programu

