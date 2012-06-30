; ModuleID = 'crash1.cc'
target datalayout = "e-p:16:16:16-i8:16:16-i16:16:16-i32:16:16-s0:16:16-n16"
target triple = "dcpu16"

%struct.Tetromino = type { i16, [4 x i16] }
%"class.<anonymous namespace>::Tetris" = type { i16*, i16, i16, [7 x i16], i16, i16, i16, i16, i16, i16, i16, i32, i32, i16, [230 x i16] }

@_ZL13tetris_pieces = internal unnamed_addr constant [7 x %struct.Tetromino] [%struct.Tetromino { i16 11, [4 x i16] [i16 3840, i16 8738, i16 240, i16 17476] }, %struct.Tetromino { i16 14, [4 x i16] [i16 26112, i16 26112, i16 26112, i16 26112] }, %struct.Tetromino { i16 5, [4 x i16] [i16 19968, i16 17984, i16 3648, i16 19520] }, %struct.Tetromino { i16 10, [4 x i16] [i16 27648, i16 17952, i16 1728, i16 -29632] }, %struct.Tetromino { i16 9, [4 x i16] [i16 -14848, i16 9792, i16 3168, i16 19584] }, %struct.Tetromino { i16 1, [4 x i16] [i16 -29184, i16 25664, i16 3616, i16 17600] }, %struct.Tetromino { i16 6, [4 x i16] [i16 11776, i16 17504, i16 3712, i16 -15296] }], align 1
@_hw_screen = external global i16

