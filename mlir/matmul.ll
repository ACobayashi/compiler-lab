; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare i8* @malloc(i64)

declare void @free(i8*)

define void @matmul(float* %0, float* %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, float* %7, float* %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, float* %14, float* %15, i64 %16, i64 %17, i64 %18, i64 %19, i64 %20) !dbg !3 {
  %22 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } undef, float* %0, 0, !dbg !7
  %23 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %22, float* %1, 1, !dbg !9
  %24 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %23, i64 %2, 2, !dbg !10
  %25 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %24, i64 %3, 3, 0, !dbg !11
  %26 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %25, i64 %5, 4, 0, !dbg !12
  %27 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %26, i64 %4, 3, 1, !dbg !13
  %28 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %27, i64 %6, 4, 1, !dbg !14
  %29 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } undef, float* %7, 0, !dbg !15
  %30 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %29, float* %8, 1, !dbg !16
  %31 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %30, i64 %9, 2, !dbg !17
  %32 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %31, i64 %10, 3, 0, !dbg !18
  %33 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %32, i64 %12, 4, 0, !dbg !19
  %34 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %33, i64 %11, 3, 1, !dbg !20
  %35 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %34, i64 %13, 4, 1, !dbg !21
  %36 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } undef, float* %14, 0, !dbg !22
  %37 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %36, float* %15, 1, !dbg !23
  %38 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %37, i64 %16, 2, !dbg !24
  %39 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %38, i64 %17, 3, 0, !dbg !25
  %40 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %39, i64 %19, 4, 0, !dbg !26
  %41 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %40, i64 %18, 3, 1, !dbg !27
  %42 = insertvalue { float*, float*, i64, [2 x i64], [2 x i64] } %41, i64 %20, 4, 1, !dbg !28
  br label %43, !dbg !29

43:                                               ; preds = %79, %21
  %44 = phi i64 [ %80, %79 ], [ 0, %21 ]
  %45 = icmp slt i64 %44, 2, !dbg !30
  br i1 %45, label %46, label %81, !dbg !31

46:                                               ; preds = %43
  br label %47, !dbg !32

47:                                               ; preds = %77, %46
  %48 = phi i64 [ %78, %77 ], [ 0, %46 ]
  %49 = icmp slt i64 %48, 3, !dbg !33
  br i1 %49, label %50, label %79, !dbg !34

50:                                               ; preds = %47
  br label %51, !dbg !35

51:                                               ; preds = %54, %50
  %52 = phi i64 [ %76, %54 ], [ 0, %50 ]
  %53 = icmp slt i64 %52, 4, !dbg !36
  br i1 %53, label %54, label %77, !dbg !37

54:                                               ; preds = %51
  %55 = extractvalue { float*, float*, i64, [2 x i64], [2 x i64] } %28, 1, !dbg !38
  %56 = mul i64 %44, 4, !dbg !39
  %57 = add i64 %56, %52, !dbg !40
  %58 = getelementptr float, float* %55, i64 %57, !dbg !41
  %59 = load float, float* %58, align 4, !dbg !42
  %60 = extractvalue { float*, float*, i64, [2 x i64], [2 x i64] } %35, 1, !dbg !43
  %61 = mul i64 %52, 3, !dbg !44
  %62 = add i64 %61, %48, !dbg !45
  %63 = getelementptr float, float* %60, i64 %62, !dbg !46
  %64 = load float, float* %63, align 4, !dbg !47
  %65 = extractvalue { float*, float*, i64, [2 x i64], [2 x i64] } %42, 1, !dbg !48
  %66 = mul i64 %44, 3, !dbg !49
  %67 = add i64 %66, %48, !dbg !50
  %68 = getelementptr float, float* %65, i64 %67, !dbg !51
  %69 = load float, float* %68, align 4, !dbg !52
  %70 = fmul float %59, %64, !dbg !53
  %71 = fadd float %69, %70, !dbg !54
  %72 = extractvalue { float*, float*, i64, [2 x i64], [2 x i64] } %42, 1, !dbg !55
  %73 = mul i64 %44, 3, !dbg !56
  %74 = add i64 %73, %48, !dbg !57
  %75 = getelementptr float, float* %72, i64 %74, !dbg !58
  store float %71, float* %75, align 4, !dbg !59
  %76 = add i64 %52, 1, !dbg !60
  br label %51, !dbg !61

