Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50849CA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 13:42:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446354.1662491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGIX-0001QA-EQ; Mon, 12 Oct 2026 13:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446354.1662491; Mon, 12 Oct 2026 13:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGIX-0001Q3-Am; Mon, 12 Oct 2026 13:42:37 +0000
Received: by outflank-mailman (input) for mailman id 1446354;
 Mon, 12 Oct 2026 13:42:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13059965e00080d7@swg.vates.tech>)
 id 1xGGIV-0001O7-GO
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:42:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGGIU-004fuy-TS
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:42:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13059965e00080d7@swg.vates.tech>)
 id 6acce3c1-2eae-0a2a0a5409dd-0a2a4501b832-34
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:42:34 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13059965e00080d7@swg.vates.tech>)
 id 6acce3ca-5984-0a2a45010019-b9ff1c229cbf-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:42:34 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13059965e00080d7.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 12 Oct 2026 13:42:20 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8759A82A40;
 Mon, 12 Oct 2026 15:42:18 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=a85r6Fs5csjfSABROt+SSPYoVpP3mVzgWm4LPVUti10=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=WgcM9hr0PHohlWrp3EoXCEvJ+xx74ctCvd717O/hLDV/42Jd/I6qpDocy8ueZ2RN6lKjGiltF
 hJwp2EhdQpDkalvBJEFr3ARFwIPVN8wGoC74AQsqWmBEfN/snNIeEbq0HU2EMtrijuYvOmUp9fY
 zTkRpD6ni5pX3WSrYn3n5enYBiClqzgmnIbbzcNJAxRc/iyUHyXl3jewzBjD9Czvs0wovESU3sn
 9VrBIJZlkllaKpUGIygZwAT+F4bqYahhkK5me/EWLkTlI6lgaR5SiMv4WhaLrMdGddGatctCSPc
 qTg2NTV3hZ501ekzOsLdmHYlfMIv97p9kPVDaXL5esZA==
X-Zone-Loop: 212d3c41c70e298f87fcf316de77e1fbd2991700bd2d
x-campaign-type: default
x-transaction-id: 70b243b9-2463-4ac8-beb1-1bbd3d6f5507
x-swg-uid: 01-eadd6832-b05b-431f-bd83-5d0160bbf3b7
X-Mailer: Sweego
Message-ID:
 <1791812540.8631fc262581453bbf619ec5b2062170.1a13059965e00080d7@vates.tech>
x-swg-bid: 1791812540.8631fc262581453bbf619ec5b2062170.1a13059965e00080d7
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
Subject: [PATCH v7 4/5] xen/arm: report clock_frequency via sysctl physinfo, not createdomain
Date: Mon, 12 Oct 2026 15:42:06 +0200
In-Reply-To: <1791812199.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@vates.tech>
References: <1791812199.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.103.56b182b31978e00e.1a1305994ae.6681578bd2ebe370=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791812539566
X-purgate-ID: tlsNG-d62444/1791812554-BD87F757-B77BD620/0/0
X-purgate-type: clean
X-purgate-size: 18846

---=Part.103.56b182b31978e00e.1a1305994ae.6681578bd2ebe370=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The xen_arch_domainconfig=2Eclock_frequency value is populated in
domain_vtimer_init() during XEN_DOMCTL_createdomain from the global
timer_dt_clock_frequency, which comes from the host's DT timer node and
has nothing to do with the domain being created=2E Like now removed
GIC_NATIVE resolution, this is a host-wide system property being
smuggled out through a domain-creation IN struct=2E

Expose it instead as a new arm_clock_frequency_hz field in
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
arm_clock_frequency_hz came from the DT property=2E Then libxl only emits
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
Reviewed-by: Michal Orzel <michal=2Eorzel@amd=2Ecom>
Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>
---
Changes in v7:
- Regenerated the golang bindings for the arm_clock_frequency_hz field
- Dropped clock_frequency from alloc_domaininfo()
- Added Reviewed-by
---
 tools/golang/xenlight/helpers=2Egen=2Ego          |  2 ++
 tools/golang/xenlight/types=2Egen=2Ego            |  1 +
 =2E=2E=2E/include/xen-tools/arm-arch-capabilities=2Eh | 10 +++++++
 tools/libs/light/libxl=2Ec                      |  1 +
 tools/libs/light/libxl_arm=2Ec                  | 29 +++++++++++++++++--
 tools/libs/light/libxl_types=2Eidl              |  1 +
 tools/ocaml/libs/xc/xenctrl=2Eml                |  1 -
 tools/ocaml/libs/xc/xenctrl=2Emli               |  1 -
 tools/ocaml/libs/xc/xenctrl_stubs=2Ec           |  5 +---
 xen/arch/arm/domain=2Ec                         |  2 +-
 xen/arch/arm/include/asm/time=2Eh               |  7 +++--
 xen/arch/arm/include/asm/vtimer=2Eh             |  3 +-
 xen/arch/arm/sysctl=2Ec                         |  5 ++++
 xen/arch/arm/time=2Ec                           |  9 ++++--
 xen/arch/arm/vtimer=2Ec                         |  4 +--
 xen/include/public/arch-arm=2Eh                 | 14 ---------
 xen/include/public/domctl=2Eh                   |  4 +--
 xen/include/public/sysctl=2Eh                   | 20 ++++++++++++-
 18 files changed, 81 insertions(+), 38 deletions(-)

