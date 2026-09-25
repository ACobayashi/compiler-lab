.option nopic
.attribute stack_align,16
.text

.globl sum_even
.type sum_even,@function
sum_even:
#初始化
    li t0,0
    li t1,0
.Lse_loop:
    bge t0,a1,.Lse_end
    slli t2,t0,2
    add t3,a0,t2
    lw t4,0(t3)
#判断偶数
    li t5,2
    remw t6,t4,t5
    bnez t6,.Lse_next
    addw t1,t1,t4
.Lse_next:
    addi t0,t0,1
    j .Lse_loop
.Lse_end:
    mv a0,t1
    ret
.size sum_even,.-sum_even

.globl count_pos
.type count_pos,@function
count_pos:
#初始化
    li t0,0
    li t1,0
.Lcp_loop:
    bge t0,a1,.Lcp_end
    slli t2,t0,2
    add t3,a0,t2
    lw t4,0(t3)
#统计正数
    blez t4,.Lcp_next
    addiw t1,t1,1
.Lcp_next:
    addi t0,t0,1
    j .Lcp_loop
.Lcp_end:
    mv a0,t1
    ret
.size count_pos,.-count_pos

.globl main
.type main,@function
main:
#开辟栈空间
    addi sp,sp,-80
    sd ra,72(sp)
    sd s0,64(sp)
    sd s1,56(sp)
    sd s2,48(sp)

    mv s2,sp

#输入n
    call getint
    mv s0,a0
    li s1,0

#输入数组
.Linput:
    bge s1,s0,.Linput_end
    call getint
    slli t0,s1,2
    add t0,s2,t0
    sw a0,0(t0)
    addi s1,s1,1
    j .Linput

.Linput_end:
#求偶数和
    mv a0,s2
    mv a1,s0
    call sum_even
    call putint
    li a0,10
    call putch

#统计正数
    mv a0,s2
    mv a1,s0
    call count_pos
    call putint
    li a0,10
    call putch

    li a0,0
    ld s2,48(sp)
    ld s1,56(sp)
    ld s0,64(sp)
    ld ra,72(sp)
    addi sp,sp,80
    ret
.size main,.-main