.data
scores: .word 40, 55, 70, 85, 100
tot:    .asciiz "Total: "
nl:     .asciiz "\n"
.text
.globl main
main:
    la   $s0, scores         # $s0 = address of scores[0]
    lw   $t0, 0($s0)         # $t0 = scores[0] = 40
    lw   $t1, 16($s0)        # $t1 = scores[4] = 100
    sw   $t1, 0($s0)         # scores[0] = 100
    sw   $t0, 16($s0)        # scores[4] = 40
    addi $s1, $zero, 3       # k = 3
    addi $t0, $zero, 46      # V = 46
    sll  $t1, $s1, 2         # $t1 = 4 * k
    add  $t1, $t1, $s0       # $t1 = address of scores[k]
    sw   $t0, 0($t1)         # scores[k] = V
    lw   $t2, 0($s0)
    add  $s3, $zero, $t2     # total = scores[0]
    lw   $t2, 4($s0)
    add  $s3, $s3, $t2
    lw   $t2, 8($s0)
    add  $s3, $s3, $t2
    lw   $t2, 12($s0)
    add  $s3, $s3, $t2
    lw   $t2, 16($s0)
    add  $s3, $s3, $t2
    li   $v0, 4
    la   $a0, tot
    syscall
    li   $v0, 1
    add  $a0, $s3, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    li   $v0, 10
    syscall