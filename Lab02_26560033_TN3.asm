.data
name:   .asciiz "an"
score:  .word 85
sep:    .asciiz ": "
nl:     .asciiz "\n"

.text
.globl main
main:
    la   $s0, name
    lb   $t0, 0($s0)         # read one byte: 'a' = 0x61
    addi $t0, $t0, -32       # capital letter: 'A' = 0x41
    sb   $t0, 0($s0)         # write one byte back

    li   $v0, 4              # print the name (stops at the 0 byte)
    add  $a0, $s0, $zero
    syscall
    li   $v0, 4
    la   $a0, sep
    syscall

    la   $s1, score
    lw   $t1, 0($s1)         # the score is a whole word
    li   $v0, 1
    add  $a0, $t1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 10
    syscall