###################
### main program ##
###################

   org     0x0000
   addiu   $sp, $0, 0xFFFC
   addiu   $15, $0, 5                # operands
   addiu   $16, $0, 2
   addiu   $13, $0, 10
   addu    $14, $sp, $0           # R14 save the sp state
   addiu   $14, $14, -4
   push    $15
   push    $16
   push    $13
   jal    mult_procedure
mult_procedure:
  beq    $14, $sp, end_mult_procedure
  jal    mult
  j      mult_procedure
end_mult_procedure:
  halt

###################################
######## Multiply routine #########
###################################

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
  jr     $31 #return to caller

