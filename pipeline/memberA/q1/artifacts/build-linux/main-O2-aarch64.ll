; ModuleID = '../src/main.c'
source_filename = "../src/main.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@global_bias = dso_local local_unnamed_addr constant i32 2, align 4
@processed_items = dso_local local_unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"result=%d, processed=%d\0A\00", align 1

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local i32 @weighted_sum(i32* nocapture noundef readonly %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %55

4:                                                ; preds = %2
  %5 = zext i32 %1 to i64
  %6 = load i32, i32* @processed_items, align 4, !tbaa !10
  %7 = icmp ult i32 %1, 8
  br i1 %7, label %51, label %8

8:                                                ; preds = %4
  %9 = getelementptr i32, i32* %0, i64 %5
  %10 = icmp ugt i32* %9, @processed_items
  %11 = icmp ult i32* %0, getelementptr inbounds (i32, i32* @processed_items, i64 1)
  %12 = and i1 %10, %11
  br i1 %12, label %51, label %13

13:                                               ; preds = %8
  %14 = and i64 %5, 4294967288
  %15 = trunc i64 %14 to i32
  %16 = add i32 %6, %15
  %17 = add i32 %6, 3
  br label %18

18:                                               ; preds = %18, %13
  %19 = phi i64 [ 0, %13 ], [ %44, %18 ]
  %20 = phi i32 [ %17, %13 ], [ %45, %18 ]
  %21 = phi <4 x i32> [ zeroinitializer, %13 ], [ %41, %18 ]
  %22 = phi <4 x i32> [ zeroinitializer, %13 ], [ %42, %18 ]
  %23 = getelementptr inbounds i32, i32* %0, i64 %19
  %24 = bitcast i32* %23 to <4 x i32>*
  %25 = load <4 x i32>, <4 x i32>* %24, align 4, !tbaa !10, !alias.scope !14
  %26 = getelementptr inbounds i32, i32* %23, i64 4
  %27 = bitcast i32* %26 to <4 x i32>*
  %28 = load <4 x i32>, <4 x i32>* %27, align 4, !tbaa !10, !alias.scope !14
  %29 = mul nsw <4 x i32> %25, <i32 3, i32 3, i32 3, i32 3>
  %30 = mul nsw <4 x i32> %28, <i32 3, i32 3, i32 3, i32 3>
  %31 = add nsw <4 x i32> %29, <i32 2, i32 2, i32 2, i32 2>
  %32 = add nsw <4 x i32> %30, <i32 2, i32 2, i32 2, i32 2>
  %33 = and <4 x i32> %29, <i32 1, i32 1, i32 1, i32 1>
  %34 = and <4 x i32> %30, <i32 1, i32 1, i32 1, i32 1>
  %35 = icmp eq <4 x i32> %33, zeroinitializer
  %36 = icmp eq <4 x i32> %34, zeroinitializer
  %37 = sub <4 x i32> <i32 -2, i32 -2, i32 -2, i32 -2>, %29
  %38 = sub <4 x i32> <i32 -2, i32 -2, i32 -2, i32 -2>, %30
  %39 = select <4 x i1> %35, <4 x i32> %31, <4 x i32> %37
  %40 = select <4 x i1> %36, <4 x i32> %32, <4 x i32> %38
  %41 = add <4 x i32> %39, %21
  %42 = add <4 x i32> %40, %22
  %43 = add i32 %20, 5
  %44 = add nuw i64 %19, 8
  %45 = add i32 %20, 8
  %46 = icmp eq i64 %44, %14
  br i1 %46, label %47, label %18, !llvm.loop !17

47:                                               ; preds = %18
  store i32 %43, i32* @processed_items, align 4, !tbaa !10, !alias.scope !20, !noalias !14
  %48 = add <4 x i32> %42, %41
  %49 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %48)
  %50 = icmp eq i64 %14, %5
  br i1 %50, label %55, label %51

51:                                               ; preds = %8, %4, %47
  %52 = phi i32 [ %6, %8 ], [ %6, %4 ], [ %16, %47 ]
  %53 = phi i64 [ 0, %8 ], [ 0, %4 ], [ %14, %47 ]
  %54 = phi i32 [ 0, %8 ], [ 0, %4 ], [ %49, %47 ]
  br label %57

