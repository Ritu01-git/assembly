sum: .word 4       # use reg for i
a:   .word 1,3,5,7,9
                        
li   $t0, 0   # i = 0
   li   $t1, 0   # sum = 0
   li   $t2, 4   # max index
for: bgt  $t0, $t2, end_for
   move $t3,$t0
   mul  $t3,$t3,4
   add  $t1,$t1,a($t3)
 addi $t0,$t0,1   # i++
 j    for
  end_for:sw $t1, sum
  move $a0,$t1 
   li   $v0,1
  syscall       #printf