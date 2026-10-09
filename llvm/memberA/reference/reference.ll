; ModuleID = 'llvm/memberA/practice/reference.c'
source_filename = "llvm/memberA/practice/reference.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sum_even(i32* noundef %a, i32 noundef %n) #0 {
entry:
  %a.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %sum, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32*, i32** %a.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  %rem = srem i32 %4, 2
  %cmp1 = icmp eq i32 %rem, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %5 = load i32, i32* %sum, align 4
  %6 = load i32*, i32** %a.addr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom2 = sext i32 %7 to i64
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %idxprom2
  %8 = load i32, i32* %arrayidx3, align 4
  %add = add nsw i32 %5, %8
  store i32 %add, i32* %sum, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %9 = load i32, i32* %i, align 4
  %add4 = add nsw i32 %9, 1
  store i32 %add4, i32* %i, align 4
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %10 = load i32, i32* %sum, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @count_pos(i32* noundef %a, i32 noundef %n) #0 {
entry:
  %a.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %cnt = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %cnt, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32*, i32** %a.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  %cmp1 = icmp sgt i32 %4, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %5 = load i32, i32* %cnt, align 4
  %add = add nsw i32 %5, 1
  store i32 %add, i32* %cnt, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %6 = load i32, i32* %i, align 4
  %add2 = add nsw i32 %6, 1
  store i32 %add2, i32* %i, align 4
  br label %while.cond, !llvm.loop !8

while.end:                                        ; preds = %while.cond
  %7 = load i32, i32* %cnt, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [10 x i32], align 16
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %s = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 @getint()
  store i32 %call, i32* %n, align 4
  store i32 0, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %n, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call1 = call i32 @getint()
  %2 = load i32, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %a, i64 0, i64 %idxprom
  store i32 %call1, i32* %arrayidx, align 4
  %3 = load i32, i32* %i, align 4
  %add = add nsw i32 %3, 1
  store i32 %add, i32* %i, align 4
  br label %while.cond, !llvm.loop !9

while.end:                                        ; preds = %while.cond
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %a, i64 0, i64 0
  %4 = load i32, i32* %n, align 4
  %call2 = call i32 @sum_even(i32* noundef %arraydecay, i32 noundef %4)
  store i32 %call2, i32* %s, align 4
  %arraydecay3 = getelementptr inbounds [10 x i32], [10 x i32]* %a, i64 0, i64 0
  %5 = load i32, i32* %n, align 4
  %call4 = call i32 @count_pos(i32* noundef %arraydecay3, i32 noundef %5)
  store i32 %call4, i32* %c, align 4
  %6 = load i32, i32* %s, align 4
  call void @putint(i32 noundef %6)
  call void @putch(i32 noundef 10)
  %7 = load i32, i32* %c, align 4
  call void @putint(i32 noundef %7)
  call void @putch(i32 noundef 10)
  ret i32 0
}

declare i32 @getint() #1

declare void @putint(i32 noundef) #1

declare void @putch(i32 noundef) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
