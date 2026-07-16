Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BC6C44512
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 14:12:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364100.1615477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkMou-0004iP-Vj; Thu, 16 Jul 2026 14:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364100.1615477; Thu, 16 Jul 2026 14:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkMou-0004iC-S6; Thu, 16 Jul 2026 14:12:12 +0000
Received: by outflank-mailman (input) for mailman id 1364100;
 Thu, 16 Jul 2026 14:12:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6b44e953000edb5@swg.vates.tech>)
 id 1wkMos-0004dM-Sr
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 14:12:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkMos-00H0UB-9M
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 16:12:10 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6b44e953000edb5@swg.vates.tech>)
 id 6a58e6ac-bab6-0a2a0a5309dd-0a2a45069760-34
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:12:10 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6b44e953000edb5@swg.vates.tech>)
 id 6a58e6a8-195a-0a2a45060019-b9ff1c238695-7
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:12:10 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f6b44e953000edb5.00b for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 16 Jul 2026 14:11:46 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 64CE6829AE;
 Thu, 16 Jul 2026 16:11:45 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=O3jS1hGwFFGYaODk24bUorYDD+jc5AvhvGB0rmuBP+Y=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=KZyFj/37I5q+OV/J/E3YBji7Gu68CAPEqJQWVZQc7EHqVsMSbTWCDY6VYBTRQwv6DsR7nrHUE
 SOhODeNin6J4JiZZAWOHn7g9/5HuEMyyKPkxhnIA3hXlsD1kZdegC3UDcpQcC9CshcZsHO4AJnQ
 Mea3VWw7q5FioG1Faueca1sdGGQF3oQVNFJo3QsInEBAMY16gjm5JwqZmFb9odR+WERF5Sl8mHk
 5HDtEWPIEdzI+ihdbUhLV7aPIH/DjCcnzAEJMr9gQYkg6JT6ZcE96kEA3s5VuQqamrW4bBQKJYU
 OC7PiD/NrokzSeI+mUip7cjFmsaL6e0HB4W04zRnIOSw==
X-Zone-Loop: 781e1be57679ea5a7d4d250c7c8b002f80c8fbda3855
x-campaign-type: default
x-transaction-id: 700272a0-f2dd-4723-9617-216fef34d3f1
x-swg-uid: 01-819857be-b3b5-44ac-b5f8-13afc786dbde
X-Mailer: Sweego
Message-ID:
 <1784211106.8631fc262581453bbf619ec5b2062170.19f6b44e953000edb5@vates.tech>
x-swg-bid: 1784211106.8631fc262581453bbf619ec5b2062170.19f6b44e953000edb5
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
Subject: [PATCH v3 5/6] xen/arm: report clock_frequency via sysctl physinfo, not createdomain
Date: Thu, 16 Jul 2026 16:11:37 +0200
In-Reply-To: <20260716141138.88265-1-julian.vetter@vates.tech>
References: <1784210820.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@vates.tech>
 <20260716141138.88265-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.a0b.3d1c879108a8d336.19f6b44e7a7.106719f2257d1b88=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784211105703
X-purgate-ID: tlsNG-16d1c6/1784211130-FDA0C77B-CC92787C/0/0
X-purgate-type: clean
X-purgate-size: 11622

---=Part.a0b.3d1c879108a8d336.19f6b44e7a7.106719f2257d1b88=-
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
the GIC capability bits were already moved there=2E The field is only set
when booting via Device Tree=2E Systems booting via ACPI get the frequency
from firmware/CNTFRQ directly and leave it 0, same as 'property not
present'=2E

Although the CNTFRQ_EL0 register is 64 bits wide, and some current timer
implementations run at 1GHz, a 32bit value is sufficient to store the
timer value, because it only mirrors the DT 'clock-frequency' property,
which the bindins define as a single 32-bit cell=2E The
XEN_DOMCTL_INTERFACE_VERSION doesn't need to be bumped, because only a
previously zero'ed / ignored field is now used=2E

The xen_arch_domainconfig parameter passed to domain_vtimer_init() is no
longer needed, so drop that parameter entirely=2E libxl now fetches the
frequency via libxl_get_physinfo() in libxl__arch_domain_save_config()
instead of reading it back out of the createdomain reply=2E The OCaml
xen_arch_domainconfig mirror drops the field too=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v3:
- Replaced arch_clock_frequency by arch_clock_frequency_hz to clearly
  specify which granularity the value has
- Updated commit message and comments in the code to=2E=2E=2E
  - =2E=2E=2Emention why a 32bit value is "enough" for now
  - =2E=2E=2Emention behaviour when a guest boots via ACPI
