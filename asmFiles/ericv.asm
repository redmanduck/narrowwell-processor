
  org 0x0000

  ori   $1, $1, 0xF0
  ori   $2, $zero, 1
  ori   $15, $0, 5

loop:
 # nop
  sw    $15, 8 ($1)
  subu  $15, $15, $2
  bne   $15, $zero, loop
end:
  halt

  org 0x80