55:                                               ; preds = %57, %47, %2
  %56 = phi i32 [ 0, %2 ], [ %49, %47 ], [ %69, %57 ]
  ret i32 %56

57:                                               ; preds = %51, %57
  %58 = phi i32 [ %70, %57 ], [ %52, %51 ]
  %59 = phi i64 [ %71, %57 ], [ %53, %51 ]
  %60 = phi i32 [ %69, %57 ], [ %54, %51 ]
  %61 = getelementptr inbounds i32, i32* %0, i64 %59
  %62 = load i32, i32* %61, align 4, !tbaa !10
  %63 = mul nsw i32 %62, 3
  %64 = add nsw i32 %63, 2
  %65 = and i32 %63, 1
  %66 = icmp eq i32 %65, 0
  %67 = sub i32 -2, %63
  %68 = select i1 %66, i32 %64, i32 %67
  %69 = add i32 %68, %60
  %70 = add nsw i32 %58, 1
  store i32 %70, i32* @processed_items, align 4, !tbaa !10
  %71 = add nuw nsw i64 %59, 1
  %72 = icmp eq i64 %71, %5
  br i1 %72, label %55, label %57, !llvm.loop !22
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #2 {
  %1 = alloca i32, align 4
  %2 = alloca [8 x i32], align 4
  %3 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #6
  store i32 0, i32* %1, align 4, !tbaa !10
  %4 = bitcast [8 x i32]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %4) #6
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(32) %4, i8 0, i64 32, i1 false)
  %5 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef nonnull %1)
  %6 = icmp ne i32 %5, 1
  %7 = load i32, i32* %1, align 4
  %8 = icmp slt i32 %7, 1
  %9 = select i1 %6, i1 true, i1 %8
  %10 = icmp sgt i32 %7, 8
  %11 = select i1 %9, i1 true, i1 %10
  br i1 %11, label %86, label %16

12:                                               ; preds = %16
  %13 = load i32, i32* %1, align 4, !tbaa !10
  %14 = sext i32 %13 to i64
  %15 = icmp slt i64 %21, %14
  br i1 %15, label %16, label %22, !llvm.loop !23

16:                                               ; preds = %0, %12
  %17 = phi i64 [ %21, %12 ], [ 0, %0 ]
  %18 = getelementptr inbounds [8 x i32], [8 x i32]* %2, i64 0, i64 %17
  %19 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef nonnull %18)
  %20 = icmp eq i32 %19, 1
  %21 = add nuw nsw i64 %17, 1
  br i1 %20, label %12, label %86

22:                                               ; preds = %12
  %23 = icmp sgt i32 %13, 0
  br i1 %23, label %26, label %24

24:                                               ; preds = %22
  %25 = load i32, i32* @processed_items, align 4, !tbaa !10
  br label %82

26:                                               ; preds = %22
  %27 = zext i32 %13 to i64
  %28 = load i32, i32* @processed_items, align 4, !tbaa !10
  %29 = icmp ult i32 %13, 8
  br i1 %29, label %62, label %30

30:                                               ; preds = %26
  %31 = and i64 %27, 4294967288
  br label %32

