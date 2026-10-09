; ModuleID = 'llvm/memberA/practice/reference.promotable.ll'
source_filename = "llvm/memberA/practice/reference.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @sum_even(i32* noundef %a, i32 noundef %n) #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add4, %if.end ]
  %sum.0 = phi i32 [ 0, %entry ], [ %sum.1, %if.end ]
  %cmp = icmp slt i32 %i.0, %n
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %rem = srem i32 %0, 2
  %cmp1 = icmp eq i32 %rem, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %idxprom2 = sext i32 %i.0 to i64
  %arrayidx3 = getelementptr inbounds i32, i32* %a, i64 %idxprom2
  %1 = load i32, i32* %arrayidx3, align 4
  %add = add nsw i32 %sum.0, %1
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %sum.1 = phi i32 [ %add, %if.then ], [ %sum.0, %while.body ]
  %add4 = add nsw i32 %i.0, 1
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  ret i32 %sum.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @count_pos(i32* noundef %a, i32 noundef %n) #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add2, %if.end ]
  %cnt.0 = phi i32 [ 0, %entry ], [ %cnt.1, %if.end ]
  %cmp = icmp slt i32 %i.0, %n
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %cmp1 = icmp sgt i32 %0, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %add = add nsw i32 %cnt.0, 1
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %cnt.1 = phi i32 [ %add, %if.then ], [ %cnt.0, %while.body ]
  %add2 = add nsw i32 %i.0, 1
  br label %while.cond, !llvm.loop !8

while.end:                                        ; preds = %while.cond
  ret i32 %cnt.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %a = alloca [10 x i32], align 16
  %call = call i32 @getint()
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add, %while.body ]
  %cmp = icmp slt i32 %i.0, %call
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call1 = call i32 @getint()
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %a, i64 0, i64 %idxprom
  store i32 %call1, i32* %arrayidx, align 4
  %add = add nsw i32 %i.0, 1
  br label %while.cond, !llvm.loop !9

while.end:                                        ; preds = %while.cond
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %a, i64 0, i64 0
  %call2 = call i32 @sum_even(i32* noundef %arraydecay, i32 noundef %call)
  %arraydecay3 = getelementptr inbounds [10 x i32], [10 x i32]* %a, i64 0, i64 0
  %call4 = call i32 @count_pos(i32* noundef %arraydecay3, i32 noundef %call)
  call void @putint(i32 noundef %call2)
  call void @putch(i32 noundef 10)
  call void @putint(i32 noundef %call4)
  call void @putch(i32 noundef 10)
  ret i32 0
}

declare i32 @getint() #1

declare void @putint(i32 noundef) #1

declare void @putch(i32 noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
