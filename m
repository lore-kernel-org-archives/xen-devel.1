From: Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Mon, 29 Oct 2018 16:46:39 +0000
Message-ID: <VI1PR0302MB2688EA7F3491240166982F9DE6F30@VI1PR0302MB2688.eurprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8171908769833357657=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "andre.przywara@arm.com" <andre.przywara@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============8171908769833357657==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR0302MB2688EA7F3491240166982F9DE6F30VI1PR0302MB2688_"

--_000_VI1PR0302MB2688EA7F3491240166982F9DE6F30VI1PR0302MB2688_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Julien

On 29.10.18 15:36, Julien Grall wrote:0
I wrote down an answer yesterday (sent it today) to your previous
answer. You may use the LRs information from the previous guest trap as
interrupts are re-enabled before storing the LRs.

Yes, it is the case. I've overlooked that for some exceptions interrupts ar=
e enabled before enter_hypervisor_head().


Can you try the patch below?

I tried it, and it works like a charm for the issue.

The only notice here is that I suppose it coul



commit 11e360b93be81a58a41832d714f33f797ad312a9
Author: Julien Grall <julien.grall@arm.com><mailto:julien.grall@arm.com>
Date:   Mon Oct 29 13:32:56 2018 +0000

    xen/arm: Re-enable interrupt later in the trap path

    Signed-off-by: Julien Grall <julien.grall@arm.com><mailto:julien.grall@=
arm.com>

diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index 97b05f53ea..8f287891b6 100644
--- a/xen/arch/arm/arm64/entry.S
+++ b/xen/arch/arm/arm64/entry.S
@@ -195,7 +195,6 @@ hyp_error_invalid:

 hyp_error:
         entry   hyp=3D1
-        msr     daifclr, #2
         mov     x0, sp
         bl      do_trap_hyp_serror
         exit    hyp=3D1
@@ -203,7 +202,7 @@ hyp_error:
 /* Traps taken in Current EL with SP_ELx */
 hyp_sync:
         entry   hyp=3D1
-        msr     daifclr, #6
+        msr     daifclr, #4
         mov     x0, sp
         bl      do_trap_hyp_sync
         exit    hyp=3D1
@@ -304,7 +303,7 @@ guest_sync_slowpath:
         ALTERNATIVE("bl check_pending_vserror; cbnz x0, 1f",
                     "nop; nop",
                     SKIP_SYNCHRONIZE_SERROR_ENTRY_EXIT)
-        msr     daifclr, #6
+        msr     daifclr, #4
         mov     x0, sp
         bl      do_trap_guest_sync
 1:
@@ -332,7 +331,7 @@ guest_fiq_invalid:

 guest_error:
         entry   hyp=3D0, compat=3D0
-        msr     daifclr, #6
+        msr     daifclr, #4
         mov     x0, sp
         bl      do_trap_guest_serror
         exit    hyp=3D0, compat=3D0
@@ -347,7 +346,7 @@ guest_sync_compat:
         ALTERNATIVE("bl check_pending_vserror; cbnz x0, 1f",
                     "nop; nop",
                     SKIP_SYNCHRONIZE_SERROR_ENTRY_EXIT)
-        msr     daifclr, #6
+        msr     daifclr, #4
         mov     x0, sp
         bl      do_trap_guest_sync
 1:
@@ -375,7 +374,7 @@ guest_fiq_invalid_compat:

 guest_error_compat:
         entry   hyp=3D0, compat=3D1
-        msr     daifclr, #6
+        msr     daifclr, #4
         mov     x0, sp
         bl      do_trap_guest_serror
         exit    hyp=3D0, compat=3D1
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 51d2e42c77..c18f89b41f 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2039,6 +2039,8 @@ static void enter_hypervisor_head(struct cpu_user_reg=
s *regs)
     {
         struct vcpu *v =3D current;

+        ASSERT(!local_irq_is_enabled());
+
         /* If the guest has disabled the workaround, bring it back on. */
         if ( needs_ssbd_flip(v) )
             arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1, NULL);
@@ -2073,6 +2075,7 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)
     const union hsr hsr =3D { .bits =3D regs->hsr };

     enter_hypervisor_head(regs);
