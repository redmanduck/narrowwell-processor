###################
### main program ##
###################

   org     0x0000
   addiu   $sp, $0, 0xFFFC      		#241DFFFC
   addiu   $15, $0, 5                   #240F0005  # operands 
   addiu   $16, $0, 2       			#24100002
   addiu   $13, $0, 10  				#240D000A
   addu    $14, $sp, $0                 #03A07021 # R14 save the sp state 
   addiu   $14, $14, -4 				#25CEFFFC
   push    $15 							#27BDFFFC
   push    $16 							#AFAF0000
   push    $13 							#27BDFFFC
   jal     mult_procedure 				#AFB00000
mult_procedure:
  beq    $14, $sp, end_mult_procedure 	#27BDFFFC
  jal    mult 							#AFAD0000
  j      mult_procedure 				#0C00000D
end_mult_procedure:
  halt 									#11DD0002

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