define i16 @main() noreturn {
entry:
  %screen = alloca [384 x i16], align 1
  %t = alloca %"class.<anonymous namespace>::Tetris", align 1
  %arraydecay = getelementptr inbounds [384 x i16]* %screen, i16 0, i16 0
  %screen_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 0
  store i16* %arraydecay, i16** %screen_.i, align 1, !tbaa !0
  %left_offset_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 8
  store i16 11, i16* %left_offset_.i, align 1, !tbaa !3
  %0 = load i16* @_hw_screen, align 1, !tbaa !3
  call void asm sideeffect "SET\09B,$1\0A\09SET\09A,0\0A\09HWI $0", "imr,r,~{A},~{B}"(i16 %0, i16* %arraydecay) nounwind, !srcloc !4
  call void @clock_init(i16 1)
  %arraydecay.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 14, i16 0
  %call.i = call i16* @memset(i16* %arraydecay.i, i16 0, i16 230)
  %1 = load i16* %left_offset_.i, align 1, !tbaa !3
  %add.i = add nsw i16 %1, 352
  %2 = load i16** %screen_.i, align 1, !tbaa !0
  %arrayidx.i = getelementptr inbounds i16* %2, i16 %add.i
  store i16 -28644, i16* %arrayidx.i, align 1, !tbaa !3
  %add2.1.i = add i16 %1, 353
  %arrayidx.1.i = getelementptr inbounds i16* %2, i16 %add2.1.i
  store i16 -28644, i16* %arrayidx.1.i, align 1, !tbaa !3
  %add2.2.i = add i16 %1, 354
  %arrayidx.2.i = getelementptr inbounds i16* %2, i16 %add2.2.i
  store i16 -28644, i16* %arrayidx.2.i, align 1, !tbaa !3
  %add2.3.i = add i16 %1, 355
  %arrayidx.3.i = getelementptr inbounds i16* %2, i16 %add2.3.i
  store i16 -28644, i16* %arrayidx.3.i, align 1, !tbaa !3
  %add2.4.i = add i16 %1, 356
  %arrayidx.4.i = getelementptr inbounds i16* %2, i16 %add2.4.i
  store i16 -28644, i16* %arrayidx.4.i, align 1, !tbaa !3
  %add2.5.i = add i16 %1, 357
  %arrayidx.5.i = getelementptr inbounds i16* %2, i16 %add2.5.i
  store i16 -28644, i16* %arrayidx.5.i, align 1, !tbaa !3
  %add2.6.i = add i16 %1, 358
  %arrayidx.6.i = getelementptr inbounds i16* %2, i16 %add2.6.i
  store i16 -28644, i16* %arrayidx.6.i, align 1, !tbaa !3
  %add2.7.i = add i16 %1, 359
  %arrayidx.7.i = getelementptr inbounds i16* %2, i16 %add2.7.i
  store i16 -28644, i16* %arrayidx.7.i, align 1, !tbaa !3
  %add2.8.i = add i16 %1, 360
  %arrayidx.8.i = getelementptr inbounds i16* %2, i16 %add2.8.i
  store i16 -28644, i16* %arrayidx.8.i, align 1, !tbaa !3
  %add2.9.i = add i16 %1, 361
  %arrayidx.9.i = getelementptr inbounds i16* %2, i16 %add2.9.i
  store i16 -28644, i16* %arrayidx.9.i, align 1, !tbaa !3
  %sub.i = add nsw i16 %1, -1
  %add9.i = add nsw i16 %1, 10
  %arrayidx8.i = getelementptr inbounds i16* %2, i16 %sub.i
  store i16 -26368, i16* %arrayidx8.i, align 1, !tbaa !3
  %arrayidx13.i = getelementptr inbounds i16* %2, i16 %add9.i
  store i16 -26368, i16* %arrayidx13.i, align 1, !tbaa !3
  %add6.1.i = add i16 %1, 31
  %arrayidx8.1.i = getelementptr inbounds i16* %2, i16 %add6.1.i
  store i16 -26368, i16* %arrayidx8.1.i, align 1, !tbaa !3
  %add11.1.i = add i16 %1, 42
  %arrayidx13.1.i = getelementptr inbounds i16* %2, i16 %add11.1.i
  store i16 -26368, i16* %arrayidx13.1.i, align 1, !tbaa !3
  %add6.2.i = add i16 %1, 63
  %arrayidx8.2.i = getelementptr inbounds i16* %2, i16 %add6.2.i
  store i16 -26368, i16* %arrayidx8.2.i, align 1, !tbaa !3
  %add11.2.i = add i16 %1, 74
  %arrayidx13.2.i = getelementptr inbounds i16* %2, i16 %add11.2.i
  store i16 -26368, i16* %arrayidx13.2.i, align 1, !tbaa !3
  %add6.3.i = add i16 %1, 95
  %arrayidx8.3.i = getelementptr inbounds i16* %2, i16 %add6.3.i
  store i16 -26368, i16* %arrayidx8.3.i, align 1, !tbaa !3
  %add11.3.i = add i16 %1, 106
  %arrayidx13.3.i = getelementptr inbounds i16* %2, i16 %add11.3.i
  store i16 -26368, i16* %arrayidx13.3.i, align 1, !tbaa !3
  %add6.4.i = add i16 %1, 127
  %arrayidx8.4.i = getelementptr inbounds i16* %2, i16 %add6.4.i
  store i16 -26368, i16* %arrayidx8.4.i, align 1, !tbaa !3
  %add11.4.i = add i16 %1, 138
  %arrayidx13.4.i = getelementptr inbounds i16* %2, i16 %add11.4.i
  store i16 -26368, i16* %arrayidx13.4.i, align 1, !tbaa !3
  %add6.5.i = add i16 %1, 159
  %arrayidx8.5.i = getelementptr inbounds i16* %2, i16 %add6.5.i
  store i16 -26368, i16* %arrayidx8.5.i, align 1, !tbaa !3
  %add11.5.i = add i16 %1, 170
  %arrayidx13.5.i = getelementptr inbounds i16* %2, i16 %add11.5.i
  store i16 -26368, i16* %arrayidx13.5.i, align 1, !tbaa !3
  %add6.6.i = add i16 %1, 191
  %arrayidx8.6.i = getelementptr inbounds i16* %2, i16 %add6.6.i
  store i16 -26368, i16* %arrayidx8.6.i, align 1, !tbaa !3
  %add11.6.i = add i16 %1, 202
  %arrayidx13.6.i = getelementptr inbounds i16* %2, i16 %add11.6.i
  store i16 -26368, i16* %arrayidx13.6.i, align 1, !tbaa !3
  %add6.7.i = add i16 %1, 223
  %arrayidx8.7.i = getelementptr inbounds i16* %2, i16 %add6.7.i
  store i16 -26368, i16* %arrayidx8.7.i, align 1, !tbaa !3
  %add11.7.i = add i16 %1, 234
  %arrayidx13.7.i = getelementptr inbounds i16* %2, i16 %add11.7.i
  store i16 -26368, i16* %arrayidx13.7.i, align 1, !tbaa !3
  %add6.8.i = add i16 %1, 255
  %arrayidx8.8.i = getelementptr inbounds i16* %2, i16 %add6.8.i
  store i16 -26368, i16* %arrayidx8.8.i, align 1, !tbaa !3
  %add11.8.i = add i16 %1, 266
  %arrayidx13.8.i = getelementptr inbounds i16* %2, i16 %add11.8.i
  store i16 -26368, i16* %arrayidx13.8.i, align 1, !tbaa !3
  %add6.9.i = add i16 %1, 287
  %arrayidx8.9.i = getelementptr inbounds i16* %2, i16 %add6.9.i
  store i16 -26368, i16* %arrayidx8.9.i, align 1, !tbaa !3
  %add11.9.i = add i16 %1, 298
  %arrayidx13.9.i = getelementptr inbounds i16* %2, i16 %add11.9.i
  store i16 -26368, i16* %arrayidx13.9.i, align 1, !tbaa !3
  %add6.10.i = add i16 %1, 319
  %arrayidx8.10.i = getelementptr inbounds i16* %2, i16 %add6.10.i
  store i16 -26368, i16* %arrayidx8.10.i, align 1, !tbaa !3
  %add11.10.i = add i16 %1, 330
  %arrayidx13.10.i = getelementptr inbounds i16* %2, i16 %add11.10.i
  store i16 -26368, i16* %arrayidx13.10.i, align 1, !tbaa !3
  %add6.11.i = add i16 %1, 351
  %arrayidx8.11.i = getelementptr inbounds i16* %2, i16 %add6.11.i
  store i16 -26368, i16* %arrayidx8.11.i, align 1, !tbaa !3
  %add11.11.i = add i16 %1, 362
  %arrayidx13.11.i = getelementptr inbounds i16* %2, i16 %add11.11.i
  store i16 -26368, i16* %arrayidx13.11.i, align 1, !tbaa !3
  %speed_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 9
  store i16 30, i16* %speed_.i, align 1, !tbaa !3
  %ticks_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 10
  store i16 0, i16* %ticks_.i, align 1, !tbaa !3
  %lines_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 12
  store i32 0, i32* %lines_.i, align 1, !tbaa !5
  %score_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 11
  store i32 0, i32* %score_.i, align 1, !tbaa !5
  %rand_state_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 13
  store i16 25905, i16* %rand_state_.i, align 1, !tbaa !3
  call fastcc void @_ZN12_GLOBAL__N_16Tetris13ShufflePiecesEv(%"class.<anonymous namespace>::Tetris"* %t)
  %next_piece_idx_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 2
  %arrayidx.i.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 3, i16 0
  %3 = load i16* %arrayidx.i.i, align 1, !tbaa !3
  %current_piece_.i.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 1
  store i16 %3, i16* %current_piece_.i.i, align 1, !tbaa !3
  %color.i.i = getelementptr inbounds [7 x %struct.Tetromino]* @_ZL13tetris_pieces, i16 0, i16 %3, i32 0
  %4 = load i16* %color.i.i, align 1, !tbaa !3
  %current_color_.i.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 4
  store i16 %4, i16* %current_color_.i.i, align 1, !tbaa !3
  store i16 1, i16* %next_piece_idx_.i, align 1, !tbaa !3
  %piece_x_.i.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 5
  store i16 3, i16* %piece_x_.i.i, align 1, !tbaa !3
  %piece_y_.i.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 6
  store i16 -1, i16* %piece_y_.i.i, align 1, !tbaa !3
  %piece_rot_.i.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 7
  store i16 0, i16* %piece_rot_.i.i, align 1, !tbaa !3
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc21.i, %entry
  %j.027.i = phi i16 [ 0, %entry ], [ %inc22.i, %for.inc21.i ]
  %shr.i = lshr i16 %j.027.i, 1
  %mul.i = shl i16 %shr.i, 5
  %5 = load i16* %left_offset_.i, align 1, !tbaa !3
  %add.i13 = add i16 %mul.i, %5
  %mul5.i = mul i16 %j.027.i, 10
  %and.i = and i16 %j.027.i, 1
  %tobool.i = icmp eq i16 %and.i, 0
  br label %for.body4.i

for.body4.i:                                      ; preds = %for.inc.i, %for.body.i
  %i.025.i = phi i16 [ 0, %for.body.i ], [ %inc.i, %for.inc.i ]
  %screen_idx.024.i = phi i16 [ %add.i13, %for.body.i ], [ %inc20.i, %for.inc.i ]
  %add6.i = add i16 %i.025.i, %mul5.i
  %arrayidx.i14 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %t, i16 0, i32 14, i16 %add6.i
  %6 = load i16* %arrayidx.i14, align 1, !tbaa !3
  %7 = load i16** %screen_.i, align 1, !tbaa !0
  %arrayidx7.i = getelementptr inbounds i16* %7, i16 %screen_idx.024.i
  %8 = load i16* %arrayidx7.i, align 1, !tbaa !3
  br i1 %tobool.i, label %if.else.i, label %if.then.i

if.then.i:                                        ; preds = %for.body4.i
  %and8.i = and i16 %8, 3840
  %shl.i = shl i16 %6, 12
  %or.i = or i16 %and8.i, %shl.i
  br label %for.inc.i

if.else.i:                                        ; preds = %for.body4.i
  %and14.i = and i16 %8, -4096
  %shl15.i = shl i16 %6, 8
  %or16.i = or i16 %and14.i, %shl15.i
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.else.i, %if.then.i
  %storemerge.in.i = phi i16 [ %or16.i, %if.else.i ], [ %or.i, %if.then.i ]
  %storemerge.i = or i16 %storemerge.in.i, 28
  store i16 %storemerge.i, i16* %arrayidx7.i, align 1
  %inc.i = add i16 %i.025.i, 1
  %inc20.i = add i16 %screen_idx.024.i, 1
  %exitcond.i = icmp eq i16 %inc.i, 10
  br i1 %exitcond.i, label %for.inc21.i, label %for.body4.i

for.inc21.i:                                      ; preds = %for.inc.i
  %inc22.i = add i16 %j.027.i, 1
  %exitcond28.i = icmp eq i16 %inc22.i, 23
  br i1 %exitcond28.i, label %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit, label %for.body.i

_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit:  ; preds = %for.inc21.i
  %call = call i16 @clock_get_ticks()
  br label %for.cond

for.cond:                                         ; preds = %sw.bb, %sw.bb5, %sw.bb6, %sw.bb7, %sw.bb8, %_ZN12_GLOBAL__N_16Tetris6UpdateEi.exit, %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit
  %ticks.0 = phi i16 [ %call, %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit ], [ %call2, %_ZN12_GLOBAL__N_16Tetris6UpdateEi.exit ], [ %call2, %sw.bb8 ], [ %call2, %sw.bb7 ], [ %call2, %sw.bb6 ], [ %call2, %sw.bb5 ], [ %call2, %sw.bb ]
  %call2 = call i16 @clock_get_ticks()
  %sub = sub nsw i16 %call2, %ticks.0
  %9 = load i16* %ticks_.i, align 1, !tbaa !3
  %add.i16 = add nsw i16 %9, %sub
  store i16 %add.i16, i16* %ticks_.i, align 1, !tbaa !3
  %10 = load i16* %speed_.i, align 1, !tbaa !3
  %cmp5.i = icmp sgt i16 %add.i16, %10
  br i1 %cmp5.i, label %while.body.i, label %_ZN12_GLOBAL__N_16Tetris6UpdateEi.exit

while.body.i:                                     ; preds = %for.cond, %while.body.i
  %11 = phi i16 [ %14, %while.body.i ], [ %10, %for.cond ]
  %12 = phi i16 [ %13, %while.body.i ], [ %add.i16, %for.cond ]
  %sub.i18 = sub nsw i16 %12, %11
  store i16 %sub.i18, i16* %ticks_.i, align 1, !tbaa !3
  call fastcc void @_ZN12_GLOBAL__N_16Tetris4DropEv(%"class.<anonymous namespace>::Tetris"* %t) nounwind
  %13 = load i16* %ticks_.i, align 1, !tbaa !3
  %14 = load i16* %speed_.i, align 1, !tbaa !3
  %cmp.i = icmp sgt i16 %13, %14
  br i1 %cmp.i, label %while.body.i, label %_ZN12_GLOBAL__N_16Tetris6UpdateEi.exit

_ZN12_GLOBAL__N_16Tetris6UpdateEi.exit:           ; preds = %while.body.i, %for.cond
  %call3 = call i16 @keyboard_getch()
  %c.off.i = add i16 %call3, -97
  %15 = icmp ult i16 %c.off.i, 26
  %sub.i19 = add nsw i16 %call3, -32
  %retval.0.i = select i1 %15, i16 %sub.i19, i16 %call3
  switch i16 %retval.0.i, label %for.cond [
    i16 65, label %sw.bb
    i16 130, label %sw.bb
    i16 68, label %sw.bb5
    i16 131, label %sw.bb5
    i16 87, label %sw.bb6
    i16 128, label %sw.bb6
    i16 32, label %sw.bb6
    i16 69, label %sw.bb6
    i16 81, label %sw.bb7
    i16 83, label %sw.bb8
  ]

sw.bb:                                            ; preds = %_ZN12_GLOBAL__N_16Tetris6UpdateEi.exit, %_ZN12_GLOBAL__N_16Tetris6UpdateEi.exit
  call fastcc void @_ZN12_GLOBAL__N_16Tetris4MoveEi(%"class.<anonymous namespace>::Tetris"* %t, i16 -1)
  br label %for.cond

sw.bb5:                                           ; preds = %_ZN12_GLOBAL__N_16Tetris6UpdateEi.exit, %_ZN12_GLOBAL__N_16Tetris6UpdateEi.exit
  call fastcc void @_ZN12_GLOBAL__N_16Tetris4MoveEi(%"class.<anonymous namespace>::Tetris"* %t, i16 1)
  br label %for.cond

sw.bb6:                                           ; preds = %_ZN12_GLOBAL__N_16Tetris6UpdateEi.exit, %_ZN12_GLOBAL__N_16Tetris6UpdateEi.exit, %_ZN12_GLOBAL__N_16Tetris6UpdateEi.exit, %_ZN12_GLOBAL__N_16Tetris6UpdateEi.exit
  call fastcc void @_ZN12_GLOBAL__N_16Tetris6RotateEi(%"class.<anonymous namespace>::Tetris"* %t, i16 1)
  br label %for.cond

sw.bb7:                                           ; preds = %_ZN12_GLOBAL__N_16Tetris6UpdateEi.exit
  call fastcc void @_ZN12_GLOBAL__N_16Tetris6RotateEi(%"class.<anonymous namespace>::Tetris"* %t, i16 -1)
  br label %for.cond

sw.bb8:                                           ; preds = %_ZN12_GLOBAL__N_16Tetris6UpdateEi.exit
  call fastcc void @_ZN12_GLOBAL__N_16Tetris4DropEv(%"class.<anonymous namespace>::Tetris"* %t)
  br label %for.cond
}

