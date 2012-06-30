target datalayout = "e-p:16:16:16-i8:16:16-i16:16:16-i32:16:16-s0:16:16-n16"
target triple = "dcpu16"

%struct.Tetromino = type { i16, [4 x i16] }
%"class.<anonymous namespace>::Tetris" = type { i16*, i16, i16, [7 x i16], i16, i16, i16, i16, i16, i16, i16, i32, i32, i32, [230 x i16] }

@_ZL13tetris_pieces = internal unnamed_addr constant [7 x %struct.Tetromino] [%struct.Tetromino { i16 11, [4 x i16] [i16 3840, i16 8738, i16 240, i16 17476] }, %struct.Tetromino { i16 14, [4 x i16] [i16 26112, i16 26112, i16 26112, i16 26112] }, %struct.Tetromino { i16 5, [4 x i16] [i16 19968, i16 17984, i16 3648, i16 19520] }, %struct.Tetromino { i16 10, [4 x i16] [i16 27648, i16 17952, i16 1728, i16 -29632] }, %struct.Tetromino { i16 9, [4 x i16] [i16 -14848, i16 9792, i16 3168, i16 19584] }, %struct.Tetromino { i16 1, [4 x i16] [i16 -29184, i16 25664, i16 3616, i16 17600] }, %struct.Tetromino { i16 6, [4 x i16] [i16 11776, i16 17504, i16 3712, i16 -15296] }], align 1
@_hw_screen = external global i16

define internal fastcc void @_ZN12_GLOBAL__N_16Tetris4DropEv(%"class.<anonymous namespace>::Tetris"* %this) nounwind align 2 {
entry:
  %lines.i = alloca [10 x i16], align 1
  call fastcc void @_ZN12_GLOBAL__N_16Tetris9DrawPieceEj(%"class.<anonymous namespace>::Tetris"* %this, i16 0)
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
  call fastcc void @_ZN12_GLOBAL__N_16Tetris9DrawPieceEj(%"class.<anonymous namespace>::Tetris"* %this, i16 %7)
  %8 = load i16* %piece_y_, align 1, !tbaa !3
  %sub = add nsw i16 %8, -1
  %cmp.i24 = icmp slt i16 %sub, 0
  %a.b.i25 = select i1 %cmp.i24, i16 0, i16 %sub
  %add = add nsw i16 %8, 4
  %cmp.i34 = icmp sgt i16 %add, 23
  %a.b.i35 = select i1 %cmp.i34, i16 23, i16 %add
  %cmp26.i43 = icmp ult i16 %a.b.i25, %a.b.i35
  br i1 %cmp26.i43, label %for.body.lr.ph.i46, label %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit78

for.body.lr.ph.i46:                               ; preds = %if.then
  %left_offset_.i44 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 8
  %screen_.i45 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 0
  br label %for.body.i54

for.body.i54:                                     ; preds = %for.inc21.i77, %for.body.lr.ph.i46
  %j.027.i47 = phi i16 [ %a.b.i25, %for.body.lr.ph.i46 ], [ %inc22.i75, %for.inc21.i77 ]
  %shr.i48 = lshr i16 %j.027.i47, 1
  %mul.i49 = shl i16 %shr.i48, 5
  %9 = load i16* %left_offset_.i44, align 1, !tbaa !3
  %add.i50 = add i16 %mul.i49, %9
  %mul5.i51 = mul i16 %j.027.i47, 10
  %and.i52 = and i16 %j.027.i47, 1
  %tobool.i53 = icmp eq i16 %and.i52, 0
  br label %for.body4.i60

for.body4.i60:                                    ; preds = %for.inc.i74, %for.body.i54
  %i.025.i55 = phi i16 [ 0, %for.body.i54 ], [ %inc.i71, %for.inc.i74 ]
  %screen_idx.024.i56 = phi i16 [ %add.i50, %for.body.i54 ], [ %inc20.i72, %for.inc.i74 ]
  %add6.i57 = add i16 %i.025.i55, %mul5.i51
  %arrayidx.i58 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %add6.i57
  %10 = load i16* %arrayidx.i58, align 1, !tbaa !3
  %11 = load i16** %screen_.i45, align 1, !tbaa !0
  %arrayidx7.i59 = getelementptr inbounds i16* %11, i16 %screen_idx.024.i56
  %12 = load i16* %arrayidx7.i59, align 1, !tbaa !3
  br i1 %tobool.i53, label %if.else.i68, label %if.then.i64

if.then.i64:                                      ; preds = %for.body4.i60
  %and8.i61 = and i16 %12, 3840
  %shl.i62 = shl i16 %10, 12
  %or.i63 = or i16 %and8.i61, %shl.i62
  br label %for.inc.i74

if.else.i68:                                      ; preds = %for.body4.i60
  %and14.i65 = and i16 %12, -4096
  %shl15.i66 = shl i16 %10, 8
  %or16.i67 = or i16 %and14.i65, %shl15.i66
  br label %for.inc.i74

for.inc.i74:                                      ; preds = %if.else.i68, %if.then.i64
  %storemerge.in.i69 = phi i16 [ %or16.i67, %if.else.i68 ], [ %or.i63, %if.then.i64 ]
  %storemerge.i70 = or i16 %storemerge.in.i69, 28
  store i16 %storemerge.i70, i16* %arrayidx7.i59, align 1
  %inc.i71 = add i16 %i.025.i55, 1
  %inc20.i72 = add i16 %screen_idx.024.i56, 1
  %exitcond.i73 = icmp eq i16 %inc.i71, 10
  br i1 %exitcond.i73, label %for.inc21.i77, label %for.body4.i60

for.inc21.i77:                                    ; preds = %for.inc.i74
  %inc22.i75 = add i16 %j.027.i47, 1
  %exitcond28.i76 = icmp eq i16 %inc22.i75, %a.b.i35
  br i1 %exitcond28.i76, label %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit78, label %for.body.i54

_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit78: ; preds = %for.inc21.i77, %if.then
  %13 = bitcast [10 x i16]* %lines.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %13)
  %lines_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 12
  br label %for.body.i36

