
output/main_O0.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <_Z9factoriali>:
   0:	f3 0f 1e fa          	endbr64 
   4:	55                   	push   %rbp
   5:	48 89 e5             	mov    %rsp,%rbp
   8:	89 7d ec             	mov    %edi,-0x14(%rbp)
   b:	48 c7 45 f8 01 00 00 	movq   $0x1,-0x8(%rbp)
  12:	00 
  13:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%rbp)
  1a:	eb 15                	jmp    31 <_Z9factoriali+0x31>
  1c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  1f:	48 98                	cltq   
  21:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  25:	48 0f af c2          	imul   %rdx,%rax
  29:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  2d:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  31:	8b 45 f4             	mov    -0xc(%rbp),%eax
  34:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  37:	7e e3                	jle    1c <_Z9factoriali+0x1c>
  39:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 3f <_Z9factoriali+0x3f>
  3f:	83 c0 01             	add    $0x1,%eax
  42:	89 05 00 00 00 00    	mov    %eax,0x0(%rip)        # 48 <_Z9factoriali+0x48>
  48:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4c:	5d                   	pop    %rbp
  4d:	c3                   	ret    

000000000000004e <main>:
  4e:	f3 0f 1e fa          	endbr64 
  52:	55                   	push   %rbp
  53:	48 89 e5             	mov    %rsp,%rbp
  56:	48 83 ec 10          	sub    $0x10,%rsp
  5a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  61:	00 00 
  63:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  67:	31 c0                	xor    %eax,%eax
  69:	48 8d 45 f4          	lea    -0xc(%rbp),%rax
  6d:	48 89 c6             	mov    %rax,%rsi
  70:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 77 <main+0x29>
  77:	48 89 c7             	mov    %rax,%rdi
  7a:	e8 00 00 00 00       	call   7f <main+0x31>
  7f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  82:	85 c0                	test   %eax,%eax
  84:	78 08                	js     8e <main+0x40>
  86:	8b 45 f4             	mov    -0xc(%rbp),%eax
  89:	83 f8 14             	cmp    $0x14,%eax
  8c:	7e 07                	jle    95 <main+0x47>
  8e:	b8 00 00 00 00       	mov    $0x0,%eax
  93:	eb 5c                	jmp    f1 <main+0xa3>
  95:	8b 45 f4             	mov    -0xc(%rbp),%eax
  98:	89 c7                	mov    %eax,%edi
  9a:	e8 00 00 00 00       	call   9f <main+0x51>
  9f:	48 89 c6             	mov    %rax,%rsi
  a2:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # a9 <main+0x5b>
  a9:	48 89 c7             	mov    %rax,%rdi
  ac:	e8 00 00 00 00       	call   b1 <main+0x63>
  b1:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # b8 <main+0x6a>
  b8:	48 89 d6             	mov    %rdx,%rsi
  bb:	48 89 c7             	mov    %rax,%rdi
  be:	e8 00 00 00 00       	call   c3 <main+0x75>
  c3:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # c9 <main+0x7b>
  c9:	89 c6                	mov    %eax,%esi
  cb:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # d2 <main+0x84>
  d2:	48 89 c7             	mov    %rax,%rdi
  d5:	e8 00 00 00 00       	call   da <main+0x8c>
  da:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # e1 <main+0x93>
  e1:	48 89 d6             	mov    %rdx,%rsi
  e4:	48 89 c7             	mov    %rax,%rdi
  e7:	e8 00 00 00 00       	call   ec <main+0x9e>
  ec:	b8 00 00 00 00       	mov    $0x0,%eax
  f1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  f5:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
  fc:	00 00 
  fe:	74 05                	je     105 <main+0xb7>
 100:	e8 00 00 00 00       	call   105 <main+0xb7>
 105:	c9                   	leave  
 106:	c3                   	ret    

0000000000000107 <_Z41__static_initialization_and_destruction_0ii>:
 107:	f3 0f 1e fa          	endbr64 
 10b:	55                   	push   %rbp
 10c:	48 89 e5             	mov    %rsp,%rbp
 10f:	48 83 ec 10          	sub    $0x10,%rsp
 113:	89 7d fc             	mov    %edi,-0x4(%rbp)
 116:	89 75 f8             	mov    %esi,-0x8(%rbp)
 119:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
 11d:	75 3b                	jne    15a <_Z41__static_initialization_and_destruction_0ii+0x53>
 11f:	81 7d f8 ff ff 00 00 	cmpl   $0xffff,-0x8(%rbp)
 126:	75 32                	jne    15a <_Z41__static_initialization_and_destruction_0ii+0x53>
 128:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 12f <_Z41__static_initialization_and_destruction_0ii+0x28>
 12f:	48 89 c7             	mov    %rax,%rdi
 132:	e8 00 00 00 00       	call   137 <_Z41__static_initialization_and_destruction_0ii+0x30>
 137:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 13e <_Z41__static_initialization_and_destruction_0ii+0x37>
 13e:	48 89 c2             	mov    %rax,%rdx
 141:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 148 <_Z41__static_initialization_and_destruction_0ii+0x41>
 148:	48 89 c6             	mov    %rax,%rsi
 14b:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 152 <_Z41__static_initialization_and_destruction_0ii+0x4b>
 152:	48 89 c7             	mov    %rax,%rdi
 155:	e8 00 00 00 00       	call   15a <_Z41__static_initialization_and_destruction_0ii+0x53>
 15a:	90                   	nop
 15b:	c9                   	leave  
 15c:	c3                   	ret    

000000000000015d <_GLOBAL__sub_I_times>:
 15d:	f3 0f 1e fa          	endbr64 
 161:	55                   	push   %rbp
 162:	48 89 e5             	mov    %rsp,%rbp
 165:	be ff ff 00 00       	mov    $0xffff,%esi
 16a:	bf 01 00 00 00       	mov    $0x1,%edi
 16f:	e8 93 ff ff ff       	call   107 <_Z41__static_initialization_and_destruction_0ii>
 174:	5d                   	pop    %rbp
 175:	c3                   	ret    
