
output/main_O0:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 5a 2f 00 00    	push   0x2f5a(%rip)        # 3f80 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 5b 2f 00 00 	bnd jmp *0x2f5b(%rip)        # 3f88 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	push   $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	push   $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	push   $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	push   $0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmp 1020 <_init+0x20>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 06 00 00 00       	push   $0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmp 1020 <_init+0x20>
    109f:	90                   	nop

Disassembly of section .plt.got:

00000000000010a0 <__cxa_finalize@plt>:
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	f2 ff 25 1d 2f 00 00 	bnd jmp *0x2f1d(%rip)        # 3fc8 <__cxa_finalize@GLIBC_2.2.5>
    10ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

00000000000010b0 <_ZNSolsEx@plt>:
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	f2 ff 25 d5 2e 00 00 	bnd jmp *0x2ed5(%rip)        # 3f90 <_ZNSolsEx@GLIBCXX_3.4>
    10bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010c0 <_ZNSirsERi@plt>:
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	f2 ff 25 cd 2e 00 00 	bnd jmp *0x2ecd(%rip)        # 3f98 <_ZNSirsERi@GLIBCXX_3.4>
    10cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010d0 <__cxa_atexit@plt>:
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	f2 ff 25 c5 2e 00 00 	bnd jmp *0x2ec5(%rip)        # 3fa0 <__cxa_atexit@GLIBC_2.2.5>
    10db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010e0 <_ZNSolsEPFRSoS_E@plt>:
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	f2 ff 25 bd 2e 00 00 	bnd jmp *0x2ebd(%rip)        # 3fa8 <_ZNSolsEPFRSoS_E@GLIBCXX_3.4>
    10eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010f0 <__stack_chk_fail@plt>:
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	f2 ff 25 b5 2e 00 00 	bnd jmp *0x2eb5(%rip)        # 3fb0 <__stack_chk_fail@GLIBC_2.4>
    10fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001100 <_ZNSt8ios_base4InitC1Ev@plt>:
    1100:	f3 0f 1e fa          	endbr64 
    1104:	f2 ff 25 ad 2e 00 00 	bnd jmp *0x2ead(%rip)        # 3fb8 <_ZNSt8ios_base4InitC1Ev@GLIBCXX_3.4>
    110b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001110 <_ZNSolsEi@plt>:
    1110:	f3 0f 1e fa          	endbr64 
    1114:	f2 ff 25 a5 2e 00 00 	bnd jmp *0x2ea5(%rip)        # 3fc0 <_ZNSolsEi@GLIBCXX_3.4>
    111b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001120 <_start>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	31 ed                	xor    %ebp,%ebp
    1126:	49 89 d1             	mov    %rdx,%r9
    1129:	5e                   	pop    %rsi
    112a:	48 89 e2             	mov    %rsp,%rdx
    112d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1131:	50                   	push   %rax
    1132:	54                   	push   %rsp
    1133:	45 31 c0             	xor    %r8d,%r8d
    1136:	31 c9                	xor    %ecx,%ecx
    1138:	48 8d 3d 18 01 00 00 	lea    0x118(%rip),%rdi        # 1257 <main>
    113f:	ff 15 93 2e 00 00    	call   *0x2e93(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1145:	f4                   	hlt    
    1146:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    114d:	00 00 00 

0000000000001150 <deregister_tm_clones>:
    1150:	48 8d 3d b9 2e 00 00 	lea    0x2eb9(%rip),%rdi        # 4010 <__TMC_END__>
    1157:	48 8d 05 b2 2e 00 00 	lea    0x2eb2(%rip),%rax        # 4010 <__TMC_END__>
    115e:	48 39 f8             	cmp    %rdi,%rax
    1161:	74 15                	je     1178 <deregister_tm_clones+0x28>
    1163:	48 8b 05 76 2e 00 00 	mov    0x2e76(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    116a:	48 85 c0             	test   %rax,%rax
    116d:	74 09                	je     1178 <deregister_tm_clones+0x28>
    116f:	ff e0                	jmp    *%rax
    1171:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1178:	c3                   	ret    
    1179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001180 <register_tm_clones>:
    1180:	48 8d 3d 89 2e 00 00 	lea    0x2e89(%rip),%rdi        # 4010 <__TMC_END__>
    1187:	48 8d 35 82 2e 00 00 	lea    0x2e82(%rip),%rsi        # 4010 <__TMC_END__>
    118e:	48 29 fe             	sub    %rdi,%rsi
    1191:	48 89 f0             	mov    %rsi,%rax
    1194:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1198:	48 c1 f8 03          	sar    $0x3,%rax
    119c:	48 01 c6             	add    %rax,%rsi
    119f:	48 d1 fe             	sar    %rsi
    11a2:	74 14                	je     11b8 <register_tm_clones+0x38>
    11a4:	48 8b 05 45 2e 00 00 	mov    0x2e45(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    11ab:	48 85 c0             	test   %rax,%rax
    11ae:	74 08                	je     11b8 <register_tm_clones+0x38>
    11b0:	ff e0                	jmp    *%rax
    11b2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    11b8:	c3                   	ret    
    11b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011c0 <__do_global_dtors_aux>:
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	80 3d ad 30 00 00 00 	cmpb   $0x0,0x30ad(%rip)        # 4278 <completed.0>
    11cb:	75 2b                	jne    11f8 <__do_global_dtors_aux+0x38>
    11cd:	55                   	push   %rbp
    11ce:	48 83 3d f2 2d 00 00 	cmpq   $0x0,0x2df2(%rip)        # 3fc8 <__cxa_finalize@GLIBC_2.2.5>
    11d5:	00 
    11d6:	48 89 e5             	mov    %rsp,%rbp
    11d9:	74 0c                	je     11e7 <__do_global_dtors_aux+0x27>
    11db:	48 8b 3d 26 2e 00 00 	mov    0x2e26(%rip),%rdi        # 4008 <__dso_handle>
    11e2:	e8 b9 fe ff ff       	call   10a0 <__cxa_finalize@plt>
    11e7:	e8 64 ff ff ff       	call   1150 <deregister_tm_clones>
    11ec:	c6 05 85 30 00 00 01 	movb   $0x1,0x3085(%rip)        # 4278 <completed.0>
    11f3:	5d                   	pop    %rbp
    11f4:	c3                   	ret    
    11f5:	0f 1f 00             	nopl   (%rax)
    11f8:	c3                   	ret    
    11f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001200 <frame_dummy>:
    1200:	f3 0f 1e fa          	endbr64 
    1204:	e9 77 ff ff ff       	jmp    1180 <register_tm_clones>

0000000000001209 <_Z9factoriali>:
    1209:	f3 0f 1e fa          	endbr64 
    120d:	55                   	push   %rbp
    120e:	48 89 e5             	mov    %rsp,%rbp
    1211:	89 7d ec             	mov    %edi,-0x14(%rbp)
    1214:	48 c7 45 f8 01 00 00 	movq   $0x1,-0x8(%rbp)
    121b:	00 
    121c:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%rbp)
    1223:	eb 15                	jmp    123a <_Z9factoriali+0x31>
    1225:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1228:	48 98                	cltq   
    122a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    122e:	48 0f af c2          	imul   %rdx,%rax
    1232:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1236:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    123a:	8b 45 f4             	mov    -0xc(%rbp),%eax
    123d:	3b 45 ec             	cmp    -0x14(%rbp),%eax
    1240:	7e e3                	jle    1225 <_Z9factoriali+0x1c>
    1242:	8b 05 34 30 00 00    	mov    0x3034(%rip),%eax        # 427c <times>
    1248:	83 c0 01             	add    $0x1,%eax
    124b:	89 05 2b 30 00 00    	mov    %eax,0x302b(%rip)        # 427c <times>
    1251:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1255:	5d                   	pop    %rbp
    1256:	c3                   	ret    

0000000000001257 <main>:
    1257:	f3 0f 1e fa          	endbr64 
    125b:	55                   	push   %rbp
    125c:	48 89 e5             	mov    %rsp,%rbp
    125f:	48 83 ec 10          	sub    $0x10,%rsp
    1263:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    126a:	00 00 
    126c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1270:	31 c0                	xor    %eax,%eax
    1272:	48 8d 45 f4          	lea    -0xc(%rbp),%rax
    1276:	48 89 c6             	mov    %rax,%rsi
    1279:	48 8d 05 e0 2e 00 00 	lea    0x2ee0(%rip),%rax        # 4160 <_ZSt3cin@GLIBCXX_3.4>
    1280:	48 89 c7             	mov    %rax,%rdi
    1283:	e8 38 fe ff ff       	call   10c0 <_ZNSirsERi@plt>
    1288:	8b 45 f4             	mov    -0xc(%rbp),%eax
    128b:	85 c0                	test   %eax,%eax
    128d:	78 08                	js     1297 <main+0x40>
    128f:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1292:	83 f8 14             	cmp    $0x14,%eax
    1295:	7e 07                	jle    129e <main+0x47>
    1297:	b8 00 00 00 00       	mov    $0x0,%eax
    129c:	eb 5c                	jmp    12fa <main+0xa3>
    129e:	8b 45 f4             	mov    -0xc(%rbp),%eax
    12a1:	89 c7                	mov    %eax,%edi
    12a3:	e8 61 ff ff ff       	call   1209 <_Z9factoriali>
    12a8:	48 89 c6             	mov    %rax,%rsi
    12ab:	48 8d 05 8e 2d 00 00 	lea    0x2d8e(%rip),%rax        # 4040 <_ZSt4cout@GLIBCXX_3.4>
    12b2:	48 89 c7             	mov    %rax,%rdi
    12b5:	e8 f6 fd ff ff       	call   10b0 <_ZNSolsEx@plt>
    12ba:	48 8b 15 0f 2d 00 00 	mov    0x2d0f(%rip),%rdx        # 3fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    12c1:	48 89 d6             	mov    %rdx,%rsi
    12c4:	48 89 c7             	mov    %rax,%rdi
    12c7:	e8 14 fe ff ff       	call   10e0 <_ZNSolsEPFRSoS_E@plt>
    12cc:	8b 05 aa 2f 00 00    	mov    0x2faa(%rip),%eax        # 427c <times>
    12d2:	89 c6                	mov    %eax,%esi
    12d4:	48 8d 05 65 2d 00 00 	lea    0x2d65(%rip),%rax        # 4040 <_ZSt4cout@GLIBCXX_3.4>
    12db:	48 89 c7             	mov    %rax,%rdi
    12de:	e8 2d fe ff ff       	call   1110 <_ZNSolsEi@plt>
    12e3:	48 8b 15 e6 2c 00 00 	mov    0x2ce6(%rip),%rdx        # 3fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    12ea:	48 89 d6             	mov    %rdx,%rsi
    12ed:	48 89 c7             	mov    %rax,%rdi
    12f0:	e8 eb fd ff ff       	call   10e0 <_ZNSolsEPFRSoS_E@plt>
    12f5:	b8 00 00 00 00       	mov    $0x0,%eax
    12fa:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    12fe:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
    1305:	00 00 
    1307:	74 05                	je     130e <main+0xb7>
    1309:	e8 e2 fd ff ff       	call   10f0 <__stack_chk_fail@plt>
    130e:	c9                   	leave  
    130f:	c3                   	ret    

0000000000001310 <_Z41__static_initialization_and_destruction_0ii>:
    1310:	f3 0f 1e fa          	endbr64 
    1314:	55                   	push   %rbp
    1315:	48 89 e5             	mov    %rsp,%rbp
    1318:	48 83 ec 10          	sub    $0x10,%rsp
    131c:	89 7d fc             	mov    %edi,-0x4(%rbp)
    131f:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1322:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
    1326:	75 3b                	jne    1363 <_Z41__static_initialization_and_destruction_0ii+0x53>
    1328:	81 7d f8 ff ff 00 00 	cmpl   $0xffff,-0x8(%rbp)
    132f:	75 32                	jne    1363 <_Z41__static_initialization_and_destruction_0ii+0x53>
    1331:	48 8d 05 48 2f 00 00 	lea    0x2f48(%rip),%rax        # 4280 <_ZStL8__ioinit>
    1338:	48 89 c7             	mov    %rax,%rdi
    133b:	e8 c0 fd ff ff       	call   1100 <_ZNSt8ios_base4InitC1Ev@plt>
    1340:	48 8d 05 c1 2c 00 00 	lea    0x2cc1(%rip),%rax        # 4008 <__dso_handle>
    1347:	48 89 c2             	mov    %rax,%rdx
    134a:	48 8d 05 2f 2f 00 00 	lea    0x2f2f(%rip),%rax        # 4280 <_ZStL8__ioinit>
    1351:	48 89 c6             	mov    %rax,%rsi
    1354:	48 8b 05 9d 2c 00 00 	mov    0x2c9d(%rip),%rax        # 3ff8 <_ZNSt8ios_base4InitD1Ev@GLIBCXX_3.4>
    135b:	48 89 c7             	mov    %rax,%rdi
    135e:	e8 6d fd ff ff       	call   10d0 <__cxa_atexit@plt>
    1363:	90                   	nop
    1364:	c9                   	leave  
    1365:	c3                   	ret    

0000000000001366 <_GLOBAL__sub_I_times>:
    1366:	f3 0f 1e fa          	endbr64 
    136a:	55                   	push   %rbp
    136b:	48 89 e5             	mov    %rsp,%rbp
    136e:	be ff ff 00 00       	mov    $0xffff,%esi
    1373:	bf 01 00 00 00       	mov    $0x1,%edi
    1378:	e8 93 ff ff ff       	call   1310 <_Z41__static_initialization_and_destruction_0ii>
    137d:	5d                   	pop    %rbp
    137e:	c3                   	ret    

Disassembly of section .fini:

0000000000001380 <_fini>:
    1380:	f3 0f 1e fa          	endbr64 
    1384:	48 83 ec 08          	sub    $0x8,%rsp
    1388:	48 83 c4 08          	add    $0x8,%rsp
    138c:	c3                   	ret    