declare void @clock_init(i16)

declare i16 @clock_get_ticks()

declare i16 @keyboard_getch()

define internal fastcc void @_ZN12_GLOBAL__N_16Tetris4MoveEi(%"class.<anonymous namespace>::Tetris"* nocapture %this, i16 %dir) nounwind align 2 {
entry:
  tail call fastcc void @_ZN12_GLOBAL__N_16Tetris9DrawPieceEj(%"class.<anonymous namespace>::Tetris"* %this, i16 0)
  %piece_x_ = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 5
  %0 = load i16* %piece_x_, align 1, !tbaa !3
  %add = add nsw i16 %0, %dir
  store i16 %add, i16* %piece_x_, align 1, !tbaa !3
  %piece_y_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 6
  %1 = load i16* %piece_y_.i, align 1, !tbaa !3
  %mul.i = mul nsw i16 %1, 10
  %add.i = add nsw i16 %mul.i, %add
  %piece_rot_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 7
  %2 = load i16* %piece_rot_.i, align 1, !tbaa !3
  %current_piece_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 1
  %3 = load i16* %current_piece_.i, align 1, !tbaa !3
  %arrayidx2.i = getelementptr inbounds [7 x %struct.Tetromino]* @_ZL13tetris_pieces, i16 0, i16 %3, i32 1, i16 %2
  %4 = load i16* %arrayidx2.i, align 1, !tbaa !3
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc31.i, %entry
  %j.0.i = phi i16 [ 0, %entry ], [ %inc32.i, %for.inc31.i ]
  %piece_data.0.i = phi i16 [ %4, %entry ], [ %piece_data.1.i, %for.inc31.i ]
  %playfield_offset.0.i = phi i16 [ %add.i, %entry ], [ %add33.i, %for.inc31.i ]
  %cmp.i = icmp slt i16 %j.0.i, 4
  br i1 %cmp.i, label %for.cond3.i.preheader, label %if.else

for.cond3.i.preheader:                            ; preds = %for.cond.i
  %add16.i = add nsw i16 %j.0.i, %1
  %cmp17.i = icmp slt i16 %add16.i, 0
  %cmp22.i = icmp sgt i16 %add16.i, 22
  br label %for.cond3.i

for.cond3.i:                                      ; preds = %for.cond3.i.preheader, %for.inc.i
  %piece_data.1.i = phi i16 [ %shl.i, %for.inc.i ], [ %piece_data.0.i, %for.cond3.i.preheader ]
  %playfield_offset.1.i = phi i16 [ %inc30.i, %for.inc.i ], [ %playfield_offset.0.i, %for.cond3.i.preheader ]
  %i.0.i = phi i16 [ %inc.i, %for.inc.i ], [ 0, %for.cond3.i.preheader ]
  %cmp4.i = icmp slt i16 %i.0.i, 4
  br i1 %cmp4.i, label %for.body5.i, label %for.inc31.i

for.body5.i:                                      ; preds = %for.cond3.i
  %tobool.i = icmp slt i16 %piece_data.1.i, 0
  br i1 %tobool.i, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %for.body5.i
  %add7.i = add nsw i16 %i.0.i, %add
  %5 = icmp ugt i16 %add7.i, 9
  br i1 %5, label %if.then, label %if.end14.i

if.end14.i:                                       ; preds = %if.then.i
  br i1 %cmp17.i, label %for.inc.i, label %if.end19.i

if.end19.i:                                       ; preds = %if.end14.i
  br i1 %cmp22.i, label %if.then, label %if.end24.i

if.end24.i:                                       ; preds = %if.end19.i
  %arrayidx25.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %playfield_offset.1.i
  %6 = load i16* %arrayidx25.i, align 1, !tbaa !3
  %tobool26.i = icmp eq i16 %6, 0
  br i1 %tobool26.i, label %for.inc.i, label %if.then

for.inc.i:                                        ; preds = %if.end24.i, %if.end14.i, %for.body5.i
  %inc.i = add nsw i16 %i.0.i, 1
  %inc30.i = add nsw i16 %playfield_offset.1.i, 1
  %shl.i = shl i16 %piece_data.1.i, 1
  br label %for.cond3.i

for.inc31.i:                                      ; preds = %for.cond3.i
  %inc32.i = add nsw i16 %j.0.i, 1
  %add33.i = add nsw i16 %playfield_offset.1.i, 6
  br label %for.cond.i

if.then:                                          ; preds = %if.then.i, %if.end19.i, %if.end24.i
  store i16 %0, i16* %piece_x_, align 1, !tbaa !3
  %current_color_ = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 4
  %7 = load i16* %current_color_, align 1, !tbaa !3
  tail call fastcc void @_ZN12_GLOBAL__N_16Tetris9DrawPieceEj(%"class.<anonymous namespace>::Tetris"* %this, i16 %7)
  br label %if.end

if.else:                                          ; preds = %for.cond.i
  %current_color_3 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 4
  %8 = load i16* %current_color_3, align 1, !tbaa !3
  tail call fastcc void @_ZN12_GLOBAL__N_16Tetris9DrawPieceEj(%"class.<anonymous namespace>::Tetris"* %this, i16 %8)
  %9 = load i16* %piece_y_.i, align 1, !tbaa !3
  %cmp.i16 = icmp slt i16 %9, 0
  %a.b.i17 = select i1 %cmp.i16, i16 0, i16 %9
  %add6 = add nsw i16 %9, 4
  %cmp.i15 = icmp sgt i16 %add6, 23
  %a.b.i = select i1 %cmp.i15, i16 23, i16 %add6
  %cmp26.i = icmp ult i16 %a.b.i17, %a.b.i
  br i1 %cmp26.i, label %for.body.lr.ph.i, label %if.end

for.body.lr.ph.i:                                 ; preds = %if.else
  %left_offset_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 8
  %screen_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 0
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc21.i, %for.body.lr.ph.i
  %j.027.i = phi i16 [ %a.b.i17, %for.body.lr.ph.i ], [ %inc22.i, %for.inc21.i ]
  %shr.i = lshr i16 %j.027.i, 1
  %mul.i8 = shl i16 %shr.i, 5
  %10 = load i16* %left_offset_.i, align 1, !tbaa !3
  %add.i9 = add i16 %mul.i8, %10
  %mul5.i = mul i16 %j.027.i, 10
  %and.i = and i16 %j.027.i, 1
  %tobool.i10 = icmp eq i16 %and.i, 0
  br label %for.body4.i

for.body4.i:                                      ; preds = %for.inc.i14, %for.body.i
  %i.025.i = phi i16 [ 0, %for.body.i ], [ %inc.i13, %for.inc.i14 ]
  %screen_idx.024.i = phi i16 [ %add.i9, %for.body.i ], [ %inc20.i, %for.inc.i14 ]
  %add6.i = add i16 %i.025.i, %mul5.i
  %arrayidx.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %add6.i
  %11 = load i16* %arrayidx.i, align 1, !tbaa !3
  %12 = load i16** %screen_.i, align 1, !tbaa !0
  %arrayidx7.i = getelementptr inbounds i16* %12, i16 %screen_idx.024.i
  %13 = load i16* %arrayidx7.i, align 1, !tbaa !3
  br i1 %tobool.i10, label %if.else.i, label %if.then.i12

if.then.i12:                                      ; preds = %for.body4.i
  %and8.i = and i16 %13, 3840
  %shl.i11 = shl i16 %11, 12
  %or.i = or i16 %and8.i, %shl.i11
  br label %for.inc.i14

if.else.i:                                        ; preds = %for.body4.i
  %and14.i = and i16 %13, -4096
  %shl15.i = shl i16 %11, 8
  %or16.i = or i16 %and14.i, %shl15.i
  br label %for.inc.i14

for.inc.i14:                                      ; preds = %if.else.i, %if.then.i12
  %storemerge.in.i = phi i16 [ %or16.i, %if.else.i ], [ %or.i, %if.then.i12 ]
  %storemerge.i = or i16 %storemerge.in.i, 28
  store i16 %storemerge.i, i16* %arrayidx7.i, align 1
  %inc.i13 = add i16 %i.025.i, 1
  %inc20.i = add i16 %screen_idx.024.i, 1
  %exitcond.i = icmp eq i16 %inc.i13, 10
  br i1 %exitcond.i, label %for.inc21.i, label %for.body4.i

for.inc21.i:                                      ; preds = %for.inc.i14
  %inc22.i = add i16 %j.027.i, 1
  %exitcond28.i = icmp eq i16 %inc22.i, %a.b.i
  br i1 %exitcond28.i, label %if.end, label %for.body.i

if.end:                                           ; preds = %for.inc21.i, %if.else, %if.then
  ret void
}

