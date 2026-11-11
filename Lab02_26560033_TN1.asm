.data
varB: .word 25
varC: .word 17
varA: .word 0
msg:  .asciiz "varA = varB + varC = "
nl:   .asciiz "\n"
.text
.globl main
main:
    la   $s0, varB          # label -> address: $s0 = 0x10010000
    lw   $t1, 0($s0)        # load varB (offset 0)  -> $t1 = 25
    lw   $t2, 4($s0)        # load varC (offset 4)  -> $t2 = 17
    add  $t3, $t1, $t2      # the processor calculates only with registers
    sw   $t3, 8($s0)        # store the result in varA (offset 8)
    lw   $t4, 8($s0)
    li   $v0, 4
    la   $a0, msg
    syscall
    li   $v0, 1
    add  $a0, $t4, $zero    # print the value that was read back
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    li   $v0, 10
    syscall