---
 tools/libs/light/libxl=2Ec          |  1 +
 tools/libs/light/libxl_arm=2Ec      | 13 ++++++++++++-
 tools/libs/light/libxl_types=2Eidl  |  1 +
 tools/ocaml/libs/xc/xenctrl=2Eml    |  1 -
 tools/ocaml/libs/xc/xenctrl=2Emli   |  1 -
 xen/arch/arm/domain=2Ec             |  2 +-
 xen/arch/arm/include/asm/vtimer=2Eh |  3 +--
 xen/arch/arm/sysctl=2Ec             |  3 +++
 xen/arch/arm/vtimer=2Ec             |  4 +---
 xen/include/public/arch-arm=2Eh     | 16 +---------------
 xen/include/public/sysctl=2Eh       | 21 ++++++++++++++++++++-
 11 files changed, 41 insertions(+), 25 deletions(-)

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
index b396d5e615=2E=2Ed6d80ac55d 100644
--- a/xen/arch/arm/domain=2Ec
+++ b/xen/arch/arm/domain=2Ec
@@ -711,7 +711,7 @@ int arch_domain_create(struct domain *d,
     if ( (rc =3D domain_vgic_init(d, config->arch=2Enr_spis)) !=3D 0 )
         goto fail;
=20
-    if ( (rc =3D domain_vtimer_init(d, &config->arch)) !=3D 0 )
+    if ( (rc =3D domain_vtimer_init(d)) !=3D 0 )
         goto fail;
=20
     if ( (rc =3D tee_domain_init(d, config->arch=2Etee_type)) !=3D 0 )
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
index 3b0edf4cec=2E=2E060132dabb 100644
--- a/xen/arch/arm/sysctl=2Ec
+++ b/xen/arch/arm/sysctl=2Ec
@@ -15,6 +15,7 @@
=20
 #include <asm/arm64/sve=2Eh>
 #include <asm/gic=2Eh>
+#include <asm/time=2Eh>
=20
 #include <public/sysctl=2Eh>
=20
@@ -25,6 +26,8 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     pi->arch_capabilities |=3D MASK_INSR(sve_encode_vl(get_sys_vl_len()),
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
=20
+    pi->arch_clock_frequency_hz =3D timer_dt_clock_frequency;
+
     /*
      * The GIC version(s) we're happy creating guests with=2E  Right now =
for
      * simplicity it is tied to the active hardware version, but this wil=
l
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
index 6987f5bdf4=2E=2Eb88c61c8ff 100644
--- a/xen/include/public/arch-arm=2Eh
+++ b/xen/include/public/arch-arm=2Eh
@@ -334,7 +334,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA    2
=20
 struct xen_arch_domainconfig {
-    /* IN/OUT */
+    /* IN */
     uint8_t gic_version;
     /* IN - Contains SVE vector length divided by 128 */
     uint8_t sve_vl;
@@ -342,20 +342,6 @@ struct xen_arch_domainconfig {
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
index d20ebf3644=2E=2E7d051bf14f 100644
--- a/xen/include/public/sysctl=2Eh
+++ b/xen/include/public/sysctl=2Eh
@@ -120,7 +120,26 @@ struct xen_sysctl_physinfo {
     uint32_t cpu_khz;
     uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
     uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_{X86,ARM,=2E=2E=2E}_=
??? */
-    uint32_t pad;
+    /*
+     * ARM only, and only set when booting via Device Tree=2E Value, in H=
z, of
+     * the "clock-frequency" property in the DT timer node=2E The propert=
y may
+     * be present when the bootloader/firmware doesn't correctly set CNTF=
RQ
+     * to hold the timer frequency=2E
+     *
+     * As it's not possible to trap this register, we have to replicate t=
he
+     * value in the guest DT=2E
+     *
+     * This field mirrors the DT property (a single <u32> cell), independ=
ent of
+     * CNTFRQ_EL0's own width or any given implementation's actual freque=
ncy=2E
+     * Should the DT binding ever grow a wider encoding, this field would=
 need
+     * to grow (or gain a companion) to match, same as any other ABI chan=
ge=2E
+     *
+     * =3D 0 =3D> property not present, non-ARM, or booting via ACPI (ACP=
I
+     *        guests get the frequency from firmware/CNTFRQ instead, so
+     *        there is nothing to replicate)=2E
+     * > 0 =3D> Value of the property, in Hz=2E
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
---=Part.a0b.3d1c879108a8d336.19f6b44e7a7.106719f2257d1b88=---