define internal fastcc void @_ZN12_GLOBAL__N_16Tetris6RotateEi(%"class.<anonymous namespace>::Tetris"* nocapture %this, i16 %dir) nounwind align 2 {
entry:
  tail call fastcc void @_ZN12_GLOBAL__N_16Tetris9DrawPieceEj(%"class.<anonymous namespace>::Tetris"* %this, i16 0)
  %piece_rot_ = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 7
  %0 = load i16* %piece_rot_, align 1, !tbaa !3
  %add = add nsw i16 %0, %dir
  %and = and i16 %add, 3
  store i16 %and, i16* %piece_rot_, align 1, !tbaa !3
  %piece_y_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 6
  %1 = load i16* %piece_y_.i, align 1, !tbaa !3
  %mul.i = mul nsw i16 %1, 10
  %piece_x_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 5
  %2 = load i16* %piece_x_.i, align 1, !tbaa !3
  %add.i = add nsw i16 %mul.i, %2
  %current_piece_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 1
  %3 = load i16* %current_piece_.i, align 1, !tbaa !3
  %arrayidx2.i = getelementptr inbounds [7 x %struct.Tetromino]* @_ZL13tetris_pieces, i16 0, i16 %3, i32 1, i16 %and
  %4 = load i16* %arrayidx2.i, align 1, !tbaa !3
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc31.i, %entry
  %j.0.i = phi i16 [ 0, %entry ], [ %inc32.i, %for.inc31.i ]
  %piece_data.0.i = phi i16 [ %4, %entry ], [ %piece_data.1.i, %for.inc31.i ]
  %playfield_offset.0.i = phi i16 [ %add.i, %entry ], [ %add33.i, %for.inc31.i ]
  %cmp.i = icmp slt i16 %j.0.i, 4
  br i1 %cmp.i, label %for.cond3.i.preheader, label %if.else

for.cond3.i.preheader:                            ; preds = %for.cond.i
  %add16.i = add nsw i16 %j.0.i, %1
  %cmp17.i = icmp slt i16 %add16.i, 0
  %cmp22.i = icmp sgt i16 %add16.i, 22
  br label %for.cond3.i

for.cond3.i:                                      ; preds = %for.cond3.i.preheader, %for.inc.i
  %piece_data.1.i = phi i16 [ %shl.i, %for.inc.i ], [ %piece_data.0.i, %for.cond3.i.preheader ]
  %playfield_offset.1.i = phi i16 [ %inc30.i, %for.inc.i ], [ %playfield_offset.0.i, %for.cond3.i.preheader ]
  %i.0.i = phi i16 [ %inc.i, %for.inc.i ], [ 0, %for.cond3.i.preheader ]
  %cmp4.i = icmp slt i16 %i.0.i, 4
  br i1 %cmp4.i, label %for.body5.i, label %for.inc31.i

for.body5.i:                                      ; preds = %for.cond3.i
  %tobool.i = icmp slt i16 %piece_data.1.i, 0
  br i1 %tobool.i, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %for.body5.i
  %add7.i = add nsw i16 %i.0.i, %2
  %5 = icmp ugt i16 %add7.i, 9
  br i1 %5, label %if.then, label %if.end14.i

if.end14.i:                                       ; preds = %if.then.i
  br i1 %cmp17.i, label %for.inc.i, label %if.end19.i

if.end19.i:                                       ; preds = %if.end14.i
  br i1 %cmp22.i, label %if.then, label %if.end24.i

if.end24.i:                                       ; preds = %if.end19.i
  %arrayidx25.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %playfield_offset.1.i
  %6 = load i16* %arrayidx25.i, align 1, !tbaa !3
  %tobool26.i = icmp eq i16 %6, 0
  br i1 %tobool26.i, label %for.inc.i, label %if.then

for.inc.i:                                        ; preds = %if.end24.i, %if.end14.i, %for.body5.i
  %inc.i = add nsw i16 %i.0.i, 1
  %inc30.i = add nsw i16 %playfield_offset.1.i, 1
  %shl.i = shl i16 %piece_data.1.i, 1
  br label %for.cond3.i

for.inc31.i:                                      ; preds = %for.cond3.i
  %inc32.i = add nsw i16 %j.0.i, 1
  %add33.i = add nsw i16 %playfield_offset.1.i, 6
  br label %for.cond.i

if.then:                                          ; preds = %if.then.i, %if.end19.i, %if.end24.i
  %and5 = and i16 %0, 3
  store i16 %and5, i16* %piece_rot_, align 1, !tbaa !3
  %current_color_ = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 4
  %7 = load i16* %current_color_, align 1, !tbaa !3
  tail call fastcc void @_ZN12_GLOBAL__N_16Tetris9DrawPieceEj(%"class.<anonymous namespace>::Tetris"* %this, i16 %7)
  br label %if.end

if.else:                                          ; preds = %for.cond.i
  %current_color_6 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 4
  %8 = load i16* %current_color_6, align 1, !tbaa !3
  tail call fastcc void @_ZN12_GLOBAL__N_16Tetris9DrawPieceEj(%"class.<anonymous namespace>::Tetris"* %this, i16 %8)
  %9 = load i16* %piece_y_.i, align 1, !tbaa !3
  %cmp.i19 = icmp slt i16 %9, 0
  %a.b.i20 = select i1 %cmp.i19, i16 0, i16 %9
  %add9 = add nsw i16 %9, 4
  %cmp.i18 = icmp sgt i16 %add9, 23
  %a.b.i = select i1 %cmp.i18, i16 23, i16 %add9
  %cmp26.i = icmp ult i16 %a.b.i20, %a.b.i
  br i1 %cmp26.i, label %for.body.lr.ph.i, label %if.end

for.body.lr.ph.i:                                 ; preds = %if.else
  %left_offset_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 8
  %screen_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 0
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc21.i, %for.body.lr.ph.i
  %j.027.i = phi i16 [ %a.b.i20, %for.body.lr.ph.i ], [ %inc22.i, %for.inc21.i ]
  %shr.i = lshr i16 %j.027.i, 1
  %mul.i11 = shl i16 %shr.i, 5
  %10 = load i16* %left_offset_.i, align 1, !tbaa !3
  %add.i12 = add i16 %mul.i11, %10
  %mul5.i = mul i16 %j.027.i, 10
  %and.i = and i16 %j.027.i, 1
  %tobool.i13 = icmp eq i16 %and.i, 0
  br label %for.body4.i

for.body4.i:                                      ; preds = %for.inc.i17, %for.body.i
  %i.025.i = phi i16 [ 0, %for.body.i ], [ %inc.i16, %for.inc.i17 ]
  %screen_idx.024.i = phi i16 [ %add.i12, %for.body.i ], [ %inc20.i, %for.inc.i17 ]
  %add6.i = add i16 %i.025.i, %mul5.i
  %arrayidx.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %add6.i
  %11 = load i16* %arrayidx.i, align 1, !tbaa !3
  %12 = load i16** %screen_.i, align 1, !tbaa !0
  %arrayidx7.i = getelementptr inbounds i16* %12, i16 %screen_idx.024.i
  %13 = load i16* %arrayidx7.i, align 1, !tbaa !3
  br i1 %tobool.i13, label %if.else.i, label %if.then.i15

if.then.i15:                                      ; preds = %for.body4.i
  %and8.i = and i16 %13, 3840
  %shl.i14 = shl i16 %11, 12
  %or.i = or i16 %and8.i, %shl.i14
  br label %for.inc.i17

if.else.i:                                        ; preds = %for.body4.i
  %and14.i = and i16 %13, -4096
  %shl15.i = shl i16 %11, 8
  %or16.i = or i16 %and14.i, %shl15.i
  br label %for.inc.i17

for.inc.i17:                                      ; preds = %if.else.i, %if.then.i15
  %storemerge.in.i = phi i16 [ %or16.i, %if.else.i ], [ %or.i, %if.then.i15 ]
  %storemerge.i = or i16 %storemerge.in.i, 28
  store i16 %storemerge.i, i16* %arrayidx7.i, align 1
  %inc.i16 = add i16 %i.025.i, 1
  %inc20.i = add i16 %screen_idx.024.i, 1
  %exitcond.i = icmp eq i16 %inc.i16, 10
  br i1 %exitcond.i, label %for.inc21.i, label %for.body4.i

for.inc21.i:                                      ; preds = %for.inc.i17
  %inc22.i = add i16 %j.027.i, 1
  %exitcond28.i = icmp eq i16 %inc22.i, %a.b.i
  br i1 %exitcond28.i, label %if.end, label %for.body.i

if.end:                                           ; preds = %for.inc21.i, %if.else, %if.then
  ret void
}

