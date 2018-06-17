From: "Jan Beulich" <jbeulich@suse.com>
Subject: [PATCH RFC] x86/resume: take care of fully eager FPU
 around system suspend
Date: Sun, 17 Jun 2018 02:56:22 -0600
Message-ID: <5B2622360200007800133021@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=__Part112B6126.1__="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vt1h=jd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fUTU3-0007ED-44
 for xen-devel@lists.xenproject.org; Sun, 17 Jun 2018 08:56:27 +0000
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

--=__Part112B6126.1__=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Just like in the HVM emulation and EFI runtime call cases we must not
set CR0.TS here in fully eager mode. Note that idle vCPU-s never have
->arch.fully_eager_fpu set (for their initialization not going through
vcpu_init_fpu()), so we won't hit the respective ASSERT() in
vcpu_restore_fpu_eager().=20

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Not even compile tested, as I'm writing this from home. Also please
         excuse the formatting (hence the attachment) - our mail web =
frontend
      doesn't allow anything better.

--- a/xen/arch/x86/acpi/suspend.c
+++ b/xen/arch/x86/acpi/suspend.c
@@ -92,8 +92,11 @@ void restore_rest_processor_state(void)
         write_debugreg(7, curr->arch.debugreg[7]);
     }
=20
-    /* Reload FPU state on next FPU use. */
-    stts();
+    /* Reload FPU state immediately or on next FPU use. */
+    if ( curr->arch.fully_eager_fpu )
+        vcpu_restore_fpu_eager(curr);
+    else
+        stts();
=20
     if (cpu_has_pat)
         wrmsrl(MSR_IA32_CR_PAT, host_pat);


--=__Part112B6126.1__=
Content-Type: text/plain; name="x86-resume-eager-FPU.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="x86-resume-eager-FPU.patch"

x86/resume: take care of fully eager FPU around system suspend=0A=0AJust =
like in the HVM emulation and EFI runtime call cases we must not=0Aset =
CR0.TS here in fully eager mode. Note that idle vCPU-s never have=0A->arch.=
fully_eager_fpu set (for their initialization not going through=0Avcpu_init=
_fpu()), so we won't hit the respective ASSERT() in=0Avcpu_restore_fpu_eage=
r(). =0A=0ASigned-off-by: Jan Beulich <jbeulich@suse.com>=0A---=0ARFC: Not =
even compile tested, as I'm writing this from home.=0A=0A--- a/xen/arch/x86=
/acpi/suspend.c=0A+++ b/xen/arch/x86/acpi/suspend.c=0A@@ -92,8 +92,11 @@ =
void restore_rest_processor_state(void)=0A         write_debugreg(7, =
curr->arch.debugreg[7]);=0A     }=0A =0A-    /* Reload FPU state on next =
FPU use. */=0A-    stts();=0A+    /* Reload FPU state immediately or on =
next FPU use. */=0A+    if ( curr->arch.fully_eager_fpu )=0A+        =
vcpu_restore_fpu_eager(curr);=0A+    else=0A+        stts();=0A =0A     if =
(cpu_has_pat)=0A         wrmsrl(MSR_IA32_CR_PAT, host_pat);=0A
--=__Part112B6126.1__=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=__Part112B6126.1__=--
