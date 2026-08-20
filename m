Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BED7C5DF81
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 12:41:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396463.1634322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx24h-00042N-21; Thu, 20 Aug 2026 12:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396463.1634322; Thu, 20 Aug 2026 12:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx24g-00042G-VL; Thu, 20 Aug 2026 12:40:50 +0000
Received: by outflank-mailman (input) for mailman id 1396463;
 Thu, 20 Aug 2026 12:40:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01f2fdb8f000c4f3@swg.vates.tech>)
 id 1wx24g-00040t-3v
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 12:40:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx24f-008qNG-Gc
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 14:40:49 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01f2fdb8f000c4f3@swg.vates.tech>)
 id 6a86f5c5-bab6-0a2a0a5309dd-0a2a4505e1e4-34
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 14:40:49 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01f2fdb8f000c4f3@swg.vates.tech>)
 id 6a86f5ce-4cb1-0a2a45050019-b9ff1c12b505-4
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 14:40:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a01f2fdb8f000c4f3.00b for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Aug 2026 12:40:25 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7D68783985;
 Thu, 20 Aug 2026 14:40:24 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=DTVomOkD5+5YJdD9EWOSdlFdsPA/8xprZDIOodGFay8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ETzAuIll5uwg3xJboQeOa62mN+KPEaE+R7XbZaquaJ7JCzay3skW4i7a2JHQJOnj4rvE0drAP
 p+Szx4YT0/KhrSU0oB8/tep/daDqepSO9FgR9JWDf21Klr+1K2IRLIrXbNaPUKm47+lrQ/5YWB5
 ilpW/w3ganfh+DAksNbmfuaGJSaawFtbh9QqxcradXFiuIO0A3I3xocfDuXIA+1GC0x/0OGiL4P
 4dWPLor01GWRMWtG7KQ3URsdQwQoJCIdS4PjU6tLyjrlrcYB/Mxz5lsDkA8KfUDAJJuzXyWV9PU
 z4axkEi4j0VEl6lCUlsJ8jfyotf1GLzB2l3/TXzXk/SA==
X-Zone-Loop: c8859e5d23719a7eb7be0aaef7fb6f46a2c4f4e1e019
x-campaign-type: default
x-transaction-id: fd2726d0-0594-493c-8e4f-41542bbfcab5
x-swg-uid: 01-67747d29-6e6a-4a09-bb53-a995af605499
X-Mailer: Sweego
Message-ID:
 <1787229625.8631fc262581453bbf619ec5b2062170.1a01f2fdb8f000c4f3@vates.tech>
x-swg-bid: 1787229625.8631fc262581453bbf619ec5b2062170.1a01f2fdb8f000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
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
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v4 5/6] xen/arm: report clock_frequency via sysctl physinfo, not createdomain
Date: Thu, 20 Aug 2026 14:40:15 +0200
In-Reply-To: <20260820124016.2033421-1-julian.vetter@vates.tech>
References: <20260820123805.2033085-1-julian.vetter@vates.tech>
 <20260820124016.2033421-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2672.a59d4b9a9baa91da.1a01f2fd9fa.d7cfef382de3e7c6=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787229624826
X-purgate-ID: tlsNG-c201ff/1787229649-71EA92A1-9075DEE3/0/0
X-purgate-type: clean
X-purgate-size: 13207

---=Part.2672.a59d4b9a9baa91da.1a01f2fd9fa.d7cfef382de3e7c6=-
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

Although the CNTFRQ_EL0 register is 64 bits wide, and some current timer
implementations run at 1GHz, a 32bit value is sufficient to store the
timer value, because it only mirrors the DT 'clock-frequency' property,
which the bindings define as a single 32-bit cell=2E The
XEN_DOMCTL_INTERFACE_VERSION doesn't need to be bumped, because only a
previously zero'ed / ignored field is now used=2E

The xen_arch_domainconfig parameter passed to domain_vtimer_init() is no
longer needed, so drop that parameter entirely=2E libxl now fetches the
frequency via libxl_get_physinfo() in libxl__arch_domain_save_config()
instead of reading it back out of the createdomain reply=2E The OCaml
xen_arch_domainconfig mirror drops the field too=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v4:
- Rename timer_dt_clock_frequency to timer_clock_frequency_hz
- Always populate the frequency, and record it on the CNTFRQ_EL0 path in
  preinit_xen_time(), instead of only when booting via DT