define internal fastcc void @_ZN12_GLOBAL__N_16Tetris4DropEv(%"class.<anonymous namespace>::Tetris"* %this) nounwind align 2 {
entry:
  tail call fastcc void @_ZN12_GLOBAL__N_16Tetris9DrawPieceEj(%"class.<anonymous namespace>::Tetris"* %this, i16 0)
  %piece_y_ = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 6
  %0 = load i16* %piece_y_, align 1, !tbaa !3
  %inc = add nsw i16 %0, 1
  store i16 %inc, i16* %piece_y_, align 1, !tbaa !3
  %mul.i = mul nsw i16 %inc, 10
  %piece_x_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 5
  %1 = load i16* %piece_x_.i, align 1, !tbaa !3
  %add.i = add nsw i16 %mul.i, %1
  %piece_rot_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 7
  %2 = load i16* %piece_rot_.i, align 1, !tbaa !3
  %current_piece_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 1
  %3 = load i16* %current_piece_.i, align 1, !tbaa !3
  %arrayidx2.i = getelementptr inbounds [7 x %struct.Tetromino]* @_ZL13tetris_pieces, i16 0, i16 %3, i32 1, i16 %2
  %4 = load i16* %arrayidx2.i, align 1, !tbaa !3
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc31.i, %entry
  %j.0.i = phi i16 [ 0, %entry ], [ %inc32.i, %for.inc31.i ]
  %piece_data.0.i = phi i16 [ %4, %entry ], [ %piece_data.1.i, %for.inc31.i ]
  %playfield_offset.0.i = phi i16 [ %add.i, %entry ], [ %add33.i, %for.inc31.i ]
  %cmp.i = icmp slt i16 %j.0.i, 4
  br i1 %cmp.i, label %for.cond3.i.preheader, label %if.end

for.cond3.i.preheader:                            ; preds = %for.cond.i
  %add16.i = add nsw i16 %j.0.i, %inc
  %cmp17.i = icmp slt i16 %add16.i, 0
  %cmp22.i = icmp sgt i16 %add16.i, 22
  br label %for.cond3.i

for.cond3.i:                                      ; preds = %for.cond3.i.preheader, %for.inc.i
  %piece_data.1.i = phi i16 [ %shl.i, %for.inc.i ], [ %piece_data.0.i, %for.cond3.i.preheader ]
  %playfield_offset.1.i = phi i16 [ %inc30.i, %for.inc.i ], [ %playfield_offset.0.i, %for.cond3.i.preheader ]
  %i.0.i = phi i16 [ %inc.i, %for.inc.i ], [ 0, %for.cond3.i.preheader ]
  %cmp4.i = icmp slt i16 %i.0.i, 4
  br i1 %cmp4.i, label %for.body5.i, label %for.inc31.i

for.body5.i:                                      ; preds = %for.cond3.i
  %tobool.i = icmp slt i16 %piece_data.1.i, 0
  br i1 %tobool.i, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %for.body5.i
  %add7.i = add nsw i16 %i.0.i, %1
  %5 = icmp ugt i16 %add7.i, 9
  br i1 %5, label %if.then, label %if.end14.i

if.end14.i:                                       ; preds = %if.then.i
  br i1 %cmp17.i, label %for.inc.i, label %if.end19.i

if.end19.i:                                       ; preds = %if.end14.i
  br i1 %cmp22.i, label %if.then, label %if.end24.i

if.end24.i:                                       ; preds = %if.end19.i
  %arrayidx25.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %playfield_offset.1.i
  %6 = load i16* %arrayidx25.i, align 1, !tbaa !3
  %tobool26.i = icmp eq i16 %6, 0
  br i1 %tobool26.i, label %for.inc.i, label %if.then

for.inc.i:                                        ; preds = %if.end24.i, %if.end14.i, %for.body5.i
  %inc.i = add nsw i16 %i.0.i, 1
  %inc30.i = add nsw i16 %playfield_offset.1.i, 1
  %shl.i = shl i16 %piece_data.1.i, 1
  br label %for.cond3.i

for.inc31.i:                                      ; preds = %for.cond3.i
  %inc32.i = add nsw i16 %j.0.i, 1
  %add33.i = add nsw i16 %playfield_offset.1.i, 6
  br label %for.cond.i

if.then:                                          ; preds = %if.then.i, %if.end19.i, %if.end24.i
  store i16 %0, i16* %piece_y_, align 1, !tbaa !3
  %current_color_ = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 4
  %7 = load i16* %current_color_, align 1, !tbaa !3
  tail call fastcc void @_ZN12_GLOBAL__N_16Tetris9DrawPieceEj(%"class.<anonymous namespace>::Tetris"* %this, i16 %7)
  %8 = load i16* %piece_y_, align 1, !tbaa !3
  %sub = add nsw i16 %8, -1
  %cmp.i24 = icmp slt i16 %sub, 0
  %a.b.i25 = select i1 %cmp.i24, i16 0, i16 %sub
  %add = add nsw i16 %8, 4
  %cmp.i34 = icmp sgt i16 %add, 23
  %a.b.i35 = select i1 %cmp.i34, i16 23, i16 %add
  %cmp26.i45 = icmp ult i16 %a.b.i25, %a.b.i35
  br i1 %cmp26.i45, label %for.body.lr.ph.i48, label %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit80

for.body.lr.ph.i48:                               ; preds = %if.then
  %left_offset_.i46 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 8
  %screen_.i47 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 0
  br label %for.body.i56

for.body.i56:                                     ; preds = %for.inc21.i79, %for.body.lr.ph.i48
  %j.027.i49 = phi i16 [ %a.b.i25, %for.body.lr.ph.i48 ], [ %inc22.i77, %for.inc21.i79 ]
  %shr.i50 = lshr i16 %j.027.i49, 1
  %mul.i51 = shl i16 %shr.i50, 5
  %9 = load i16* %left_offset_.i46, align 1, !tbaa !3
  %add.i52 = add i16 %mul.i51, %9
  %mul5.i53 = mul i16 %j.027.i49, 10
  %and.i54 = and i16 %j.027.i49, 1
  %tobool.i55 = icmp eq i16 %and.i54, 0
  br label %for.body4.i62

for.body4.i62:                                    ; preds = %for.inc.i76, %for.body.i56
  %i.025.i57 = phi i16 [ 0, %for.body.i56 ], [ %inc.i73, %for.inc.i76 ]
  %screen_idx.024.i58 = phi i16 [ %add.i52, %for.body.i56 ], [ %inc20.i74, %for.inc.i76 ]
  %add6.i59 = add i16 %i.025.i57, %mul5.i53
  %arrayidx.i60 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %add6.i59
  %10 = load i16* %arrayidx.i60, align 1, !tbaa !3
  %11 = load i16** %screen_.i47, align 1, !tbaa !0
  %arrayidx7.i61 = getelementptr inbounds i16* %11, i16 %screen_idx.024.i58
  %12 = load i16* %arrayidx7.i61, align 1, !tbaa !3
  br i1 %tobool.i55, label %if.else.i70, label %if.then.i66

if.then.i66:                                      ; preds = %for.body4.i62
  %and8.i63 = and i16 %12, 3840
  %shl.i64 = shl i16 %10, 12
  %or.i65 = or i16 %and8.i63, %shl.i64
  br label %for.inc.i76

if.else.i70:                                      ; preds = %for.body4.i62
  %and14.i67 = and i16 %12, -4096
  %shl15.i68 = shl i16 %10, 8
  %or16.i69 = or i16 %and14.i67, %shl15.i68
  br label %for.inc.i76

for.inc.i76:                                      ; preds = %if.else.i70, %if.then.i66
  %storemerge.in.i71 = phi i16 [ %or16.i69, %if.else.i70 ], [ %or.i65, %if.then.i66 ]
  %storemerge.i72 = or i16 %storemerge.in.i71, 28
  store i16 %storemerge.i72, i16* %arrayidx7.i61, align 1
  %inc.i73 = add i16 %i.025.i57, 1
  %inc20.i74 = add i16 %screen_idx.024.i58, 1
  %exitcond.i75 = icmp eq i16 %inc.i73, 10
  br i1 %exitcond.i75, label %for.inc21.i79, label %for.body4.i62

for.inc21.i79:                                    ; preds = %for.inc.i76
  %inc22.i77 = add i16 %j.027.i49, 1
  %exitcond28.i78 = icmp eq i16 %inc22.i77, %a.b.i35
  br i1 %exitcond28.i78, label %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit80, label %for.body.i56

_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit80: ; preds = %for.inc21.i79, %if.then
  %lines_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 12
  br label %for.cond2.preheader.i

for.cond2.preheader.i:                            ; preds = %for.inc12.i, %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit80
  %nlines.035.i = phi i16 [ 0, %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit80 ], [ %nlines.1.i, %for.inc12.i ]
  %j.034.i = phi i16 [ 0, %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit80 ], [ %inc13.i, %for.inc12.i ]
  %mul.i36 = mul nsw i16 %j.034.i, 10
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.body4.i41, %for.cond2.preheader.i
  %i.0.i37 = phi i16 [ %inc.i40, %for.body4.i41 ], [ 0, %for.cond2.preheader.i ]
  %cmp3.i = icmp slt i16 %i.0.i37, 10
  br i1 %cmp3.i, label %for.body4.i41, label %for.end.i

for.body4.i41:                                    ; preds = %for.cond2.i
  %add.i38 = add nsw i16 %i.0.i37, %mul.i36
  %arrayidx.i39 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %add.i38
  %13 = load i16* %arrayidx.i39, align 1, !tbaa !3
  %cmp5.i = icmp eq i16 %13, 0
  %inc.i40 = add nsw i16 %i.0.i37, 1
  br i1 %cmp5.i, label %for.end.i, label %for.cond2.i

for.end.i:                                        ; preds = %for.body4.i41, %for.cond2.i
  %cmp6.i = icmp eq i16 %i.0.i37, 10
  br i1 %cmp6.i, label %if.then7.i, label %for.inc12.i

if.then7.i:                                       ; preds = %for.end.i
  %inc8.i = add nsw i16 %nlines.035.i, 1
  %14 = load i32* %lines_.i, align 1, !tbaa !5
  %inc10.i = add i32 %14, 1
  store i32 %inc10.i, i32* %lines_.i, align 1, !tbaa !5
  br label %for.inc12.i

for.inc12.i:                                      ; preds = %if.then7.i, %for.end.i
  %nlines.1.i = phi i16 [ %inc8.i, %if.then7.i ], [ %nlines.035.i, %for.end.i ]
  %inc13.i = add nsw i16 %j.034.i, 1
  %exitcond36.i = icmp eq i16 %inc13.i, 23
  br i1 %exitcond36.i, label %for.end14.i, label %for.cond2.preheader.i

for.end14.i:                                      ; preds = %for.inc12.i
  %tobool.i42 = icmp eq i16 %nlines.1.i, 0
  br i1 %tobool.i42, label %_ZN12_GLOBAL__N_16Tetris10CheckLinesEv.exit, label %for.cond17.preheader.i

for.cond17.preheader.i:                           ; preds = %for.end14.i
  %left_offset_.i.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 8
  %screen_.i.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 0
  br label %for.cond20.preheader.i

for.cond20.preheader.i:                           ; preds = %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit.i, %for.cond17.preheader.i
  %i16.033.i = phi i16 [ 0, %for.cond17.preheader.i ], [ %inc30.i43, %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit.i ]
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.inc21.i.i, %for.cond20.preheader.i
  %j.027.i.i = phi i16 [ 0, %for.cond20.preheader.i ], [ %inc22.i.i, %for.inc21.i.i ]
  %shr.i.i = lshr i16 %j.027.i.i, 1
  %mul.i.i = shl i16 %shr.i.i, 5
  %15 = load i16* %left_offset_.i.i, align 1, !tbaa !3
  %add.i.i = add i16 %mul.i.i, %15
  %mul5.i.i = mul i16 %j.027.i.i, 10
  %and.i.i = and i16 %j.027.i.i, 1
  %tobool.i.i = icmp eq i16 %and.i.i, 0
  br label %for.body4.i.i

for.body4.i.i:                                    ; preds = %for.inc.i.i, %for.body.i.i
  %i.025.i.i = phi i16 [ 0, %for.body.i.i ], [ %inc.i.i, %for.inc.i.i ]
  %screen_idx.024.i.i = phi i16 [ %add.i.i, %for.body.i.i ], [ %inc20.i.i, %for.inc.i.i ]
  %add6.i.i = add i16 %i.025.i.i, %mul5.i.i
  %arrayidx.i.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %add6.i.i
  %16 = load i16* %arrayidx.i.i, align 1, !tbaa !3
  %17 = load i16** %screen_.i.i, align 1, !tbaa !0
  %arrayidx7.i.i = getelementptr inbounds i16* %17, i16 %screen_idx.024.i.i
  %18 = load i16* %arrayidx7.i.i, align 1, !tbaa !3
  br i1 %tobool.i.i, label %if.else.i.i, label %if.then.i.i

if.then.i.i:                                      ; preds = %for.body4.i.i
  %and8.i.i = and i16 %18, 3840
  %shl.i.i = shl i16 %16, 12
  %or.i.i = or i16 %and8.i.i, %shl.i.i
  br label %for.inc.i.i

if.else.i.i:                                      ; preds = %for.body4.i.i
  %and14.i.i = and i16 %18, -4096
  %shl15.i.i = shl i16 %16, 8
  %or16.i.i = or i16 %and14.i.i, %shl15.i.i
  br label %for.inc.i.i

for.inc.i.i:                                      ; preds = %if.else.i.i, %if.then.i.i
  %storemerge.in.i.i = phi i16 [ %or16.i.i, %if.else.i.i ], [ %or.i.i, %if.then.i.i ]
  %storemerge.i.i = or i16 %storemerge.in.i.i, 28
  store i16 %storemerge.i.i, i16* %arrayidx7.i.i, align 1
  %inc.i.i = add i16 %i.025.i.i, 1
  %inc20.i.i = add i16 %screen_idx.024.i.i, 1
  %exitcond.i.i = icmp eq i16 %inc.i.i, 10
  br i1 %exitcond.i.i, label %for.inc21.i.i, label %for.body4.i.i

for.inc21.i.i:                                    ; preds = %for.inc.i.i
  %inc22.i.i = add i16 %j.027.i.i, 1
  %exitcond28.i.i = icmp eq i16 %inc22.i.i, 23
  br i1 %exitcond28.i.i, label %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit.i, label %for.body.i.i

_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit.i: ; preds = %for.inc21.i.i
  %inc30.i43 = add nsw i16 %i16.033.i, 1
  %exitcond.i44 = icmp eq i16 %inc30.i43, 5
  br i1 %exitcond.i44, label %_ZN12_GLOBAL__N_16Tetris10CheckLinesEv.exit, label %for.cond20.preheader.i

_ZN12_GLOBAL__N_16Tetris10CheckLinesEv.exit:      ; preds = %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit.i, %for.end14.i
  %next_piece_idx_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 2
  %19 = load i16* %next_piece_idx_.i, align 1, !tbaa !3
  %arrayidx.i26 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 3, i16 %19
  %20 = load i16* %arrayidx.i26, align 1, !tbaa !3
  store i16 %20, i16* %current_piece_.i, align 1, !tbaa !3
  %color.i = getelementptr inbounds [7 x %struct.Tetromino]* @_ZL13tetris_pieces, i16 0, i16 %20, i32 0
  %21 = load i16* %color.i, align 1, !tbaa !3
  store i16 %21, i16* %current_color_, align 1, !tbaa !3
  %inc.i28 = add i16 %19, 1
  store i16 %inc.i28, i16* %next_piece_idx_.i, align 1, !tbaa !3
  %cmp.i29 = icmp eq i16 %inc.i28, 7
  br i1 %cmp.i29, label %if.then.i30, label %_ZN12_GLOBAL__N_16Tetris9NextPieceEv.exit

if.then.i30:                                      ; preds = %_ZN12_GLOBAL__N_16Tetris10CheckLinesEv.exit
  tail call fastcc void @_ZN12_GLOBAL__N_16Tetris13ShufflePiecesEv(%"class.<anonymous namespace>::Tetris"* %this) nounwind
  store i16 0, i16* %next_piece_idx_.i, align 1, !tbaa !3
  br label %_ZN12_GLOBAL__N_16Tetris9NextPieceEv.exit

_ZN12_GLOBAL__N_16Tetris9NextPieceEv.exit:        ; preds = %_ZN12_GLOBAL__N_16Tetris10CheckLinesEv.exit, %if.then.i30
  store i16 3, i16* %piece_x_.i, align 1, !tbaa !3
  store i16 -1, i16* %piece_y_, align 1, !tbaa !3
  store i16 0, i16* %piece_rot_.i, align 1, !tbaa !3
  br label %return

if.end:                                           ; preds = %for.cond.i
  %current_color_7 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 4
  %22 = load i16* %current_color_7, align 1, !tbaa !3
  tail call fastcc void @_ZN12_GLOBAL__N_16Tetris9DrawPieceEj(%"class.<anonymous namespace>::Tetris"* %this, i16 %22)
  %23 = load i16* %piece_y_, align 1, !tbaa !3
  %sub9 = add nsw i16 %23, -1
  %cmp.i22 = icmp slt i16 %sub9, 0
  %a.b.i23 = select i1 %cmp.i22, i16 0, i16 %sub9
  %add12 = add nsw i16 %23, 4
  %cmp.i21 = icmp sgt i16 %add12, 23
  %a.b.i = select i1 %cmp.i21, i16 23, i16 %add12
  %cmp26.i = icmp ult i16 %a.b.i23, %a.b.i
  br i1 %cmp26.i, label %for.body.lr.ph.i, label %return

for.body.lr.ph.i:                                 ; preds = %if.end
  %left_offset_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 8
  %screen_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 0
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc21.i, %for.body.lr.ph.i
  %j.027.i = phi i16 [ %a.b.i23, %for.body.lr.ph.i ], [ %inc22.i, %for.inc21.i ]
  %shr.i = lshr i16 %j.027.i, 1
  %mul.i14 = shl i16 %shr.i, 5
  %24 = load i16* %left_offset_.i, align 1, !tbaa !3
  %add.i15 = add i16 %mul.i14, %24
  %mul5.i = mul i16 %j.027.i, 10
  %and.i = and i16 %j.027.i, 1
  %tobool.i16 = icmp eq i16 %and.i, 0
  br label %for.body4.i

for.body4.i:                                      ; preds = %for.inc.i20, %for.body.i
  %i.025.i = phi i16 [ 0, %for.body.i ], [ %inc.i19, %for.inc.i20 ]
  %screen_idx.024.i = phi i16 [ %add.i15, %for.body.i ], [ %inc20.i, %for.inc.i20 ]
  %add6.i = add i16 %i.025.i, %mul5.i
  %arrayidx.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %add6.i
  %25 = load i16* %arrayidx.i, align 1, !tbaa !3
  %26 = load i16** %screen_.i, align 1, !tbaa !0
  %arrayidx7.i = getelementptr inbounds i16* %26, i16 %screen_idx.024.i
  %27 = load i16* %arrayidx7.i, align 1, !tbaa !3
  br i1 %tobool.i16, label %if.else.i, label %if.then.i18

if.then.i18:                                      ; preds = %for.body4.i
  %and8.i = and i16 %27, 3840
  %shl.i17 = shl i16 %25, 12
  %or.i = or i16 %and8.i, %shl.i17
  br label %for.inc.i20

if.else.i:                                        ; preds = %for.body4.i
  %and14.i = and i16 %27, -4096
  %shl15.i = shl i16 %25, 8
  %or16.i = or i16 %and14.i, %shl15.i
  br label %for.inc.i20

for.inc.i20:                                      ; preds = %if.else.i, %if.then.i18
  %storemerge.in.i = phi i16 [ %or16.i, %if.else.i ], [ %or.i, %if.then.i18 ]
  %storemerge.i = or i16 %storemerge.in.i, 28
  store i16 %storemerge.i, i16* %arrayidx7.i, align 1
  %inc.i19 = add i16 %i.025.i, 1
  %inc20.i = add i16 %screen_idx.024.i, 1
  %exitcond.i = icmp eq i16 %inc.i19, 10
  br i1 %exitcond.i, label %for.inc21.i, label %for.body4.i

for.inc21.i:                                      ; preds = %for.inc.i20
  %inc22.i = add i16 %j.027.i, 1
  %exitcond28.i = icmp eq i16 %inc22.i, %a.b.i
  br i1 %exitcond28.i, label %return, label %for.body.i

return:                                           ; preds = %for.inc21.i, %if.end, %_ZN12_GLOBAL__N_16Tetris9NextPieceEv.exit
  ret void
}

