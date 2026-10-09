; ModuleID = '../src/main.c'
source_filename = "../src/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@global_bias = dso_local local_unnamed_addr constant i32 2, align 4
@processed_items = dso_local local_unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"result=%d, processed=%d\0A\00", align 1

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local i32 @weighted_sum(i32* nocapture noundef readonly %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %77

4:                                                ; preds = %2
  %5 = zext i32 %1 to i64
  %6 = load i32, i32* @processed_items, align 4, !tbaa !5
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
  %25 = load <4 x i32>, <4 x i32>* %24, align 4, !tbaa !5, !alias.scope !9
  %26 = getelementptr inbounds i32, i32* %23, i64 4
  %27 = bitcast i32* %26 to <4 x i32>*
  %28 = load <4 x i32>, <4 x i32>* %27, align 4, !tbaa !5, !alias.scope !9
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
  br i1 %46, label %47, label %18, !llvm.loop !12

47:                                               ; preds = %18
  store i32 %43, i32* @processed_items, align 4, !tbaa !5, !alias.scope !15, !noalias !9
  %48 = add <4 x i32> %42, %41
  %49 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %48)
  %50 = icmp eq i64 %14, %5
  br i1 %50, label %77, label %51

51:                                               ; preds = %8, %4, %47
  %52 = phi i32 [ %6, %8 ], [ %6, %4 ], [ %16, %47 ]
  %53 = phi i64 [ 0, %8 ], [ 0, %4 ], [ %14, %47 ]
  %54 = phi i32 [ 0, %8 ], [ 0, %4 ], [ %49, %47 ]
  %55 = xor i64 %53, -1
  %56 = and i64 %5, 1
  %57 = icmp eq i64 %56, 0
  br i1 %57, label %70, label %58

58:                                               ; preds = %51
  %59 = getelementptr inbounds i32, i32* %0, i64 %53
  %60 = load i32, i32* %59, align 4, !tbaa !5
  %61 = mul nsw i32 %60, 3
  %62 = add nsw i32 %61, 2
  %63 = and i32 %61, 1
  %64 = icmp eq i32 %63, 0
  %65 = sub i32 -2, %61
  %66 = select i1 %64, i32 %62, i32 %65
  %67 = add i32 %66, %54
  %68 = add nsw i32 %52, 1
  store i32 %68, i32* @processed_items, align 4, !tbaa !5
  %69 = or i64 %53, 1
  br label %70

70:                                               ; preds = %58, %51
  %71 = phi i32 [ undef, %51 ], [ %67, %58 ]
  %72 = phi i32 [ %52, %51 ], [ %68, %58 ]
  %73 = phi i64 [ %53, %51 ], [ %69, %58 ]
  %74 = phi i32 [ %54, %51 ], [ %67, %58 ]
  %75 = sub nsw i64 0, %5
  %76 = icmp eq i64 %55, %75
  br i1 %76, label %77, label %79

77:                                               ; preds = %70, %79, %47, %2
  %78 = phi i32 [ 0, %2 ], [ %49, %47 ], [ %71, %70 ], [ %102, %79 ]
  ret i32 %78

79:                                               ; preds = %70, %79
  %80 = phi i32 [ %103, %79 ], [ %72, %70 ]
  %81 = phi i64 [ %104, %79 ], [ %73, %70 ]
  %82 = phi i32 [ %102, %79 ], [ %74, %70 ]
  %83 = getelementptr inbounds i32, i32* %0, i64 %81
  %84 = load i32, i32* %83, align 4, !tbaa !5
  %85 = mul nsw i32 %84, 3
  %86 = add nsw i32 %85, 2
  %87 = and i32 %85, 1
  %88 = icmp eq i32 %87, 0
  %89 = sub i32 -2, %85
  %90 = select i1 %88, i32 %86, i32 %89
  %91 = add i32 %90, %82
  %92 = add nsw i32 %80, 1
  store i32 %92, i32* @processed_items, align 4, !tbaa !5
  %93 = add nuw nsw i64 %81, 1
  %94 = getelementptr inbounds i32, i32* %0, i64 %93
  %95 = load i32, i32* %94, align 4, !tbaa !5
  %96 = mul nsw i32 %95, 3
  %97 = add nsw i32 %96, 2
  %98 = and i32 %96, 1
  %99 = icmp eq i32 %98, 0
  %100 = sub i32 -2, %96
  %101 = select i1 %99, i32 %97, i32 %100
  %102 = add i32 %101, %91
  %103 = add nsw i32 %80, 2
  store i32 %103, i32* @processed_items, align 4, !tbaa !5
  %104 = add nuw nsw i64 %81, 2
  %105 = icmp eq i64 %104, %5
  br i1 %105, label %77, label %79, !llvm.loop !17
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #2 {
  %1 = alloca i32, align 4
  %2 = alloca [8 x i32], align 16
  %3 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #6
  store i32 0, i32* %1, align 4, !tbaa !5
  %4 = bitcast [8 x i32]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %4) #6
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %4, i8 0, i64 32, i1 false)
  %5 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef nonnull %1)
  %6 = icmp ne i32 %5, 1
  %7 = load i32, i32* %1, align 4
  %8 = icmp slt i32 %7, 1
  %9 = select i1 %6, i1 true, i1 %8
  %10 = icmp sgt i32 %7, 8
  %11 = select i1 %9, i1 true, i1 %10
  br i1 %11, label %86, label %16

12:                                               ; preds = %16
  %13 = load i32, i32* %1, align 4, !tbaa !5
  %14 = sext i32 %13 to i64
  %15 = icmp slt i64 %21, %14
  br i1 %15, label %16, label %22, !llvm.loop !18

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
  %25 = load i32, i32* @processed_items, align 4, !tbaa !5
  br label %82

26:                                               ; preds = %22
  %27 = zext i32 %13 to i64
  %28 = load i32, i32* @processed_items, align 4, !tbaa !5
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
  %38 = load <4 x i32>, <4 x i32>* %37, align 16, !tbaa !5
  %39 = getelementptr inbounds i32, i32* %36, i64 4
  %40 = bitcast i32* %39 to <4 x i32>*
  %41 = load <4 x i32>, <4 x i32>* %40, align 16, !tbaa !5
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
  br i1 %57, label %58, label %32, !llvm.loop !19

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
  %69 = load i32, i32* %68, align 4, !tbaa !5
  %70 = mul nsw i32 %69, 3
  %71 = add nsw i32 %70, 2
  %72 = and i32 %70, 1
  %73 = icmp eq i32 %72, 0
  %74 = sub i32 -2, %70
  %75 = select i1 %73, i32 %71, i32 %74
  %76 = add i32 %75, %67
  %77 = add nuw nsw i64 %66, 1
  %78 = icmp eq i64 %77, %27
  br i1 %78, label %79, label %65, !llvm.loop !20

79:                                               ; preds = %65, %58
  %80 = phi i32 [ %60, %58 ], [ %76, %65 ]
  %81 = add i32 %13, %28
  store i32 %81, i32* @processed_items, align 4, !tbaa !5
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

attributes #0 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nosync nounwind readnone willreturn }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.isvectorized", i32 1}
!15 = !{!16}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !13, !14}
!18 = distinct !{!18, !13}
!19 = distinct !{!19, !13, !14}
!20 = distinct !{!20, !13, !21, !14}
!21 = !{!"llvm.loop.unroll.runtime.disable"}
