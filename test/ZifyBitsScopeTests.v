From Stdlib Require Import ZArith Lia Zmod.
Require coqutil.Word.ZifyBitsAll.
Local Open Scope Z_scope.

(* Without Import the instances are not registered: a plain lia is unchanged. *)
Goal forall x : Zmod.Zmod (2 ^ 32), Zmod.unsigned x < 2 ^ 32.
Proof. intros. Fail lia. Abort.

Import coqutil.Word.ZifyBitsAll.Instances.
Goal forall x : Zmod.Zmod (2 ^ 32), Zmod.unsigned x < 2 ^ 32.
Proof. intros. coqutil.Word.ZifyBits.bits_lia. Qed.