define internal fastcc void @_ZN12_GLOBAL__N_16Tetris9DrawPieceEj(%"class.<anonymous namespace>::Tetris"* nocapture %this, i16 %color) nounwind align 2 {
entry:
  %piece_y_ = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 6
  %0 = load i16* %piece_y_, align 1, !tbaa !3
  %mul = mul nsw i16 %0, 10
  %piece_x_ = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 5
  %1 = load i16* %piece_x_, align 1, !tbaa !3
  %add = add nsw i16 %mul, %1
  %piece_rot_ = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 7
  %2 = load i16* %piece_rot_, align 1, !tbaa !3
  %current_piece_ = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 1
  %3 = load i16* %current_piece_, align 1, !tbaa !3
  %arrayidx2 = getelementptr inbounds [7 x %struct.Tetromino]* @_ZL13tetris_pieces, i16 0, i16 %3, i32 1, i16 %2
  %4 = load i16* %arrayidx2, align 1, !tbaa !3
  br label %for.body

for.body:                                         ; preds = %for.inc.3.for.body_crit_edge, %entry
  %5 = phi i16 [ %1, %entry ], [ %.pre, %for.inc.3.for.body_crit_edge ]
  %playfield_offset.029 = phi i16 [ %add, %entry ], [ %add19, %for.inc.3.for.body_crit_edge ]
  %piece_data.028 = phi i16 [ %4, %entry ], [ %shl.3, %for.inc.3.for.body_crit_edge ]
  %j.027 = phi i16 [ 1, %entry ], [ %phitmp, %for.inc.3.for.body_crit_edge ]
  %tobool = icmp slt i16 %piece_data.028, 0
  %6 = icmp ult i16 %5, 10
  %or.cond = and i1 %tobool, %6
  %7 = icmp ult i16 %playfield_offset.029, 230
  %or.cond22 = and i1 %or.cond, %7
  br i1 %or.cond22, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %arrayidx14 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %playfield_offset.029
  store i16 %color, i16* %arrayidx14, align 1, !tbaa !3
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %inc15 = add nsw i16 %playfield_offset.029, 1
  %inc16 = add nsw i16 %5, 1
  %shl.mask = and i16 %piece_data.028, 16384
  %tobool.1 = icmp ne i16 %shl.mask, 0
  %8 = icmp ult i16 %inc16, 10
  %or.cond.1 = and i1 %tobool.1, %8
  %9 = icmp ult i16 %inc15, 230
  %or.cond22.1 = and i1 %or.cond.1, %9
  br i1 %or.cond22.1, label %if.then.1, label %for.inc.1

for.end20:                                        ; preds = %for.inc.3
  ret void

if.then.1:                                        ; preds = %for.inc
  %arrayidx14.1 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %inc15
  store i16 %color, i16* %arrayidx14.1, align 1, !tbaa !3
  br label %for.inc.1

for.inc.1:                                        ; preds = %if.then.1, %for.inc
  %inc15.1 = add nsw i16 %playfield_offset.029, 2
  %inc16.1 = add nsw i16 %5, 2
  %shl.1.mask = and i16 %piece_data.028, 8192
  %tobool.2 = icmp ne i16 %shl.1.mask, 0
  %10 = icmp ult i16 %inc16.1, 10
  %or.cond.2 = and i1 %tobool.2, %10
  %11 = icmp ult i16 %inc15.1, 230
  %or.cond22.2 = and i1 %or.cond.2, %11
  br i1 %or.cond22.2, label %if.then.2, label %for.inc.2

if.then.2:                                        ; preds = %for.inc.1
  %arrayidx14.2 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %inc15.1
  store i16 %color, i16* %arrayidx14.2, align 1, !tbaa !3
  br label %for.inc.2

for.inc.2:                                        ; preds = %if.then.2, %for.inc.1
  %inc15.2 = add nsw i16 %playfield_offset.029, 3
  %inc16.2 = add nsw i16 %5, 3
  %shl.2.mask = and i16 %piece_data.028, 4096
  %tobool.3 = icmp ne i16 %shl.2.mask, 0
  %12 = icmp ult i16 %inc16.2, 10
  %or.cond.3 = and i1 %tobool.3, %12
  %13 = icmp ult i16 %inc15.2, 230
  %or.cond22.3 = and i1 %or.cond.3, %13
  br i1 %or.cond22.3, label %if.then.3, label %for.inc.3

if.then.3:                                        ; preds = %for.inc.2
  %arrayidx14.3 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %inc15.2
  store i16 %color, i16* %arrayidx14.3, align 1, !tbaa !3
  br label %for.inc.3

for.inc.3:                                        ; preds = %if.then.3, %for.inc.2
  %exitcond = icmp eq i16 %j.027, 4
  br i1 %exitcond, label %for.end20, label %for.inc.3.for.body_crit_edge

for.inc.3.for.body_crit_edge:                     ; preds = %for.inc.3
  %add19 = add i16 %playfield_offset.029, 10
  %shl.3 = shl i16 %piece_data.028, 4
  %.pre = load i16* %piece_x_, align 1, !tbaa !3
  %phitmp = add i16 %j.027, 1
  br label %for.body
}