- ACPI guests now get a real frequency value instead of 0
---
 tools/libs/light/libxl=2Ec          |  1 +
 tools/libs/light/libxl_arm=2Ec      | 13 ++++++++++++-
 tools/libs/light/libxl_types=2Eidl  |  1 +
 tools/ocaml/libs/xc/xenctrl=2Eml    |  1 -
 tools/ocaml/libs/xc/xenctrl=2Emli   |  1 -
 xen/arch/arm/domain=2Ec             |  2 +-
 xen/arch/arm/include/asm/time=2Eh   |  6 +++---
 xen/arch/arm/include/asm/vtimer=2Eh |  3 +--
 xen/arch/arm/sysctl=2Ec             |  3 +++
 xen/arch/arm/time=2Ec               |  7 ++++---
 xen/arch/arm/vtimer=2Ec             |  4 +---
 xen/include/public/arch-arm=2Eh     | 16 +---------------
 xen/include/public/sysctl=2Eh       | 12 +++++++++++-
 13 files changed, 39 insertions(+), 31 deletions(-)

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
index 926d651857=2E=2Ecf441f0737 100644
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
@@ -264,7 +267,15 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
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
+    state->clock_frequency =3D info=2Earch_clock_frequency_hz;
+    libxl_physinfo_dispose(&info);
=20
     return 0;
 }
diff --git a/tools/libs/light/libxl_types=2Eidl b/tools/libs/light/libxl_t=
ypes=2Eidl
index a7893460f0=2E=2Ee24a3253f8 100644
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
index 94f8f077e9=2E=2E96dc65270b 100644
--- a/xen/arch/arm/domain=2Ec
+++ b/xen/arch/arm/domain=2Ec
@@ -710,7 +710,7 @@ int arch_domain_create(struct domain *d,
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
index c194dbb9f5=2E=2E07091648a3 100644
--- a/xen/arch/arm/include/asm/time=2Eh
+++ b/xen/arch/arm/include/asm/time=2Eh
@@ -87,10 +87,10 @@ enum timer_ppi
 };
=20
 /*
- * Value of "clock-frequency" in the DT timer node if present=2E
- * 0 means the property doesn't exist=2E
+ * The timer frequency, in Hz, that Xen ended up using: either the DT
+ * "clock-frequency" override, or a direct CNTFRQ_EL0 read=2E
  */
-extern uint32_t timer_dt_clock_frequency;
+extern uint32_t timer_clock_frequency_hz;
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
index 8411deb7e2=2E=2E789ad78a14 100644
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
@@ -26,6 +27,8 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     pi->arch_capabilities |=3D MASK_INSR(sve_encode_vl(get_sys_vl_len()),
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
=20
+    pi->arch_clock_frequency_hz =3D timer_clock_frequency_hz;
+
     /*
      * The GIC version(s) we're happy creating guests with=2E Right now f=
or
      * simplicity it is tied to the active hardware version, but this wil=
l
diff --git a/xen/arch/arm/time=2Ec b/xen/arch/arm/time=2Ec
index 6955b2788f=2E=2Ebcbd038cb2 100644
--- a/xen/arch/arm/time=2Ec
+++ b/xen/arch/arm/time=2Ec
@@ -35,7 +35,7 @@ uint64_t __read_mostly boot_count;
  * register-mapped time source in the SoC=2E */
 unsigned long __read_mostly cpu_khz;  /* CPU clock frequency in kHz=2E */
=20
-uint32_t __read_mostly timer_dt_clock_frequency;
+uint32_t __read_mostly timer_clock_frequency_hz;
=20
 static unsigned int timer_irq[MAX_TIMER_PPI];
=20
@@ -120,7 +120,7 @@ static void __init preinit_dt_xen_time(void)
     {
         cpu_khz =3D DIV_ROUND(rate, 1000);
         validate_timer_frequency();
-        timer_dt_clock_frequency =3D rate;
+        timer_clock_frequency_hz =3D rate;
     }
 }
=20
@@ -136,7 +136,8 @@ void __init preinit_xen_time(void)
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
index e95fa33eb7=2E=2Ec7118e7884 100644
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
diff --git a/xen/include/public/sysctl=2Eh b/xen/include/public/sysctl=2Eh
index d20ebf3644=2E=2E04cb1f3bdc 100644
--- a/xen/include/public/sysctl=2Eh
+++ b/xen/include/public/sysctl=2Eh
@@ -120,7 +120,17 @@ struct xen_sysctl_physinfo {
     uint32_t cpu_khz;
     uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
     uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_{X86,ARM,=2E=2E=2E}_=
??? */
-    uint32_t pad;
+    /*
+     * ARM only=2E The timer frequency, in Hz, that Xen is using=2E Eithe=
r
+     * "clock-frequency" property from DT timer node or CNTFRQ_EL0 value=
=2E
+     *
+     * As it's not possible to trap this register, we have to replicate t=
he
+     * value in the guest DT=2E
+     *
+     * =3D 0 =3D> non-ARM, or the frequency could not be determined=2E
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
---=Part.2672.a59d4b9a9baa91da.1a01f2fd9fa.d7cfef382de3e7c6=---

