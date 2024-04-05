Section Combinators.

  Context [State: Type] (step: State -> (State -> Prop) -> Prop).

  Inductive eventually(P: State -> Prop)(initial: State): Prop :=
    | eventually_done:
        P initial ->
        eventually P initial
    | eventually_step: forall midset,
        step initial midset ->
        (forall mid, midset mid -> eventually P mid) ->
        eventually P initial.

  Hint Constructors eventually : eventually_hints.

  Lemma eventually_trans: forall P Q initial,
    eventually P initial ->
    (forall middle, P middle -> eventually Q middle) ->
    eventually Q initial.
  Proof.
    induction 1; eauto with eventually_hints.
  Qed.

  Hint Resolve eventually_trans : eventually_hints.

  Lemma eventually_weaken: forall (P Q : State -> Prop) initial,
    eventually P initial ->
    (forall final, P final -> Q final) ->
    eventually Q initial.
  Proof.
    eauto with eventually_hints.
  Qed.

  Lemma eventually_step_cps: forall initial P,
      step initial (eventually P) ->
      eventually P initial.
  Proof. intros. eapply eventually_step; eauto. Qed.

  Lemma eventually_trans_cps: forall (Q : State -> Prop) (initial : State),
      eventually (eventually Q) initial ->
      eventually Q initial.
  Proof.
    intros. eapply eventually_trans; eauto.
  Qed.

  Inductive always(P: State -> Prop)(initial: State): Prop :=
  | mk_always
      (invariant: State -> Prop)
      (Establish: invariant initial)
      (Preserve: forall s, invariant s -> step s invariant)
      (Use: forall s, invariant s -> P s).

  CoInductive always' (P : State -> Prop) s : Prop := always'_step {
    hd_always' : P s; Q ; _ : step s Q; _ s' : Q s' -> always' P s' }.

  CoFixpoint always'_always P s : always P s -> always' P s.
  Proof. inversion 1; esplit; eauto using mk_always. Qed.

  Context (step_weaken: forall s P Q, (forall x, P x -> Q x) -> step s P -> step s Q).

  Lemma tl_always' P s : always' P s -> step s (always' P).
  Proof. inversion 1; eauto. Qed.

  Lemma always_always' P s : always' P s -> always P s.
  Proof. exists (always' P); try inversion 1; eauto. Qed.

  Lemma always_elim: forall P initial,
    always P initial -> P initial /\ step initial (always P).
  Proof. inversion 1; eauto 6 using mk_always. Qed.
End Combinators.