32:                                               ; preds = %32, %30
  %33 = phi i64 [ 0, %30 ], [ %56, %32 ]
  %34 = phi <4 x i32> [ zeroinitializer, %30 ], [ %54, %32 ]
  %35 = phi <4 x i32> [ zeroinitializer, %30 ], [ %55, %32 ]
  %36 = getelementptr inbounds [8 x i32], [8 x i32]* %2, i64 0, i64 %33
  %37 = bitcast i32* %36 to <4 x i32>*
  %38 = load <4 x i32>, <4 x i32>* %37, align 4, !tbaa !10
  %39 = getelementptr inbounds i32, i32* %36, i64 4
  %40 = bitcast i32* %39 to <4 x i32>*
  %41 = load <4 x i32>, <4 x i32>* %40, align 4, !tbaa !10
  %42 = mul nsw <4 x i32> %38, <i32 3, i32 3, i32 3, i32 3>
  %43 = mul nsw <4 x i32> %41, <i32 3, i32 3, i32 3, i32 3>
  %44 = add nsw <4 x i32> %42, <i32 2, i32 2, i32 2, i32 2>
  %45 = add nsw <4 x i32> %43, <i32 2, i32 2, i32 2, i32 2>
  %46 = and <4 x i32> %42, <i32 1, i32 1, i32 1, i32 1>
  %47 = and <4 x i32> %43, <i32 1, i32 1, i32 1, i32 1>
  %48 = icmp eq <4 x i32> %46, zeroinitializer
  %49 = icmp eq <4 x i32> %47, zeroinitializer
  %50 = sub <4 x i32> <i32 -2, i32 -2, i32 -2, i32 -2>, %42
  %51 = sub <4 x i32> <i32 -2, i32 -2, i32 -2, i32 -2>, %43
  %52 = select <4 x i1> %48, <4 x i32> %44, <4 x i32> %50
  %53 = select <4 x i1> %49, <4 x i32> %45, <4 x i32> %51
  %54 = add <4 x i32> %52, %34
  %55 = add <4 x i32> %53, %35
  %56 = add nuw i64 %33, 8
  %57 = icmp eq i64 %56, %31
  br i1 %57, label %58, label %32, !llvm.loop !24

58:                                               ; preds = %32
  %59 = add <4 x i32> %55, %54
  %60 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %59)
  %61 = icmp eq i64 %31, %27
  br i1 %61, label %79, label %62

62:                                               ; preds = %26, %58
  %63 = phi i64 [ 0, %26 ], [ %31, %58 ]
  %64 = phi i32 [ 0, %26 ], [ %60, %58 ]
  br label %65

65:                                               ; preds = %62, %65
  %66 = phi i64 [ %77, %65 ], [ %63, %62 ]
  %67 = phi i32 [ %76, %65 ], [ %64, %62 ]
  %68 = getelementptr inbounds [8 x i32], [8 x i32]* %2, i64 0, i64 %66
  %69 = load i32, i32* %68, align 4, !tbaa !10
  %70 = mul nsw i32 %69, 3
  %71 = add nsw i32 %70, 2
  %72 = and i32 %70, 1
  %73 = icmp eq i32 %72, 0
  %74 = sub i32 -2, %70
  %75 = select i1 %73, i32 %71, i32 %74
  %76 = add i32 %75, %67
  %77 = add nuw nsw i64 %66, 1
  %78 = icmp eq i64 %77, %27
  br i1 %78, label %79, label %65, !llvm.loop !25

79:                                               ; preds = %65, %58
  %80 = phi i32 [ %60, %58 ], [ %76, %65 ]
  %81 = add i32 %13, %28
  store i32 %81, i32* @processed_items, align 4, !tbaa !10
  br label %82

82:                                               ; preds = %24, %79
  %83 = phi i32 [ %25, %24 ], [ %81, %79 ]
  %84 = phi i32 [ 0, %24 ], [ %80, %79 ]
  %85 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i32 noundef %84, i32 noundef %83)
  br label %86

86:                                               ; preds = %16, %0, %82
  %87 = phi i32 [ 0, %82 ], [ 1, %0 ], [ 1, %16 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %4) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #6
  ret i32 %87
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nofree nounwind
declare noundef i32 @__isoc99_scanf(i8* nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #5

attributes #0 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { nofree nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #5 = { nofree nosync nounwind readnone willreturn }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"branch-target-enforcement", i32 0}
!2 = !{i32 1, !"sign-return-address", i32 0}
!3 = !{i32 1, !"sign-return-address-all", i32 0}
!4 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 1}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !{!15}
!15 = distinct !{!15, !16}
!16 = distinct !{!16, !"LVerDomain"}
!17 = distinct !{!17, !18, !19}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!"llvm.loop.isvectorized", i32 1}
!20 = !{!21}
!21 = distinct !{!21, !16}
!22 = distinct !{!22, !18, !19}
!23 = distinct !{!23, !18}
!24 = distinct !{!24, !18, !19}
!25 = distinct !{!25, !18, !26, !19}
!26 = !{!"llvm.loop.unroll.runtime.disable"}