+    local_irq_enable();

     switch ( hsr.ec )
     {
@@ -2208,6 +2211,7 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
     const union hsr hsr =3D { .bits =3D regs->hsr };

     enter_hypervisor_head(regs);
+    local_irq_enable();

     switch ( hsr.ec )
     {
@@ -2246,6 +2250,7 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
 void do_trap_hyp_serror(struct cpu_user_regs *regs)
 {
     enter_hypervisor_head(regs);
+    local_irq_enable();

     __do_trap_serror(regs, VABORT_GEN_BY_GUEST(regs));
 }
@@ -2253,6 +2258,7 @@ void do_trap_hyp_serror(struct cpu_user_regs *regs)
 void do_trap_guest_serror(struct cpu_user_regs *regs)
 {
     enter_hypervisor_head(regs);
+    local_irq_enable();

     __do_trap_serror(regs, true);
 }

--

Andrii Anisov


--_000_VI1PR0302MB2688EA7F3491240166982F9DE6F30VI1PR0302MB2688_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p>Hello Julien<br>
</p>
<div class=3D"moz-cite-prefix">On 29.10.18 15:36, Julien Grall wrote:0<br>
</div>
<blockquote type=3D"cite">I wrote down an answer yesterday (sent it today) =
to your previous
<br>
answer. You may use the LRs information from the previous guest trap as <br=
>
interrupts are re-enabled before storing the LRs. <br>
</blockquote>
<p>Yes, it is the case. I've overlooked that for some exceptions interrupts=
 are enabled before enter_hypervisor_head().<br>
</p>
<p><br>
</p>
<blockquote type=3D"cite">Can you try the patch below?<br>
</blockquote>
<p>I tried it, and it works like a charm for the issue.</p>
<p>The only notice here is that I suppose it coul<br>
</p>
<br>
<br>
<blockquote type=3D"cite"><br>
commit 11e360b93be81a58a41832d714f33f797ad312a9 <br>
Author: Julien Grall <a class=3D"moz-txt-link-rfc2396E OWAAutoLink" href=3D=
"mailto:julien.grall@arm.com" id=3D"LPlnk46161" previewremoved=3D"true">
&lt;julien.grall@arm.com&gt;</a> <br>
Date:&nbsp;&nbsp; Mon Oct 29 13:32:56 2018 &#43;0000 <br>
<br>
&nbsp;&nbsp;&nbsp; xen/arm: Re-enable interrupt later in the trap path <br>
<br>
&nbsp;&nbsp;&nbsp; Signed-off-by: Julien Grall <a class=3D"moz-txt-link-rfc=
2396E OWAAutoLink" href=3D"mailto:julien.grall@arm.com" id=3D"LPlnk591511" =
previewremoved=3D"true">
&lt;julien.grall@arm.com&gt;</a> <br>
<br>
diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S <br>
index 97b05f53ea..8f287891b6 100644 <br>
--- a/xen/arch/arm/arm64/entry.S <br>
&#43;&#43;&#43; b/xen/arch/arm/arm64/entry.S <br>
@@ -195,7 &#43;195,6 @@ hyp_error_invalid: <br>
<br>
&nbsp;hyp_error: <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entry&nbsp;&nbsp; hyp=3D1 =
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msr&nbsp;&nbsp;&nbsp;&nbsp; dai=
fclr, #2 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mov&nbsp;&nbsp;&nbsp;&nbsp=
; x0, sp <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bl&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; do_trap_hyp_serror <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit&nbsp;&nbsp;&nbsp; hyp=
=3D1 <br>
@@ -203,7 &#43;202,7 @@ hyp_error: <br>
&nbsp;/* Traps taken in Current EL with SP_ELx */ <br>
&nbsp;hyp_sync: <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entry&nbsp;&nbsp; hyp=3D1 =
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msr&nbsp;&nbsp;&nbsp;&nbsp; dai=
fclr, #6 <br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msr&nbsp;&nbsp;&nbsp;&nbsp;=
 daifclr, #4 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mov&nbsp;&nbsp;&nbsp;&nbsp=
; x0, sp <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bl&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; do_trap_hyp_sync <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit&nbsp;&nbsp;&nbsp; hyp=
=3D1 <br>
@@ -304,7 &#43;303,7 @@ guest_sync_slowpath: <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ALTERNATIVE(&quot;bl check=
_pending_vserror; cbnz x0, 1f&quot;, <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;nop; nop&quot;, <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SKIP_SYNCHRONIZE_SERROR_ENTRY=
_EXIT) <br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msr&nbsp;&nbsp;&nbsp;&nbsp; dai=
fclr, #6 <br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msr&nbsp;&nbsp;&nbsp;&nbsp;=
 daifclr, #4 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mov&nbsp;&nbsp;&nbsp;&nbsp=
; x0, sp <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bl&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; do_trap_guest_sync <br>
&nbsp;1: <br>
@@ -332,7 &#43;331,7 @@ guest_fiq_invalid: <br>
<br>
&nbsp;guest_error: <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entry&nbsp;&nbsp; hyp=3D0,=
 compat=3D0 <br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msr&nbsp;&nbsp;&nbsp;&nbsp; dai=
fclr, #6 <br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msr&nbsp;&nbsp;&nbsp;&nbsp;=
 daifclr, #4 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mov&nbsp;&nbsp;&nbsp;&nbsp=
; x0, sp <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bl&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; do_trap_guest_serror <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit&nbsp;&nbsp;&nbsp; hyp=
=3D0, compat=3D0 <br>
@@ -347,7 &#43;346,7 @@ guest_sync_compat: <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ALTERNATIVE(&quot;bl check=
_pending_vserror; cbnz x0, 1f&quot;, <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;nop; nop&quot;, <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SKIP_SYNCHRONIZE_SERROR_ENTRY=
_EXIT) <br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msr&nbsp;&nbsp;&nbsp;&nbsp; dai=
fclr, #6 <br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msr&nbsp;&nbsp;&nbsp;&nbsp;=
 daifclr, #4 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mov&nbsp;&nbsp;&nbsp;&nbsp=
