target triple = "x86_64-pc-linux-gnu"

declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)

define i32 @sum_even(i32* %a, i32 %n) {
entry:
  br label %loop.cond

loop.cond:
  %i = phi i32 [ 0, %entry ], [ %i.next, %loop.step ]
  %sum = phi i32 [ 0, %entry ], [ %sum.next, %loop.step ]
  %more = icmp slt i32 %i, %n
  br i1 %more, label %loop.body, label %loop.exit

loop.body:
  %index = sext i32 %i to i64
  %element.ptr = getelementptr inbounds i32, i32* %a, i64 %index
  %value = load i32, i32* %element.ptr, align 4
  %remainder = srem i32 %value, 2
  %is.even = icmp eq i32 %remainder, 0
  br i1 %is.even, label %if.then, label %loop.step

if.then:
  %sum.add = add nsw i32 %sum, %value
  br label %loop.step

loop.step:
  %sum.next = phi i32 [ %sum.add, %if.then ], [ %sum, %loop.body ]
  %i.next = add nsw i32 %i, 1
  br label %loop.cond

loop.exit:
  ret i32 %sum
}
define i32 @count_pos(i32* %a, i32 %n) {
entry:
  br label %loop.cond

loop.cond:
  %i = phi i32 [ 0, %entry ], [ %i.next, %loop.step ]
  %count = phi i32 [ 0, %entry ], [ %count.next, %loop.step ]
  %more = icmp slt i32 %i, %n
  br i1 %more, label %loop.body, label %loop.exit

loop.body:
  %index = sext i32 %i to i64
  %element.ptr = getelementptr inbounds i32, i32* %a, i64 %index
  %value = load i32, i32* %element.ptr, align 4
  %is.positive = icmp sgt i32 %value, 0
  br i1 %is.positive, label %if.then, label %loop.step

if.then:
  %count.add = add nsw i32 %count, 1
  br label %loop.step

loop.step:
  %count.next = phi i32 [ %count.add, %if.then ], [ %count, %loop.body ]
  %i.next = add nsw i32 %i, 1
  br label %loop.cond

loop.exit:
  ret i32 %count
}

define i32 @main() {
entry:
  %array = alloca [10 x i32], align 16
  %n = call i32 @getint()
  br label %input.cond

input.cond:
  %i = phi i32 [ 0, %entry ], [ %i.next, %input.body ]
  %more = icmp slt i32 %i, %n
  br i1 %more, label %input.body, label %compute

input.body:
  %index = sext i32 %i to i64
  %element.ptr = getelementptr inbounds [10 x i32], [10 x i32]* %array, i64 0, i64 %index
  %value = call i32 @getint()
  store i32 %value, i32* %element.ptr, align 4
  %i.next = add nsw i32 %i, 1
  br label %input.cond

compute:
  %first = getelementptr inbounds [10 x i32], [10 x i32]* %array, i64 0, i64 0
  %sum = call i32 @sum_even(i32* %first, i32 %n)
  %count = call i32 @count_pos(i32* %first, i32 %n)

  call void @putint(i32 %sum)
  call void @putch(i32 10)
  call void @putint(i32 %count)
  call void @putch(i32 10)
  ret i32 0
}