Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25486C88E56
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 12:48:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416566.1645558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50fq-0005K3-NJ; Fri, 11 Sep 2026 12:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416566.1645558; Fri, 11 Sep 2026 12:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50fq-0005Jw-K3; Fri, 11 Sep 2026 12:48:10 +0000
Received: by outflank-mailman (input) for mailman id 1416566;
 Fri, 11 Sep 2026 12:48:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0908275e9000c4f3@swg.vates.tech>)
 id 1x50fp-0005Ho-07
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:48:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50fo-003mHJ-Cz
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:48:08 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0908275e9000c4f3@swg.vates.tech>)
 id 6aa3f880-8faa-0a2a0a5109dd-0a2a4503a8fe-30
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:48:08 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0908275e9000c4f3@swg.vates.tech>)
 id 6aa3f887-fae8-0a2a45030019-b9ff1c228c1f-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:48:08 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0908275e9000c4f3.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 12:47:44 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5E9CA81E4A;
 Fri, 11 Sep 2026 14:47:43 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=e63R22GnWuCkoRCDuBwl1UbdkbLnvthe1GGv5qc8yeY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=O8RPO7Y9bDH1z0REYTvpNlDaZ6ZIZpHN9X2le3qBzyUKjaq+iwuduSOBrv8oiPsANPVhYMAuR
 D0iyqA1hXYMNTgGgjvHajI/f2j8lnjOLEvtqEySRvjcLNLNgxlPGO2eeo0gGU4iXSrbUEB3HUk4
 ywCoTjPXKWT+/KwT8lY8ZQV57A3vy7eL4i3L9dRLeO3EgXTxkydgt1rYhbJjPRQEoW/KJkY8oVn
 snXBEuwcTAyFaDncGrsdJ+cPUYkSPq+Nq2kf7R45WFY4UH8Uwwm1ZC0zqxfWV38FK9V1Bbb0Th8
 I7qu+icrV9nHBOYaC65F4BnXm2g1J/s0HWzYjDkalQjA==
X-Zone-Loop: dbabf15597bf0f1b03989ea4fb9095ef3b6a7138c8ce
x-campaign-type: default
x-transaction-id: 8f6e74c2-9dcb-4c11-9c27-f0f2c2c37ab9
x-swg-uid: 01-1b89235f-4f94-4f3c-b9fe-0516b47c83f8
X-Mailer: Sweego
Message-ID:
 <1789130864.8631fc262581453bbf619ec5b2062170.1a0908275e9000c4f3@vates.tech>
x-swg-bid: 1789130864.8631fc262581453bbf619ec5b2062170.1a0908275e9000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v5 5/6] xen/arm: report clock_frequency via sysctl physinfo, not createdomain
Date: Fri, 11 Sep 2026 14:47:35 +0200
In-Reply-To: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
References: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.b6.4d0d4fd336db1aff.1a09082744a.3ae593f4d687c111=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789130863690
X-purgate-ID: tlsNG-33051d/1789130888-766FB4E9-C27AEC19/0/0
X-purgate-type: clean
X-purgate-size: 16977

---=Part.b6.4d0d4fd336db1aff.1a09082744a.3ae593f4d687c111=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The xen_arch_domainconfig=2Eclock_frequency value is populated in
domain_vtimer_init() during XEN_DOMCTL_createdomain from the global
timer_dt_clock_frequency, which comes from the host's DT timer node and
has nothing to do with the domain being created=2E Like now removed
GIC_NATIVE resolution, this is a host-wide system property being
smuggled out through a domain-creation IN struct=2E

Expose it instead as a new arch_clock_frequency_hz field in
XEN_SYSCTL_physinfo, populated via arch_do_physinfo(), and mirroring how
the GIC capability bits were already moved there=2E

Rather than making the field dependant on DT boot, make Xen always
report the timer frequency, either via the DT "clock-frequency" node, or
directly via CNTFRQ_EL0=2E preinit_xen_time() already computes cpu_khz for
every boot path=2E The renamed timer_clock_frequency_hz now captures
whichever of the two produced that value, in full Hz precision, instead
of only recording the DT case=2E So, ACPI guests get a real value too,
allowing to drop the special case=2E