77:                                               ; preds = %51
  %78 = add i64 %48, 1, !dbg !62
  br label %47, !dbg !63

79:                                               ; preds = %47
  %80 = add i64 %44, 1, !dbg !64
  br label %43, !dbg !65

81:                                               ; preds = %43
  ret void, !dbg !66
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "matmul", linkageName: "matmul", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "matmul_llvm.mlir", directory: "/mnt/d/compilerLab/mlir")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 4, column: 10, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 5, column: 10, scope: !8)
!10 = !DILocation(line: 6, column: 10, scope: !8)
!11 = !DILocation(line: 7, column: 10, scope: !8)
!12 = !DILocation(line: 8, column: 10, scope: !8)
!13 = !DILocation(line: 9, column: 10, scope: !8)
!14 = !DILocation(line: 10, column: 10, scope: !8)
!15 = !DILocation(line: 12, column: 10, scope: !8)
!16 = !DILocation(line: 13, column: 11, scope: !8)
!17 = !DILocation(line: 14, column: 11, scope: !8)
!18 = !DILocation(line: 15, column: 11, scope: !8)
!19 = !DILocation(line: 16, column: 11, scope: !8)
!20 = !DILocation(line: 17, column: 11, scope: !8)
!21 = !DILocation(line: 18, column: 11, scope: !8)
!22 = !DILocation(line: 20, column: 11, scope: !8)
!23 = !DILocation(line: 21, column: 11, scope: !8)
!24 = !DILocation(line: 22, column: 11, scope: !8)
!25 = !DILocation(line: 23, column: 11, scope: !8)
!26 = !DILocation(line: 24, column: 11, scope: !8)
!27 = !DILocation(line: 25, column: 11, scope: !8)
!28 = !DILocation(line: 26, column: 11, scope: !8)
!29 = !DILocation(line: 32, column: 5, scope: !8)
!30 = !DILocation(line: 34, column: 11, scope: !8)
!31 = !DILocation(line: 35, column: 5, scope: !8)
!32 = !DILocation(line: 37, column: 5, scope: !8)
!33 = !DILocation(line: 39, column: 11, scope: !8)
!34 = !DILocation(line: 40, column: 5, scope: !8)
!35 = !DILocation(line: 42, column: 5, scope: !8)
!36 = !DILocation(line: 44, column: 11, scope: !8)
!37 = !DILocation(line: 45, column: 5, scope: !8)
!38 = !DILocation(line: 47, column: 11, scope: !8)
!39 = !DILocation(line: 49, column: 11, scope: !8)
!40 = !DILocation(line: 50, column: 11, scope: !8)
!41 = !DILocation(line: 51, column: 11, scope: !8)
!42 = !DILocation(line: 52, column: 11, scope: !8)
!43 = !DILocation(line: 53, column: 11, scope: !8)
!44 = !DILocation(line: 55, column: 11, scope: !8)
!45 = !DILocation(line: 56, column: 11, scope: !8)
!46 = !DILocation(line: 57, column: 11, scope: !8)
!47 = !DILocation(line: 58, column: 11, scope: !8)
!48 = !DILocation(line: 59, column: 11, scope: !8)
!49 = !DILocation(line: 61, column: 11, scope: !8)
!50 = !DILocation(line: 62, column: 11, scope: !8)
!51 = !DILocation(line: 63, column: 11, scope: !8)
!52 = !DILocation(line: 64, column: 11, scope: !8)
!53 = !DILocation(line: 65, column: 11, scope: !8)
!54 = !DILocation(line: 66, column: 11, scope: !8)
!55 = !DILocation(line: 67, column: 11, scope: !8)
!56 = !DILocation(line: 69, column: 11, scope: !8)
!57 = !DILocation(line: 70, column: 11, scope: !8)
!58 = !DILocation(line: 71, column: 11, scope: !8)
!59 = !DILocation(line: 72, column: 5, scope: !8)
!60 = !DILocation(line: 73, column: 11, scope: !8)
!61 = !DILocation(line: 74, column: 5, scope: !8)
!62 = !DILocation(line: 76, column: 11, scope: !8)
!63 = !DILocation(line: 77, column: 5, scope: !8)
!64 = !DILocation(line: 79, column: 11, scope: !8)
!65 = !DILocation(line: 80, column: 5, scope: !8)
!66 = !DILocation(line: 82, column: 5, scope: !8)