define internal fastcc void @_ZN12_GLOBAL__N_16Tetris13ShufflePiecesEv(%"class.<anonymous namespace>::Tetris"* nocapture %this) nounwind align 2 {
entry:
  %arrayidx = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 3, i16 0
  %rand_state_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 13
  %0 = load i16* %rand_state_.i, align 1, !tbaa !3
  %mul.i = mul i16 %0, -1991
  %shr.i = lshr i16 %mul.i, 7
  %shl.i = mul i16 %0, 29184
  %or.i = or i16 %shr.i, %shl.i
  %sub.i = sub i16 %mul.i, %or.i
  %arrayidx5 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 3, i16 1
  store i16 0, i16* %arrayidx5, align 1, !tbaa !3
  store i16 1, i16* %arrayidx, align 1, !tbaa !3
  %mul.i.1 = mul i16 %sub.i, -1991
  %shr.i.1 = lshr i16 %mul.i.1, 7
  %shl.i.1 = mul i16 %sub.i, 29184
  %or.i.1 = or i16 %shr.i.1, %shl.i.1
  %sub.i.1 = sub i16 %mul.i.1, %or.i.1
  store i16 %sub.i.1, i16* %rand_state_.i, align 1, !tbaa !3
  %rem.1 = and i16 %sub.i.1, 1
  %arrayidx3.1 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 3, i16 %rem.1
  %1 = load i16* %arrayidx3.1, align 1, !tbaa !3
  %arrayidx5.1 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 3, i16 2
  store i16 %1, i16* %arrayidx5.1, align 1, !tbaa !3
  store i16 2, i16* %arrayidx3.1, align 1, !tbaa !3
  %2 = load i16* %rand_state_.i, align 1, !tbaa !3
  %mul.i.2 = mul i16 %2, -1991
  %shr.i.2 = lshr i16 %mul.i.2, 7
  %shl.i.2 = mul i16 %2, 29184
  %or.i.2 = or i16 %shr.i.2, %shl.i.2
  %sub.i.2 = sub i16 %mul.i.2, %or.i.2
  store i16 %sub.i.2, i16* %rand_state_.i, align 1, !tbaa !3
  %rem.2 = urem i16 %sub.i.2, 3
  %arrayidx3.2 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 3, i16 %rem.2
  %3 = load i16* %arrayidx3.2, align 1, !tbaa !3
  %arrayidx5.2 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 3, i16 3
  store i16 %3, i16* %arrayidx5.2, align 1, !tbaa !3
  store i16 3, i16* %arrayidx3.2, align 1, !tbaa !3
  %4 = load i16* %rand_state_.i, align 1, !tbaa !3
  %mul.i.3 = mul i16 %4, -1991
  %shr.i.3 = lshr i16 %mul.i.3, 7
  %shl.i.3 = mul i16 %4, 29184
  %or.i.3 = or i16 %shr.i.3, %shl.i.3
  %sub.i.3 = sub i16 %mul.i.3, %or.i.3
  store i16 %sub.i.3, i16* %rand_state_.i, align 1, !tbaa !3
  %rem.3 = and i16 %sub.i.3, 3
  %arrayidx3.3 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 3, i16 %rem.3
  %5 = load i16* %arrayidx3.3, align 1, !tbaa !3
  %arrayidx5.3 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 3, i16 4
  store i16 %5, i16* %arrayidx5.3, align 1, !tbaa !3
  store i16 4, i16* %arrayidx3.3, align 1, !tbaa !3
  %6 = load i16* %rand_state_.i, align 1, !tbaa !3
  %mul.i.4 = mul i16 %6, -1991
  %shr.i.4 = lshr i16 %mul.i.4, 7
  %shl.i.4 = mul i16 %6, 29184
  %or.i.4 = or i16 %shr.i.4, %shl.i.4
  %sub.i.4 = sub i16 %mul.i.4, %or.i.4
  store i16 %sub.i.4, i16* %rand_state_.i, align 1, !tbaa !3
  %rem.4 = urem i16 %sub.i.4, 5
  %arrayidx3.4 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 3, i16 %rem.4
  %7 = load i16* %arrayidx3.4, align 1, !tbaa !3
  %arrayidx5.4 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 3, i16 5
  store i16 %7, i16* %arrayidx5.4, align 1, !tbaa !3
  store i16 5, i16* %arrayidx3.4, align 1, !tbaa !3
  %8 = load i16* %rand_state_.i, align 1, !tbaa !3
  %mul.i.5 = mul i16 %8, -1991
  %shr.i.5 = lshr i16 %mul.i.5, 7
  %shl.i.5 = mul i16 %8, 29184
  %or.i.5 = or i16 %shr.i.5, %shl.i.5
  %sub.i.5 = sub i16 %mul.i.5, %or.i.5
  store i16 %sub.i.5, i16* %rand_state_.i, align 1, !tbaa !3
  %rem.5 = urem i16 %sub.i.5, 6
  %arrayidx3.5 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 3, i16 %rem.5
  %9 = load i16* %arrayidx3.5, align 1, !tbaa !3
  %arrayidx5.5 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 3, i16 6
  store i16 %9, i16* %arrayidx5.5, align 1, !tbaa !3
  store i16 6, i16* %arrayidx3.5, align 1, !tbaa !3
  %screen_ = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 0
  %10 = load i16* %arrayidx, align 1, !tbaa !3
  %add = add i16 %10, 3888
  %11 = load i16** %screen_, align 1, !tbaa !0
  store i16 %add, i16* %11, align 1, !tbaa !3
  %12 = load i16* %arrayidx5, align 1, !tbaa !3
  %add.1 = add i16 %12, 3888
  %arrayidx14.1 = getelementptr inbounds i16* %11, i16 1
  store i16 %add.1, i16* %arrayidx14.1, align 1, !tbaa !3
  %13 = load i16* %arrayidx5.1, align 1, !tbaa !3
  %add.2 = add i16 %13, 3888
  %arrayidx14.2 = getelementptr inbounds i16* %11, i16 2
  store i16 %add.2, i16* %arrayidx14.2, align 1, !tbaa !3
  %14 = load i16* %arrayidx5.2, align 1, !tbaa !3
  %add.3 = add i16 %14, 3888
  %arrayidx14.3 = getelementptr inbounds i16* %11, i16 3
  store i16 %add.3, i16* %arrayidx14.3, align 1, !tbaa !3
  %15 = load i16* %arrayidx5.3, align 1, !tbaa !3
  %add.4 = add i16 %15, 3888
  %arrayidx14.4 = getelementptr inbounds i16* %11, i16 4
  store i16 %add.4, i16* %arrayidx14.4, align 1, !tbaa !3
  %16 = load i16* %arrayidx5.4, align 1, !tbaa !3
  %add.5 = add i16 %16, 3888
  %arrayidx14.5 = getelementptr inbounds i16* %11, i16 5
  store i16 %add.5, i16* %arrayidx14.5, align 1, !tbaa !3
  %17 = load i16* %arrayidx5.5, align 1, !tbaa !3
  %add.6 = add i16 %17, 3888
  %arrayidx14.6 = getelementptr inbounds i16* %11, i16 6
  store i16 %add.6, i16* %arrayidx14.6, align 1, !tbaa !3
  ret void
}

declare i16* @memset(i16*, i16, i16)

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA"}
!3 = metadata !{metadata !"int", metadata !1}
!4 = metadata !{i32 1062, i32 1074, i32 1086}
!5 = metadata !{metadata !"long", metadata !1}