The DT "clock-frequency" property exists because firmware might leave
CNTFRQ_EL0 wrong, and since CNTFRQ_EL0 cannot be trapped the only fix is
to replicate the correct value into the guest DT=2E To keep that signal, a
new XEN_SYSCTL_PHYSCAP_ARM_TIMER_DT_FREQ capability bit records whether
arch_clock_frequency_hz came from the DT property=2E Then libxl only emits
a "clock-frequency" property into the guest timer node when that bit is
set=2E A guest whose CNTFRQ_EL0 is already correct keeps an unmodified
timer node, exactly as before=2E

Although the CNTFRQ_EL0 register is 64 bits wide, and some current timer
implementations run at 1GHz, a 32bit value is sufficient to store the
timer value, because it only mirrors the DT 'clock-frequency' property,
which the bindings define as a single 32-bit cell=2E

In struct xen_sysctl_physinfo the new field just reuses the former pad
word, so sysctl consumers are unaffected=2E struct xen_arch_domainconfig
however loses clock_frequency from its middle, which shrinks the struct
and shifts every field after it, so bump XEN_DOMCTL_INTERFACE_VERSION=2E

The xen_arch_domainconfig parameter passed to domain_vtimer_init() is no
longer needed, so drop that parameter entirely=2E libxl now fetches the
frequency via libxl_get_physinfo() in libxl__arch_domain_save_config()
instead of reading it back out of the createdomain reply=2E The OCaml
xen_arch_domainconfig mirror drops the field too=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v5:
- Bump XEN_DOMCTL_INTERFACE_VERSION: removing clock_frequency shrinks and
  shifts struct xen_arch_domainconfig
- Add XEN_SYSCTL_PHYSCAP_ARM_TIMER_DT_FREQ (with an
  arch_capabilities_arm_timer_dt_freq() helper) so libxl emits a guest DT
  "clock-frequency" only when the value came from the host DT
- Reword the arch_clock_frequency_hz comment: 0 now only means non-ARM
---
 =2E=2E=2E/include/xen-tools/arm-arch-capabilities=2Eh | 10 +++++++++
 tools/libs/light/libxl=2Ec                      |  1 +
 tools/libs/light/libxl_arm=2Ec                  | 21 ++++++++++++++++++-
 tools/libs/light/libxl_types=2Eidl              |  1 +
 tools/ocaml/libs/xc/xenctrl=2Eml                |  1 -
 tools/ocaml/libs/xc/xenctrl=2Emli               |  1 -
 xen/arch/arm/domain=2Ec                         |  2 +-
 xen/arch/arm/include/asm/time=2Eh               |  7 ++++---
 xen/arch/arm/include/asm/vtimer=2Eh             |  3 +--
 xen/arch/arm/sysctl=2Ec                         |  5 +++++
 xen/arch/arm/time=2Ec                           |  9 +++++---
 xen/arch/arm/vtimer=2Ec                         |  4 +---
 xen/include/public/arch-arm=2Eh                 | 16 +-------------
 xen/include/public/domctl=2Eh                   |  4 ++--
 xen/include/public/sysctl=2Eh                   | 20 +++++++++++++++++-
 15 files changed, 72 insertions(+), 33 deletions(-)

diff --git a/tools/include/xen-tools/arm-arch-capabilities=2Eh b/tools/inc=
lude/xen-tools/arm-arch-capabilities=2Eh
index 21e3c73bd1=2E=2Ea927bc4703 100644
--- a/tools/include/xen-tools/arm-arch-capabilities=2Eh
+++ b/tools/include/xen-tools/arm-arch-capabilities=2Eh
@@ -46,4 +46,14 @@ bool arch_capabilities_arm_gic_v3(unsigned int arch_cap=
abilities)
 #endif
 }
