#--------------------------------------
# Test branch and jumps
#--------------------------------------
  org 0x0000
  ori   $1, $zero, 0xBA5C
  ori   $2, $zero, 0x0080
  ori   $15, $zero, jmpR


  beq   $zero, $zero, braZ
  sw    $1, 0($2)
  halt
braZ:
#  jal   braR
  sw    $1, 4($2)
  halt
end:
  sw    $22, 16($2)
  HALT
braR:
  or    $3, $zero, $22
  sw    $22, 8($2)
  jal   jmpR
  sw    $1, 12($2)
jmpR:
  bne   $22, $3, end
  halt
