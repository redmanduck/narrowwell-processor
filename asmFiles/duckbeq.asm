
  #------------------------------------------------------------------
  # Flying BEQ algorithm
  # author Pat Sabpisal pat@uniduck.co
  #------------------------------------------------------------------

  org 0x0000
  ori   $4, $zero, 0xFACA
  ori   $2, $zero, 0xF0
  ori   $4, $zero, 0xFACA
  ori   $4, $zero, 0xFACA
  beq   $zero, $zero, superend
  sw    $4, 0($2)
  superend:
  sw    $4, 4($2)
  halt