for.body.i36:                                     ; preds = %for.inc.i41, %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit78
  %j.09.i = phi i16 [ 0, %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit78 ], [ %inc3.i, %for.inc.i41 ]
  %nlines.08.i = phi i16 [ 0, %_ZN12_GLOBAL__N_16Tetris13BlitPlayfieldEjj.exit78 ], [ %nlines.1.i, %for.inc.i41 ]
  %mul.i.i = mul nsw i16 %j.09.i, 10
  br label %for.cond.i.i

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body.i36
  %i.0.i.i = phi i16 [ 0, %for.body.i36 ], [ %inc.i.i, %for.body.i.i ]
  %cmp.i.i = icmp slt i16 %i.0.i.i, 10
  br i1 %cmp.i.i, label %for.body.i.i, label %if.then.i39

for.body.i.i:                                     ; preds = %for.cond.i.i
  %add.i.i = add nsw i16 %i.0.i.i, %mul.i.i
  %arrayidx.i.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %add.i.i
  %14 = load i16* %arrayidx.i.i, align 1, !tbaa !3
  %cmp2.i.i = icmp eq i16 %14, 0
  %inc.i.i = add nsw i16 %i.0.i.i, 1
  br i1 %cmp2.i.i, label %for.cond.i.i, label %for.inc.i41

if.then.i39:                                      ; preds = %for.cond.i.i
  %inc.i37 = add nsw i16 %nlines.08.i, 1
  ;%arrayidx.i38 = getelementptr inbounds [10 x i16]* %lines.i, i16 0, i16 %nlines.08.i
  %arrayidx.i38 = getelementptr inbounds [10 x i16]* %lines.i, i16 0, i16 0
  ;;;;;;;; either of these instructions crash it
  ;store i16 %j.09.i, i16* %arrayidx.i38, align 1, !tbaa !3
  ;store i16 0, i16* %arrayidx.i38, align 1, !tbaa !3
  %15 = load i32* %lines_.i, align 1, !tbaa !5
  %inc2.i = add i32 %15, 1
  store i32 %inc2.i, i32* %lines_.i, align 1, !tbaa !5
  br label %for.inc.i41

for.inc.i41:                                      ; preds = %for.body.i.i, %if.then.i39
  %nlines.1.i = phi i16 [ %inc.i37, %if.then.i39 ], [ %nlines.08.i, %for.body.i.i ]
  %inc3.i = add nsw i16 %j.09.i, 1
  %exitcond.i40 = icmp eq i16 %inc3.i, 23
  br i1 %exitcond.i40, label %for.end.i, label %for.body.i36

for.end.i:                                        ; preds = %for.inc.i41
  %tobool.i42 = icmp eq i16 %nlines.1.i, 0
  br i1 %tobool.i42, label %_ZN12_GLOBAL__N_16Tetris10CheckLinesEv.exit, label %if.then4.i

if.then4.i:                                       ; preds = %for.end.i
  %arrayidx5.i = getelementptr inbounds [10 x i16]* %lines.i, i16 0, i16 0
  %16 = load i16* %arrayidx5.i, align 1, !tbaa !3
  %arrayidx6.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %16
  store i16 0, i16* %arrayidx6.i, align 1, !tbaa !3
  br label %_ZN12_GLOBAL__N_16Tetris10CheckLinesEv.exit