=20
+static inline
+bool arch_capabilities_arm_timer_dt_freq(unsigned int arch_capabilities)
+{
+#if defined(__arm__) || defined(__aarch64__)
+    return MASK_EXTR(arch_capabilities, XEN_SYSCTL_PHYSCAP_ARM_TIMER_DT_F=
REQ);
+#else
+    return false;
+#endif
+}
+
 #endif /* ARM_ARCH_CAPABILITIES_H */
diff --git a/tools/libs/light/libxl=2Ec b/tools/libs/light/libxl=2Ec
index a1fe16274d=2E=2Eec7e6d3f65 100644
--- a/tools/libs/light/libxl=2Ec
+++ b/tools/libs/light/libxl=2Ec
@@ -410,6 +410,7 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo =
*physinfo)
     physinfo->cap_gnttab_v2 =3D
         !!(xcphysinfo=2Ecapabilities & XEN_SYSCTL_PHYSCAP_gnttab_v2);
     physinfo->arch_capabilities =3D xcphysinfo=2Earch_capabilities;
+    physinfo->arch_clock_frequency_hz =3D xcphysinfo=2Earch_clock_frequen=
cy_hz;
=20
     GC_FREE;
     return 0;
diff --git a/tools/libs/light/libxl_arm=2Ec b/tools/libs/light/libxl_arm=
=2Ec
index 283cfb749b=2E=2E3d232040c9 100644
--- a/tools/libs/light/libxl_arm=2Ec
+++ b/tools/libs/light/libxl_arm=2Ec
@@ -252,6 +252,9 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
                                    libxl__domain_build_state *state,
                                    const struct xen_domctl_createdomain *=
config)
 {
+    libxl_physinfo info;
+    int rc;
+
     switch (config->arch=2Egic_version) {
     case XEN_DOMCTL_CONFIG_GIC_V2:
         d_config->b_info=2Earch_arm=2Egic_version =3D LIBXL_GIC_VERSION_V=
2;
@@ -264,7 +267,23 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
         return ERROR_FAIL;
     }
=20
-    state->clock_frequency =3D config->arch=2Eclock_frequency;
+    libxl_physinfo_init(&info);
+    rc =3D libxl_get_physinfo(CTX, &info);
+    if (rc) {
+        LOG(ERROR, "failed to get physinfo");
+        libxl_physinfo_dispose(&info);
+        return ERROR_FAIL;
+    }
+    /*
+     * Pass the timer frequency on to the guest DT only when Xen took it =
from
+     * the host DT (XEN_SYSCTL_PHYSCAP_ARM_TIMER_DT_FREQ)=2E Otherwise th=
e guest
+     * gets the right value from CNTFRQ_EL0=2E
+     */
+    if (arch_capabilities_arm_timer_dt_freq(info=2Earch_capabilities))
+        state->clock_frequency =3D info=2Earch_clock_frequency_hz;
+    else
+        state->clock_frequency =3D 0;
+    libxl_physinfo_dispose(&info);
=20
     return 0;
 }
diff --git a/tools/libs/light/libxl_types=2Eidl b/tools/libs/light/libxl_t=
ypes=2Eidl
index 8699ab3013=2E=2Ee2e4be7323 100644
--- a/tools/libs/light/libxl_types=2Eidl
+++ b/tools/libs/light/libxl_types=2Eidl
@@ -1201,6 +1201,7 @@ libxl_physinfo =3D Struct("physinfo", [
     ("cap_gnttab_v1", bool),
     ("cap_gnttab_v2", bool),
     ("arch_capabilities", uint32),
+    ("arch_clock_frequency_hz", uint32), # ARM only
     ], dir=3DDIR_OUT)
