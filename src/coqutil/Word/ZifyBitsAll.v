(* Zify instances for every literal word width used in the codebase, so that
   [lia] (and [bits_lia]) see [bits 8], [bits 16], [bits 32] and [bits 64].
   To add a width, add a two-line module below. *)
From Stdlib Require Import ZArith.
Require Export coqutil.Word.ZifyBits.
Local Open Scope Z_scope.

Module Width8 <: ZifyBitsWidth.
  Definition width : Z := 8. Lemma width_pos : 0 < width. Proof. reflexivity. Qed.
End Width8.
Module Width16 <: ZifyBitsWidth.
  Definition width : Z := 16. Lemma width_pos : 0 < width. Proof. reflexivity. Qed.
End Width16.
Module Width32 <: ZifyBitsWidth.
  Definition width : Z := 32. Lemma width_pos : 0 < width. Proof. reflexivity. Qed.
End Width32.
Module Width64 <: ZifyBitsWidth.
  Definition width : Z := 64. Lemma width_pos : 0 < width. Proof. reflexivity. Qed.
End Width64.

Module ZifyBits8 := ZifyBits Width8.
Module ZifyBits16 := ZifyBits Width16.
Module ZifyBits32 := ZifyBits Width32.
Module ZifyBits64 := ZifyBits Width64.

(* Registration with zify, scoped by Import: [Import ZifyBitsAll.Instances]
   (or one width module) activates the instances in the current file only. *)
Module ZifyZ.
  #[export] Add Zify BinOp Op_Z_shiftl.
  #[export] Add Zify BinOpSpec ZshiftlSpec.
  #[export] Add Zify BinOp Op_Z_shiftr.
  #[export] Add Zify BinOpSpec ZshiftrSpec.
  #[export] Add Zify UnOp Op_Z_ones.
  #[export] Add Zify UnOpSpec ZonesSpec.
End ZifyZ.
Module Zify8.
  #[export] Add Zify InjTyp ZifyBits8.Inj_word_Z.
  #[export] Add Zify BinRel ZifyBits8.Op_eq.
  #[export] Add Zify UnOp ZifyBits8.Op_unsigned.
  #[export] Add Zify UnOp ZifyBits8.Op_signed.
  #[export] Add Zify UnOp ZifyBits8.Op_of_Z.
  #[export] Add Zify CstOp ZifyBits8.Op_zero.
  #[export] Add Zify CstOp ZifyBits8.Op_one.
  #[export] Add Zify BinOp ZifyBits8.Op_add.
  #[export] Add Zify BinOp ZifyBits8.Op_sub.
  #[export] Add Zify BinOp ZifyBits8.Op_mul.
  #[export] Add Zify UnOp ZifyBits8.Op_opp.
  #[export] Add Zify BinOp ZifyBits8.Op_and.
  #[export] Add Zify BinOp ZifyBits8.Op_or.
  #[export] Add Zify BinOp ZifyBits8.Op_xor.
  #[export] Add Zify BinOp ZifyBits8.Op_ndn.
  #[export] Add Zify UnOp ZifyBits8.Op_not.
  #[export] Add Zify BinOp ZifyBits8.Op_slu.
  #[export] Add Zify BinOp ZifyBits8.Op_sru.
  #[export] Add Zify BinOp ZifyBits8.Op_srs.
  #[export] Add Zify BinOp ZifyBits8.Op_umod.
  #[export] Add Zify BinOp ZifyBits8.Op_udiv.
  #[export] Add Zify BinOpSpec ZifyBits8.ZudivSpec.
  #[export] Add Zify BinOp ZifyBits8.Op_eqb.
End Zify8.
Module Zify16.
  #[export] Add Zify InjTyp ZifyBits16.Inj_word_Z.
  #[export] Add Zify BinRel ZifyBits16.Op_eq.
  #[export] Add Zify UnOp ZifyBits16.Op_unsigned.
  #[export] Add Zify UnOp ZifyBits16.Op_signed.
  #[export] Add Zify UnOp ZifyBits16.Op_of_Z.
  #[export] Add Zify CstOp ZifyBits16.Op_zero.
  #[export] Add Zify CstOp ZifyBits16.Op_one.
  #[export] Add Zify BinOp ZifyBits16.Op_add.
  #[export] Add Zify BinOp ZifyBits16.Op_sub.
  #[export] Add Zify BinOp ZifyBits16.Op_mul.
  #[export] Add Zify UnOp ZifyBits16.Op_opp.
  #[export] Add Zify BinOp ZifyBits16.Op_and.
  #[export] Add Zify BinOp ZifyBits16.Op_or.
  #[export] Add Zify BinOp ZifyBits16.Op_xor.
  #[export] Add Zify BinOp ZifyBits16.Op_ndn.
  #[export] Add Zify UnOp ZifyBits16.Op_not.
  #[export] Add Zify BinOp ZifyBits16.Op_slu.
  #[export] Add Zify BinOp ZifyBits16.Op_sru.
  #[export] Add Zify BinOp ZifyBits16.Op_srs.
  #[export] Add Zify BinOp ZifyBits16.Op_umod.
  #[export] Add Zify BinOp ZifyBits16.Op_udiv.
  #[export] Add Zify BinOpSpec ZifyBits16.ZudivSpec.
  #[export] Add Zify BinOp ZifyBits16.Op_eqb.