diff --git a/tools/golang/xenlight/helpers=2Egen=2Ego b/tools/golang/xenli=
ght/helpers=2Egen=2Ego
index b0c09da910=2E=2E689e7398b1 100644
--- a/tools/golang/xenlight/helpers=2Egen=2Ego
+++ b/tools/golang/xenlight/helpers=2Egen=2Ego
@@ -3702,6 +3702,7 @@ x=2ECapVpmu =3D bool(xc=2Ecap_vpmu)
 x=2ECapGnttabV1 =3D bool(xc=2Ecap_gnttab_v1)
 x=2ECapGnttabV2 =3D bool(xc=2Ecap_gnttab_v2)
 x=2EArchCapabilities =3D uint32(xc=2Earch_capabilities)
+x=2EArmClockFrequencyHz =3D uint32(xc=2Earm_clock_frequency_hz)
=20
  return nil}
=20
@@ -3737,6 +3738,7 @@ xc=2Ecap_vpmu =3D C=2Ebool(x=2ECapVpmu)
 xc=2Ecap_gnttab_v1 =3D C=2Ebool(x=2ECapGnttabV1)
 xc=2Ecap_gnttab_v2 =3D C=2Ebool(x=2ECapGnttabV2)
 xc=2Earch_capabilities =3D C=2Euint32_t(x=2EArchCapabilities)
+xc=2Earm_clock_frequency_hz =3D C=2Euint32_t(x=2EArmClockFrequencyHz)
=20
  return nil
  }
diff --git a/tools/golang/xenlight/types=2Egen=2Ego b/tools/golang/xenligh=
t/types=2Egen=2Ego
index e0fd78ec03=2E=2E5a40583079 100644
--- a/tools/golang/xenlight/types=2Egen=2Ego
+++ b/tools/golang/xenlight/types=2Egen=2Ego
@@ -1149,6 +1149,7 @@ CapVpmu bool
 CapGnttabV1 bool
 CapGnttabV2 bool
 ArchCapabilities uint32
+ArmClockFrequencyHz uint32
 }
=20
 type Connectorinfo struct {
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
index a1fe16274d=2E=2E98c7f0fdb3 100644
--- a/tools/libs/light/libxl=2Ec
+++ b/tools/libs/light/libxl=2Ec
@@ -410,6 +410,7 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo =
*physinfo)
     physinfo->cap_gnttab_v2 =3D
         !!(xcphysinfo=2Ecapabilities & XEN_SYSCTL_PHYSCAP_gnttab_v2);
     physinfo->arch_capabilities =3D xcphysinfo=2Earch_capabilities;
+    physinfo->arm_clock_frequency_hz =3D xcphysinfo=2Earm_clock_frequency=
_hz;
=20
     GC_FREE;
     return 0;
diff --git a/tools/libs/light/libxl_arm=2Ec b/tools/libs/light/libxl_arm=
=2Ec
index b9c0c820d6=2E=2E47b662ea5c 100644
--- a/tools/libs/light/libxl_arm=2Ec
+++ b/tools/libs/light/libxl_arm=2Ec
@@ -252,6 +252,16 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
                                    libxl__domain_build_state *state,
                                    const struct xen_domctl_createdomain *=
config)
 {
+    libxl_physinfo info;
+    int rc;
+
+    libxl_physinfo_init(&info);
+    rc =3D libxl_get_physinfo(CTX, &info);
+    if (rc) {
+        LOG(ERROR, "failed to get physinfo");
+        goto out;
+    }
+
     switch (config->arch=2Egic_version) {
     case XEN_DOMCTL_CONFIG_GIC_V2:
         d_config->b_info=2Earch_arm=2Egic_version =3D LIBXL_GIC_VERSION_V=
2;
@@ -261,12 +271,25 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
         break;
     default:
         LOG(ERROR, "Unexpected gic version %u", config->arch=2Egic_versio=
n);
-        return ERROR_FAIL;
+        rc =3D ERROR_FAIL;
+        goto out;
     }
=20
-    state->clock_frequency =3D config->arch=2Eclock_frequency;
+    /*
+     * Pass the timer frequency on to the guest DT only when Xen took it =
from
+     * the host DT (XEN_SYSCTL_PHYSCAP_ARM_TIMER_DT_FREQ)=2E Otherwise th=
e guest
+     * gets the right value from CNTFRQ_EL0=2E
+     */
+    if (arch_capabilities_arm_timer_dt_freq(info=2Earch_capabilities))
+        state->clock_frequency =3D info=2Earm_clock_frequency_hz;
+    else
+        state->clock_frequency =3D 0;
=20
-    return 0;
+    rc =3D 0;
+out:
+    libxl_physinfo_dispose(&info);
+
+    return rc;
 }
