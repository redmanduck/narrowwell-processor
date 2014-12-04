org 0x0000
addiu $5, $0, 0x300 # Initialize stack pointer to address 0xFFFC
addiu $6, $0, 0xdead
sw    $6, 0($5)
sw    $6, 4($5)
sw    $6, 8($5)
sw    $6, 12($5)
sw    $6, 16($5)
sw    $6, 20($5)
addiu $6, $0, 0xbeef
sw    $6, 0($5)
sw    $6, 4($5)
sw    $6, 8($5)
sw    $6, 12($5)
sw    $6, 16($5)
sw    $6, 20($5)
addiu $6, $0, 0xb00b
sw    $6, 20($5)
sw    $6, 16($5)
sw    $6, 12($5)
addiu $6, $0, 0xface
sw    $6, 0($5)
sw    $6, 4($5)
sw    $6, 4($5)

halt