=20
 libxl_connectorinfo =3D Struct("connectorinfo", [
diff --git a/tools/ocaml/libs/xc/xenctrl=2Eml b/tools/ocaml/libs/xc/xenctr=
l=2Eml
index 147afa62c2=2E=2E582897af6d 100644
--- a/tools/ocaml/libs/xc/xenctrl=2Eml
+++ b/tools/ocaml/libs/xc/xenctrl=2Eml
@@ -32,7 +32,6 @@ type xen_arm_arch_domainconfig =3D
   {
     gic_version: int;
     nr_spis: int;
-    clock_frequency: int32;
   }
=20
 type x86_arch_emulation_flags =3D
diff --git a/tools/ocaml/libs/xc/xenctrl=2Emli b/tools/ocaml/libs/xc/xenct=
rl=2Emli
index 9fccb2c2c2=2E=2E9414b87164 100644
--- a/tools/ocaml/libs/xc/xenctrl=2Emli
+++ b/tools/ocaml/libs/xc/xenctrl=2Emli
@@ -26,7 +26,6 @@ type vcpuinfo =3D {
 type xen_arm_arch_domainconfig =3D {
   gic_version: int;
   nr_spis: int;
-  clock_frequency: int32;
 }
=20
 type x86_arch_emulation_flags =3D
diff --git a/xen/arch/arm/domain=2Ec b/xen/arch/arm/domain=2Ec
index 6f5f92876e=2E=2Ed4037c402a 100644
--- a/xen/arch/arm/domain=2Ec
+++ b/xen/arch/arm/domain=2Ec
@@ -713,7 +713,7 @@ int arch_domain_create(struct domain *d,
     if ( (rc =3D domain_vgic_init(d, config->arch=2Enr_spis)) !=3D 0 )
         goto fail;
=20
-    if ( (rc =3D domain_vtimer_init(d, &config->arch)) !=3D 0 )
+    if ( (rc =3D domain_vtimer_init(d)) !=3D 0 )
         goto fail;
=20
     if ( (rc =3D tee_domain_init(d, config->arch=2Etee_type)) !=3D 0 )
diff --git a/xen/arch/arm/include/asm/time=2Eh b/xen/arch/arm/include/asm/=
time=2Eh
index c194dbb9f5=2E=2Efd79dd31eb 100644
--- a/xen/arch/arm/include/asm/time=2Eh
+++ b/xen/arch/arm/include/asm/time=2Eh
@@ -87,10 +87,11 @@ enum timer_ppi
 };
=20
 /*
- * Value of "clock-frequency" in the DT timer node if present=2E
- * 0 means the property doesn't exist=2E
+ * The timer frequency, in Hz, that Xen ended up using, and whether it ca=
me
+ * from the DT "clock-frequency" property rather than CNTFRQ_EL0=2E
  */
-extern uint32_t timer_dt_clock_frequency;
+extern uint32_t timer_clock_frequency_hz;
+extern bool timer_clock_frequency_from_dt;
=20
 /* Get one of the timer IRQ number */
 unsigned int timer_get_irq(enum timer_ppi ppi);
diff --git a/xen/arch/arm/include/asm/vtimer=2Eh b/xen/arch/arm/include/as=
m/vtimer=2Eh
index 9d4fb4c6e8=2E=2E6bbfcf4e69 100644
--- a/xen/arch/arm/include/asm/vtimer=2Eh
+++ b/xen/arch/arm/include/asm/vtimer=2Eh
@@ -20,8 +20,7 @@
 #ifndef __ARCH_ARM_VTIMER_H__
 #define __ARCH_ARM_VTIMER_H__
=20
-extern int domain_vtimer_init(struct domain *d,
-                              struct xen_arch_domainconfig *config);
+extern int domain_vtimer_init(struct domain *d);
 extern int vcpu_vtimer_init(struct vcpu *v);
 extern bool vtimer_emulate(struct cpu_user_regs *regs, union hsr hsr);
 extern void virt_timer_save(struct vcpu *v);
diff --git a/xen/arch/arm/sysctl=2Ec b/xen/arch/arm/sysctl=2Ec
index 8411deb7e2=2E=2Ee22d2fb613 100644
--- a/xen/arch/arm/sysctl=2Ec
+++ b/xen/arch/arm/sysctl=2Ec
@@ -15,6 +15,7 @@
=20
 #include <asm/arm64/sve=2Eh>
 #include <asm/gic=2Eh>
+#include <asm/time=2Eh>
 #include <asm/vgic=2Eh>
=20
 #include <public/sysctl=2Eh>
@@ -26,6 +27,10 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     pi->arch_capabilities |=3D MASK_INSR(sve_encode_vl(get_sys_vl_len()),
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
=20
+    pi->arch_clock_frequency_hz =3D timer_clock_frequency_hz;
+    if ( timer_clock_frequency_from_dt )
+        pi->arch_capabilities |=3D XEN_SYSCTL_PHYSCAP_ARM_TIMER_DT_FREQ;
+
     /*
      * The GIC version(s) we're happy creating guests with=2E Right now f=
or
      * simplicity it is tied to the active hardware version, but this wil=
l
diff --git a/xen/arch/arm/time=2Ec b/xen/arch/arm/time=2Ec
index be54b87438=2E=2E438a27825d 100644
--- a/xen/arch/arm/time=2Ec
+++ b/xen/arch/arm/time=2Ec
@@ -35,7 +35,8 @@ uint64_t __read_mostly boot_count;
  * register-mapped time source in the SoC=2E */
 unsigned long __read_mostly cpu_khz;  /* CPU clock frequency in kHz=2E */
=20
-uint32_t __read_mostly timer_dt_clock_frequency;
+uint32_t __read_mostly timer_clock_frequency_hz;
+bool __read_mostly timer_clock_frequency_from_dt;
=20
 static unsigned int timer_irq[MAX_TIMER_PPI];
=20
@@ -120,7 +121,8 @@ static void __init preinit_dt_xen_time(void)
     {
         cpu_khz =3D DIV_ROUND(rate, 1000);
         validate_timer_frequency();
-        timer_dt_clock_frequency =3D rate;
+        timer_clock_frequency_hz =3D rate;
+        timer_clock_frequency_from_dt =3D true;
     }
 }
=20
@@ -136,7 +138,8 @@ void __init preinit_xen_time(void)
=20
     if ( !cpu_khz )
     {
-        cpu_khz =3D DIV_ROUND(READ_SYSREG(CNTFRQ_EL0) & CNTFRQ_MASK, 1000=
);
+        timer_clock_frequency_hz =3D READ_SYSREG(CNTFRQ_EL0) & CNTFRQ_MAS=
K;
+        cpu_khz =3D DIV_ROUND(timer_clock_frequency_hz, 1000);
         validate_timer_frequency();
     }
=20
diff --git a/xen/arch/arm/vtimer=2Ec b/xen/arch/arm/vtimer=2Ec
index 2e85ff2b6e=2E=2E18f5676158 100644
--- a/xen/arch/arm/vtimer=2Ec
+++ b/xen/arch/arm/vtimer=2Ec
@@ -52,7 +52,7 @@ static void virt_timer_expired(void *data)
     perfc_incr(vtimer_virt_inject);
 }
=20
-int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *co=
nfig)
+int domain_vtimer_init(struct domain *d)
 {
     d->arch=2Evirt_timer_base=2Eoffset =3D get_cycles();
     d->arch=2Evirt_timer_base=2Enanoseconds =3D
@@ -60,8 +60,6 @@ int domain_vtimer_init(struct domain *d, struct xen_arch=
_domainconfig *config)
     d->time_offset=2Eseconds =3D d->arch=2Evirt_timer_base=2Enanoseconds;
     do_div(d->time_offset=2Eseconds, 1000000000);
=20
-    config->clock_frequency =3D timer_dt_clock_frequency;
-
     /*
      * Per the ACPI specification, providing a secure EL1 timer
      * interrupt is optional and will be ignored by non-secure OS=2E
diff --git a/xen/include/public/arch-arm=2Eh b/xen/include/public/arch-arm=
=2Eh
index 9d3bf11cbd=2E=2E5d15f572c7 100644
--- a/xen/include/public/arch-arm=2Eh
+++ b/xen/include/public/arch-arm=2Eh
@@ -335,7 +335,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA    2
=20
 struct xen_arch_domainconfig {
-    /* IN/OUT */
+    /* IN */
     uint8_t gic_version;
     /* IN - Contains SVE vector length divided by 128 */
     uint8_t sve_vl;
@@ -343,20 +343,6 @@ struct xen_arch_domainconfig {
     uint16_t tee_type;
     /* IN */
     uint32_t nr_spis;
-    /*
-     * OUT
-     * Based on the property clock-frequency in the DT timer node=2E
-     * The property may be present when the bootloader/firmware doesn't
-     * set correctly CNTFRQ which hold the timer frequency=2E
-     *
-     * As it's not possible to trap this register, we have to replicate
-     * the value in the guest DT=2E
-     *
-     * =3D 0 =3D> property not present
-     * > 0 =3D> Value of the property
-     *
-     */
-    uint32_t clock_frequency;
     /* IN */
     uint8_t arm_sci_type;
     /* IN */
diff --git a/xen/include/public/domctl=2Eh b/xen/include/public/domctl=2Eh
index 510300bb67=2E=2E4ca8a2d7ca 100644
--- a/xen/include/public/domctl=2Eh
+++ b/xen/include/public/domctl=2Eh
@@ -30,9 +30,9 @@
  * fields) don't require a change of the version=2E
  * Stable ops are NOT covered by XEN_DOMCTL_INTERFACE_VERSION!
  *
- * Last version bump: Xen 4=2E22
+ * Last version bump: Xen 4=2E23
  */
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000018
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000019
=20
 /*
  * NB=2E xen_domctl=2Edomain is an IN/OUT parameter for this operation=2E
diff --git a/xen/include/public/sysctl=2Eh b/xen/include/public/sysctl=2Eh
index d20ebf3644=2E=2E8356032e13 100644
--- a/xen/include/public/sysctl=2Eh
+++ b/xen/include/public/sysctl=2Eh
@@ -108,6 +108,8 @@ struct xen_sysctl_tbuf_op {
 #define XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK  (0x1FU)
 #define XEN_SYSCTL_PHYSCAP_ARM_GIC_V2    (1U << 5)
 #define XEN_SYSCTL_PHYSCAP_ARM_GIC_V3    (1U << 6)
+/* See arch_clock_frequency_hz in struct xen_sysctl_physinfo=2E */
+#define XEN_SYSCTL_PHYSCAP_ARM_TIMER_DT_FREQ (1U << 7)
 #endif
=20
 struct xen_sysctl_physinfo {
@@ -120,7 +122,23 @@ struct xen_sysctl_physinfo {
     uint32_t cpu_khz;
     uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
     uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_{X86,ARM,=2E=2E=2E}_=
??? */
-    uint32_t pad;
+
+    /*
+     * ARM only=2E The timer frequency, in Hz, that Xen is using, taken e=
ither
+     * from the host DT timer node's "clock-frequency" property or from a
+     * direct CNTFRQ_EL0 read=2E
+     *
+     * XEN_SYSCTL_PHYSCAP_ARM_TIMER_DT_FREQ is set in the former case=2E =
The host
+     * DT overrides CNTFRQ_EL0 (the usual way a wrong bootloader/firmware=
 value
+     * is corrected), so the toolstack must carry the same override into =
the
+     * guest's timer node, since CNTFRQ_EL0 cannot be trapped and fixed u=
p per
+     * guest=2E
+     *
+     * =3D 0 =3D> Non-ARM=2E On ARM the frequency is validated at boot an=
d is
+     *        always non-zero=2E
+     * > 0 =3D> The frequency, in Hz=2E
+     */
+    uint32_t arch_clock_frequency_hz;
     uint64_aligned_t total_pages;
     uint64_aligned_t free_pages;
     uint64_aligned_t scrub_pages;
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.b6.4d0d4fd336db1aff.1a09082744a.3ae593f4d687c111=---