End Zify16.
Module Zify32.
  #[export] Add Zify InjTyp ZifyBits32.Inj_word_Z.
  #[export] Add Zify BinRel ZifyBits32.Op_eq.
  #[export] Add Zify UnOp ZifyBits32.Op_unsigned.
  #[export] Add Zify UnOp ZifyBits32.Op_signed.
  #[export] Add Zify UnOp ZifyBits32.Op_of_Z.
  #[export] Add Zify CstOp ZifyBits32.Op_zero.
  #[export] Add Zify CstOp ZifyBits32.Op_one.
  #[export] Add Zify BinOp ZifyBits32.Op_add.
  #[export] Add Zify BinOp ZifyBits32.Op_sub.
  #[export] Add Zify BinOp ZifyBits32.Op_mul.
  #[export] Add Zify UnOp ZifyBits32.Op_opp.
  #[export] Add Zify BinOp ZifyBits32.Op_and.
  #[export] Add Zify BinOp ZifyBits32.Op_or.
  #[export] Add Zify BinOp ZifyBits32.Op_xor.
  #[export] Add Zify BinOp ZifyBits32.Op_ndn.
  #[export] Add Zify UnOp ZifyBits32.Op_not.
  #[export] Add Zify BinOp ZifyBits32.Op_slu.
  #[export] Add Zify BinOp ZifyBits32.Op_sru.
  #[export] Add Zify BinOp ZifyBits32.Op_srs.
  #[export] Add Zify BinOp ZifyBits32.Op_umod.
  #[export] Add Zify BinOp ZifyBits32.Op_udiv.
  #[export] Add Zify BinOpSpec ZifyBits32.ZudivSpec.
  #[export] Add Zify BinOp ZifyBits32.Op_eqb.
End Zify32.
Module Zify64.
  #[export] Add Zify InjTyp ZifyBits64.Inj_word_Z.
  #[export] Add Zify BinRel ZifyBits64.Op_eq.
  #[export] Add Zify UnOp ZifyBits64.Op_unsigned.
  #[export] Add Zify UnOp ZifyBits64.Op_signed.
  #[export] Add Zify UnOp ZifyBits64.Op_of_Z.
  #[export] Add Zify CstOp ZifyBits64.Op_zero.
  #[export] Add Zify CstOp ZifyBits64.Op_one.
  #[export] Add Zify BinOp ZifyBits64.Op_add.
  #[export] Add Zify BinOp ZifyBits64.Op_sub.
  #[export] Add Zify BinOp ZifyBits64.Op_mul.
  #[export] Add Zify UnOp ZifyBits64.Op_opp.
  #[export] Add Zify BinOp ZifyBits64.Op_and.
  #[export] Add Zify BinOp ZifyBits64.Op_or.
  #[export] Add Zify BinOp ZifyBits64.Op_xor.
  #[export] Add Zify BinOp ZifyBits64.Op_ndn.
  #[export] Add Zify UnOp ZifyBits64.Op_not.
  #[export] Add Zify BinOp ZifyBits64.Op_slu.
  #[export] Add Zify BinOp ZifyBits64.Op_sru.
  #[export] Add Zify BinOp ZifyBits64.Op_srs.
  #[export] Add Zify BinOp ZifyBits64.Op_umod.
  #[export] Add Zify BinOp ZifyBits64.Op_udiv.
  #[export] Add Zify BinOpSpec ZifyBits64.ZudivSpec.
  #[export] Add Zify BinOp ZifyBits64.Op_eqb.
End Zify64.
Module Instances.
  Export ZifyZ.
  Export Zify8.
  Export Zify16.
  Export Zify32.
  Export Zify64.
End Instances.