=20
 int libxl__arch_domain_create(libxl__gc *gc,
diff --git a/tools/libs/light/libxl_types=2Eidl b/tools/libs/light/libxl_t=
ypes=2Eidl
index a7893460f0=2E=2E4284a4f577 100644
--- a/tools/libs/light/libxl_types=2Eidl
+++ b/tools/libs/light/libxl_types=2Eidl
@@ -1201,6 +1201,7 @@ libxl_physinfo =3D Struct("physinfo", [
     ("cap_gnttab_v1", bool),
     ("cap_gnttab_v2", bool),
     ("arch_capabilities", uint32),
+    ("arm_clock_frequency_hz", uint32),
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
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec b/tools/ocaml/libs/xc/x=
enctrl_stubs=2Ec
index 4a45a31c28=2E=2E180f2fbf45 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
+++ b/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
@@ -449,13 +449,10 @@ static value alloc_domaininfo(xc_domaininfo_t * info=
)
 	tag =3D 0; /* tag ARM */
=20
 	/* xen_arm_arch_domainconfig */
-	arch_config =3D caml_alloc_tuple(3);
+	arch_config =3D caml_alloc_tuple(2);
 	Field(arch_config, 0) =3D Val_int(info->arch_config=2Egic_version);
 	Field(arch_config, 1) =3D Val_int(info->arch_config=2Enr_spis);
=20
-	tmp =3D caml_copy_int32(info->arch_config=2Eclock_frequency);
-	Field(arch_config, 2) =3D tmp;
-
 #elif defined(__i386__) || defined(__x86_64__)
=20
 	tag =3D 1; /* tag x86 */
diff --git a/xen/arch/arm/domain=2Ec b/xen/arch/arm/domain=2Ec
index 5678ee3fe0=2E=2E4ca3a3749f 100644
--- a/xen/arch/arm/domain=2Ec
+++ b/xen/arch/arm/domain=2Ec
@@ -714,7 +714,7 @@ int arch_domain_create(struct domain *d,
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
index 8de4027b9c=2E=2Ecc42d1b532 100644
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
+    pi->arm_clock_frequency_hz =3D timer_clock_frequency_hz;
+    if ( timer_clock_frequency_from_dt )
+        pi->arch_capabilities |=3D XEN_SYSCTL_PHYSCAP_ARM_TIMER_DT_FREQ;
+
     switch ( gic_hw_version() )
     {
     case GIC_V2:
diff --git a/xen/arch/arm/time=2Ec b/xen/arch/arm/time=2Ec
index ccfb76e20f=2E=2E295afa685a 100644
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
@@ -130,7 +131,8 @@ static void __init preinit_dt_xen_time(void)
     {
         cpu_khz =3D DIV_ROUND(rate, 1000);
         validate_timer_frequency();
-        timer_dt_clock_frequency =3D rate;
+        timer_clock_frequency_hz =3D rate;
+        timer_clock_frequency_from_dt =3D true;
     }
 }
=20
@@ -146,7 +148,8 @@ void __init preinit_xen_time(void)
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
index 44c26fdc38=2E=2E5d15f572c7 100644
--- a/xen/include/public/arch-arm=2Eh
+++ b/xen/include/public/arch-arm=2Eh
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
index a1216d7287=2E=2E6f9b1624ad 100644
--- a/xen/include/public/sysctl=2Eh
+++ b/xen/include/public/sysctl=2Eh
@@ -108,6 +108,8 @@ struct xen_sysctl_tbuf_op {
 #define XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK  (0x1FU)
 #define XEN_SYSCTL_PHYSCAP_ARM_GIC_V2    (1U << 5)
 #define XEN_SYSCTL_PHYSCAP_ARM_GIC_V3    (1U << 6)
+/* See arm_clock_frequency_hz in struct xen_sysctl_physinfo=2E */
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
+    uint32_t arm_clock_frequency_hz;
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
---=Part.103.56b182b31978e00e.1a1305994ae.6681578bd2ebe370=---