_ZN12_GLOBAL__N_16Tetris10CheckLinesEv.exit:      ; preds = %for.end.i, %if.then4.i
  call void @llvm.lifetime.end(i64 -1, i8* %13)
  %next_piece_idx_.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 2
  %17 = load i16* %next_piece_idx_.i, align 1, !tbaa !3
  %arrayidx.i26 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 3, i16 %17
  %18 = load i16* %arrayidx.i26, align 1, !tbaa !3
  store i16 %18, i16* %current_piece_.i, align 1, !tbaa !3
  %color.i = getelementptr inbounds [7 x %struct.Tetromino]* @_ZL13tetris_pieces, i16 0, i16 %18, i32 0
  %19 = load i16* %color.i, align 1, !tbaa !3
  store i16 %19, i16* %current_color_, align 1, !tbaa !3
  %inc.i28 = add i16 %17, 1
  store i16 %inc.i28, i16* %next_piece_idx_.i, align 1, !tbaa !3
  %cmp.i29 = icmp eq i16 %inc.i28, 7
  br i1 %cmp.i29, label %if.then.i30, label %_ZN12_GLOBAL__N_16Tetris9NextPieceEv.exit

if.then.i30:                                      ; preds = %_ZN12_GLOBAL__N_16Tetris10CheckLinesEv.exit
  call fastcc void @_ZN12_GLOBAL__N_16Tetris13ShufflePiecesEv(%"class.<anonymous namespace>::Tetris"* %this) nounwind
  store i16 0, i16* %next_piece_idx_.i, align 1, !tbaa !3
  br label %_ZN12_GLOBAL__N_16Tetris9NextPieceEv.exit

_ZN12_GLOBAL__N_16Tetris9NextPieceEv.exit:        ; preds = %_ZN12_GLOBAL__N_16Tetris10CheckLinesEv.exit, %if.then.i30
  store i16 3, i16* %piece_x_.i, align 1, !tbaa !3
  store i16 -1, i16* %piece_y_, align 1, !tbaa !3
  store i16 0, i16* %piece_rot_.i, align 1, !tbaa !3
  br label %return

if.end:                                           ; preds = %for.cond.i
  %current_color_7 = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 4
  %20 = load i16* %current_color_7, align 1, !tbaa !3
  call fastcc void @_ZN12_GLOBAL__N_16Tetris9DrawPieceEj(%"class.<anonymous namespace>::Tetris"* %this, i16 %20)
  %21 = load i16* %piece_y_, align 1, !tbaa !3
  %sub9 = add nsw i16 %21, -1
  %cmp.i22 = icmp slt i16 %sub9, 0
  %a.b.i23 = select i1 %cmp.i22, i16 0, i16 %sub9
  %add12 = add nsw i16 %21, 4
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
  %22 = load i16* %left_offset_.i, align 1, !tbaa !3
  %add.i15 = add i16 %mul.i14, %22
  %mul5.i = mul i16 %j.027.i, 10
  %and.i = and i16 %j.027.i, 1
  %tobool.i16 = icmp eq i16 %and.i, 0
  br label %for.body4.i

for.body4.i:                                      ; preds = %for.inc.i20, %for.body.i
  %i.025.i = phi i16 [ 0, %for.body.i ], [ %inc.i19, %for.inc.i20 ]
  %screen_idx.024.i = phi i16 [ %add.i15, %for.body.i ], [ %inc20.i, %for.inc.i20 ]
  %add6.i = add i16 %i.025.i, %mul5.i
  %arrayidx.i = getelementptr inbounds %"class.<anonymous namespace>::Tetris"* %this, i16 0, i32 14, i16 %add6.i
  %23 = load i16* %arrayidx.i, align 1, !tbaa !3
  %24 = load i16** %screen_.i, align 1, !tbaa !0
  %arrayidx7.i = getelementptr inbounds i16* %24, i16 %screen_idx.024.i
  %25 = load i16* %arrayidx7.i, align 1, !tbaa !3
  br i1 %tobool.i16, label %if.else.i, label %if.then.i18

if.then.i18:                                      ; preds = %for.body4.i
  %and8.i = and i16 %25, 3840
  %shl.i17 = shl i16 %23, 12
  %or.i = or i16 %and8.i, %shl.i17
  br label %for.inc.i20

if.else.i:                                        ; preds = %for.body4.i
  %and14.i = and i16 %25, -4096
  %shl15.i = shl i16 %23, 8
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

declare i16* @memset(i16*, i16, i16)

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
declare fastcc void @_ZN12_GLOBAL__N_16Tetris13ShufflePiecesEv(%"class.<anonymous namespace>::Tetris"* nocapture %this) nounwind;
declare fastcc void @_ZN12_GLOBAL__N_16Tetris9DrawPieceEj(%"class.<anonymous namespace>::Tetris"* nocapture %this, i16 %color) nounwind;

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA"}
!3 = metadata !{metadata !"int", metadata !1}
!4 = metadata !{i32 1062, i32 1074, i32 1086}
!5 = metadata !{metadata !"long", metadata !1}