; x0, sp <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bl&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; do_trap_guest_sync <br>
&nbsp;1: <br>
@@ -375,7 &#43;374,7 @@ guest_fiq_invalid_compat: <br>
<br>
&nbsp;guest_error_compat: <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entry&nbsp;&nbsp; hyp=3D0,=
 compat=3D1 <br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msr&nbsp;&nbsp;&nbsp;&nbsp; dai=
fclr, #6 <br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msr&nbsp;&nbsp;&nbsp;&nbsp;=
 daifclr, #4 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mov&nbsp;&nbsp;&nbsp;&nbsp=
; x0, sp <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bl&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; do_trap_guest_serror <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit&nbsp;&nbsp;&nbsp; hyp=
=3D0, compat=3D1 <br>
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c <br>
index 51d2e42c77..c18f89b41f 100644 <br>
--- a/xen/arch/arm/traps.c <br>
&#43;&#43;&#43; b/xen/arch/arm/traps.c <br>
@@ -2039,6 &#43;2039,8 @@ static void enter_hypervisor_head(struct cpu_user=
_regs *regs)
<br>
&nbsp;&nbsp;&nbsp;&nbsp; { <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct vcpu *v =3D current=
; <br>
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASSERT(!local_irq_is_enable=
d()); <br>
&#43; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If the guest has disabl=
ed the workaround, bring it back on. */ <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( needs_ssbd_flip(v) ) =
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ar=
m_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1, NULL); <br>
@@ -2073,6 &#43;2075,7 @@ void do_trap_guest_sync(struct cpu_user_regs *reg=
s) <br>
&nbsp;&nbsp;&nbsp;&nbsp; const union hsr hsr =3D { .bits =3D regs-&gt;hsr }=
; <br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; enter_hypervisor_head(regs); <br>
&#43;&nbsp;&nbsp;&nbsp; local_irq_enable(); <br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; switch ( hsr.ec ) <br>
&nbsp;&nbsp;&nbsp;&nbsp; { <br>
@@ -2208,6 &#43;2211,7 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)=
 <br>
&nbsp;&nbsp;&nbsp;&nbsp; const union hsr hsr =3D { .bits =3D regs-&gt;hsr }=
; <br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; enter_hypervisor_head(regs); <br>
&#43;&nbsp;&nbsp;&nbsp; local_irq_enable(); <br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; switch ( hsr.ec ) <br>
&nbsp;&nbsp;&nbsp;&nbsp; { <br>
@@ -2246,6 &#43;2250,7 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)=
 <br>
&nbsp;void do_trap_hyp_serror(struct cpu_user_regs *regs) <br>
&nbsp;{ <br>
&nbsp;&nbsp;&nbsp;&nbsp; enter_hypervisor_head(regs); <br>
&#43;&nbsp;&nbsp;&nbsp; local_irq_enable(); <br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; __do_trap_serror(regs, VABORT_GEN_BY_GUEST(regs));=
 <br>
&nbsp;} <br>
@@ -2253,6 &#43;2258,7 @@ void do_trap_hyp_serror(struct cpu_user_regs *reg=
s) <br>
&nbsp;void do_trap_guest_serror(struct cpu_user_regs *regs) <br>
&nbsp;{ <br>
&nbsp;&nbsp;&nbsp;&nbsp; enter_hypervisor_head(regs); <br>
&#43;&nbsp;&nbsp;&nbsp; local_irq_enable(); <br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; __do_trap_serror(regs, true); <br>
&nbsp;} <br>
<br>
</blockquote>
<div class=3D"moz-signature">-- <br>
<p style=3D"margin:0; padding:0"><b><span style=3D"font-family:Arial,sans-s=
erif; font-size:11pt; color:#39c2d7; text-transform:uppercase">Andrii Aniso=
v</span></b>
</p>
<br>
</div>
</div>
</body>
</html>

--_000_VI1PR0302MB2688EA7F3491240166982F9DE6F30VI1PR0302MB2688_--


--===============8171908769833357657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8171908769833357657==--
