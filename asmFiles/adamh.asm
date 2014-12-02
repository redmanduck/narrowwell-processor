ori   $sp, $zero, 0x80
addiu $5,$zero,2
addiu $6,$zero,3 
push $5
push $6
mult:
  pop     $18
  pop     $17
  lui     $8, 0
  lui     $19, 0
  beq     $17,  $0, mult_done        # skip if operand is 0
mloop:
  beq     $18,  $0, mult_done
  addu    $19, $17, $19
  addiu   $18,  $18, -1              # decrement loop
  j      mloop
mult_done:
  push   $19 #push ans to stk
  halt
