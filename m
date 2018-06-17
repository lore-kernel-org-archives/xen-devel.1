From: "Jan Beulich" <jbeulich@suse.com>
Subject: [PATCH RFC] x86/EFI: take care of fully eager FPU
 around runtime calls
Date: Sun, 17 Jun 2018 02:45:32 -0600
Message-ID: <5B261FAC0200007800133017@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=__PartB68CC6BC.1__="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vt1h=jd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fUTJY-0006SP-Qo
 for xen-devel@lists.xenproject.org; Sun, 17 Jun 2018 08:45:36 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

--=__PartB68CC6BC.1__=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Just like in the HVM emulation case we must not set CR0.TS here in
fully eager mode. Note that idle vCPU-s never have
->arch.fully_eager_fpu set (for their initialization not going through
vcpu_init_fpu()), so we won't hit the respective ASSERT() in
vcpu_restore_fpu_eager().

Introduce a "curr" local variable and replace other uses of "current"
at the same time.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Not even compile tested, as I'm writing this from home. Also please
     excuse the formatting (hence the attachment) - our mail web frontend

     doesn't allow anything better.


--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -118,14 +118,16 @@ struct efi_rs_state efi_rs_enter(void)
=20
 void efi_rs_leave(struct efi_rs_state *state)
 {
+    struct vcpu *curr =3D current;
+
     if ( !state->cr3 )
         return;
     write_cr3(state->cr3);
-    if ( is_pv_vcpu(current) && !is_idle_vcpu(current) )
+    if ( is_pv_vcpu(curr) && !is_idle_vcpu(curr) )
     {
         struct desc_ptr gdt_desc =3D {
             .limit =3D LAST_RESERVED_GDT_BYTE,
-            .base  =3D GDT_VIRT_START(current)
+            .base  =3D GDT_VIRT_START(curr)
         };
=20
         asm volatile ( "lgdt %0" : : "m" (gdt_desc) );
@@ -133,7 +135,10 @@ void efi_rs_leave(struct efi_rs_state *state)
     irq_exit();
     efi_rs_on_cpu =3D NR_CPUS;
     spin_unlock(&efi_rs_lock);
-    stts();
+    if ( curr->arch.fully_eager_fpu )
+        vcpu_restore_fpu_eager(curr);
+    else
+        stts();
 }
=20
 bool efi_rs_using_pgtables(void)


--=__PartB68CC6BC.1__=
Content-Type: text/plain; name="x86-EFI-eager-FPU.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="x86-EFI-eager-FPU.patch"

x86/EFI: take care of fully eager FPU around runtime calls=0A=0AJust like =
in the HVM emulation case we must not set CR0.TS here in=0Afully eager =
mode. Note that idle vCPU-s never have=0A->arch.fully_eager_fpu set (for =
their initialization not going through=0Avcpu_init_fpu()), so we won't hit =
the respective ASSERT() in=0Avcpu_restore_fpu_eager().=0A=0AIntroduce a =
"curr" local variable and replace other uses of "current"=0Aat the same =
time.=0A=0AReported-by: Andrew Cooper <andrew.cooper3@citrix.com>=0ASigned-=
off-by: Jan Beulich <jbeulich@suse.com>=0A---=0ARFC: Not even compile =
tested, as I'm writing this from home.=0A=0A--- a/xen/common/efi/runtime.c=
=0A+++ b/xen/common/efi/runtime.c=0A@@ -118,14 +118,16 @@ struct efi_rs_sta=
te efi_rs_enter(void)=0A =0A void efi_rs_leave(struct efi_rs_state =
*state)=0A {=0A+    struct vcpu *curr =3D current;=0A+=0A     if ( =
!state->cr3 )=0A         return;=0A     write_cr3(state->cr3);=0A-    if ( =
is_pv_vcpu(current) && !is_idle_vcpu(current) )=0A+    if ( is_pv_vcpu(curr=
) && !is_idle_vcpu(curr) )=0A     {=0A         struct desc_ptr gdt_desc =
=3D {=0A             .limit =3D LAST_RESERVED_GDT_BYTE,=0A-            =
.base  =3D GDT_VIRT_START(current)=0A+            .base  =3D GDT_VIRT_START=
(curr)=0A         };=0A =0A         asm volatile ( "lgdt %0" : : "m" =
(gdt_desc) );=0A@@ -133,7 +135,10 @@ void efi_rs_leave(struct efi_rs_state =
*state)=0A     irq_exit();=0A     efi_rs_on_cpu =3D NR_CPUS;=0A     =
spin_unlock(&efi_rs_lock);=0A-    stts();=0A+    if ( curr->arch.fully_eage=
r_fpu )=0A+        vcpu_restore_fpu_eager(curr);=0A+    else=0A+        =
stts();=0A }=0A =0A bool efi_rs_using_pgtables(void)=0A
--=__PartB68CC6BC.1__=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=__PartB68CC6BC.1__=--
