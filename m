Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50957CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 13:42:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446352.1662473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGIP-0000uJ-Qc; Mon, 12 Oct 2026 13:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446352.1662473; Mon, 12 Oct 2026 13:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGIP-0000uC-NR; Mon, 12 Oct 2026 13:42:29 +0000
Received: by outflank-mailman (input) for mailman id 1446352;
 Mon, 12 Oct 2026 13:42:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a130598c4300080d7@swg.vates.tech>)
 id 1xGGIN-0000tb-Mc
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:42:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGGIN-009ha2-38
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:42:27 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a130598c4300080d7@swg.vates.tech>)
 id 6acce3b6-e002-0a2a0a5209dd-0a2a450acd4e-30
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:42:27 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a130598c4300080d7@swg.vates.tech>)
 id 6acce3bf-f2d2-0a2a450a0019-b9ff1c2292e3-4
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:42:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a130598c4300080d7.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 12 Oct 2026 13:42:17 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E02D082A40;
 Mon, 12 Oct 2026 15:42:15 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=OQH8vM9AX9boPDt2rVv6oexA1hK9DmhNiTGZaa/4p6U=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=gvsTUCcPSgFRuN9Zs7HkRJ/0DdX829q20XhOPW/2RjQEavWVcGebuIRnIVDwcLenvLlZjG4LN
 SXxBlGFS1Bfv3byumWGNMNywzMvhV8P/GVuM/gGSYCLgPZZJ0IjTpd4XN3WPjG/EOl6xNPd0xpk
 xJz/5qlrehursNj+LRfcxssjw647bb1bpYfiZSCHMtxp85as+u7/o6vLiY0vFqlW8Ci+LVzobQg
 M1h9xFBBefyuDXSTVpvgA2mR0w3MoWrDY/HYcMVninFZe7+SzDHgh2iZk+JVL9MtlBUGATwVMO2
 tamOSiOu1s9Ui/oPSzjXYzH3O5NO1eJA9zdyzpqi4VBQ==
X-Zone-Loop: 0b24c2a16b9aae74f6bdebf5a5bf2e238c2887953fbb
x-campaign-type: default
x-transaction-id: 88a58fcc-c8f9-4fe2-b7e6-c9b8e47bbb78
x-swg-uid: 01-78aabbe3-329b-404f-8c9b-d8eea0f7bdc4
X-Mailer: Sweego
Message-ID:
 <1791812537.8631fc262581453bbf619ec5b2062170.1a130598c4300080d7@vates.tech>
x-swg-bid: 1791812537.8631fc262581453bbf619ec5b2062170.1a130598c4300080d7
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
Subject: [PATCH v7 2/5] tools/arm: choose GIC version explicitly instead of relying on GIC_NATIVE
Date: Mon, 12 Oct 2026 15:42:04 +0200
In-Reply-To: <1791812199.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@vates.tech>
References: <1791812199.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.101.496efd8cccc2d247.1a130598a37.9d32a5d92b62309f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791812536887
X-purgate-ID: tlsNG-4011c0/1791812546-50CCBCFC-B234A89E/0/0
X-purgate-type: clean
X-purgate-size: 8130

---=Part.101.496efd8cccc2d247.1a130598a37.9d32a5d92b62309f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

XEN_DOMCTL_CONFIG_GIC_NATIVE lets the toolstack ask Xen to silently
resolve the domain's GIC version to whatever the host hardware has=2E Xen
then writes the resolved value back into the same in/out
xen_arch_domainconfig the toolstack used as input, which is the kind of
API abuse we're trying to get rid of=2E The struct passed to createdomain
should only be an input parameter=2E

Move the "pick the best available GIC version" decision to the
toolstack, using the XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3 capability bits
already exposed via XEN_SYSCTL_physinfo:

 * libxl__arch_domain_build_info_setdefault() resolves the GIC version
   against those bits before the config is built=2E An unspecified version
   becomes v3 if available, else v2, else fails=2E An explicitly requested
   v2/v3 is validated against the same bits, so a version the host
   cannot provide is directly rejected in the toolstack=2E
 * The Python xc=2Edomain_create() binding does the same via a call to
   xc_physinfo()=2E
 * libxl__arch_domain_prepare_config() therefore only ever sees a
   concrete v2/v3 request and just validates it=2E The GIC_NATIVE case is
   dropped since setdefault() always resolves it first=2E

LIBXL_GIC_VERSION_DEFAULT keeps its name and value: xl=2Ecfg still accepts
"default" as the C<gic_version> keyword, and setdefault() resolves it to
a concrete v2/v3 before anything else can observe it=2E

This guarantees no toolstack path can still produce
XEN_DOMCTL_CONFIG_GIC_NATIVE, in preparation for removing it from the
Xen side and from the ABI entirely=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
Acked-by: Michal Orzel <michal=2Eorzel@amd=2Ecom>
Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>
---
Changes in v7:
- Added Acked-by
---
 docs/man/xl=2Ecfg=2E5=2Epod=2Ein                      |  4 +-
 =2E=2E=2E/include/xen-tools/arm-arch-capabilities=2Eh | 21 +++++++++
 tools/libs/light/libxl_arm=2Ec                  | 43 +++++++++++++++++--
 tools/python/xen/lowlevel/xc/xc=2Ec             | 18 +++++++-
 4 files changed, 80 insertions(+), 6 deletions(-)

diff --git a/docs/man/xl=2Ecfg=2E5=2Epod=2Ein b/docs/man/xl=2Ecfg=2E5=2Epo=
d=2Ein
index d34951edb9=2E=2E8daa9be123 100644
--- a/docs/man/xl=2Ecfg=2E5=2Epod=2Ein
+++ b/docs/man/xl=2Ecfg=2E5=2Epod=2Ein
@@ -3083,8 +3083,8 @@ GICv2 compatibility mode=2E
=20
 =3Ditem B<default>
=20
-Emulate the same version as the native GIC hardware used by the host wher=
e
-the domain was created=2E
+Let the toolstack choose the GIC version: GICv3 if the host supports it,
+otherwise GICv2=2E This is the default when C<gic_version> is not specifi=
ed=2E
=20
 =3Dback
=20
diff --git a/tools/include/xen-tools/arm-arch-capabilities=2Eh b/tools/inc=
lude/xen-tools/arm-arch-capabilities=2Eh
index 4aa4c6c34a=2E=2E21e3c73bd1 100644
--- a/tools/include/xen-tools/arm-arch-capabilities=2Eh
+++ b/tools/include/xen-tools/arm-arch-capabilities=2Eh
@@ -6,6 +6,7 @@
 #ifndef ARM_ARCH_CAPABILITIES_H
 #define ARM_ARCH_CAPABILITIES_H
=20
+#include <stdbool=2Eh>
 #include <stdint=2Eh>
 #include <xen/sysctl=2Eh>
=20
@@ -25,4 +26,24 @@ unsigned int arch_capabilities_arm_sve(unsigned int arc=
h_capabilities)
 #endif
 }
=20
+static inline
+bool arch_capabilities_arm_gic_v2(unsigned int arch_capabilities)
+{
+#if defined(__arm__) || defined(__aarch64__)
+    return MASK_EXTR(arch_capabilities, XEN_SYSCTL_PHYSCAP_ARM_GIC_V2);
+#else
+    return false;
+#endif
+}
+
+static inline
+bool arch_capabilities_arm_gic_v3(unsigned int arch_capabilities)
+{
+#if defined(__arm__) || defined(__aarch64__)
+    return MASK_EXTR(arch_capabilities, XEN_SYSCTL_PHYSCAP_ARM_GIC_V3);
+#else
+    return false;
+#endif
+}
+
 #endif /* ARM_ARCH_CAPABILITIES_H */
diff --git a/tools/libs/light/libxl_arm=2Ec b/tools/libs/light/libxl_arm=
=2Ec
index 7e9f8a1bc3=2E=2Eb9c0c820d6 100644
--- a/tools/libs/light/libxl_arm=2Ec
+++ b/tools/libs/light/libxl_arm=2Ec
@@ -196,9 +196,6 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     LOG(DEBUG, " - Allocate %u SPIs", config->arch=2Enr_spis);
=20
     switch (d_config->b_info=2Earch_arm=2Egic_version) {
-    case LIBXL_GIC_VERSION_DEFAULT:
-        config->arch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
-        break;
     case LIBXL_GIC_VERSION_V2:
         config->arch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V2;
         break;
@@ -1794,12 +1791,52 @@ int libxl__arch_domain_build_info_setdefault(libxl=
__gc *gc,
                                              libxl_domain_build_info *b_i=
nfo,
                                              const libxl_physinfo *physin=
fo)
 {
+    bool has_v3 =3D arch_capabilities_arm_gic_v3(physinfo->arch_capabilit=
ies);
+    bool has_v2 =3D arch_capabilities_arm_gic_v2(physinfo->arch_capabilit=
ies);
+
     /* ACPI is disabled by default */
     libxl_defbool_setdefault(&b_info->acpi, false);
=20
     /* Trapping of unmapped accesses enabled by default=2E  */
     libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, true);
=20
+    /*
+     * Resolve the GIC version against the host capabilities reported by
+     * XEN_SYSCTL_physinfo=2E If the user didn't request a specific versi=
on, pick
+     * the best one available=2E Otherwise validate the requested version=
 here,
+     * so a bad request fails early instead of in the hypervisor=2E
+     */
+    switch (b_info->arch_arm=2Egic_version) {
+    case LIBXL_GIC_VERSION_DEFAULT:
+        if (has_v3) {
+            b_info->arch_arm=2Egic_version =3D LIBXL_GIC_VERSION_V3;
+        } else if (has_v2) {
+            b_info->arch_arm=2Egic_version =3D LIBXL_GIC_VERSION_V2;
+        } else {
+            LOG(ERROR, "No supported GIC version found on this host");
+            return ERROR_FAIL;
+        }
+        break;
+
+    case LIBXL_GIC_VERSION_V3:
+        if (!has_v3) {
+            LOG(ERROR, "GICv3 requested but not supported on this host");
+            return ERROR_FAIL;
+        }
+        break;
+
+    case LIBXL_GIC_VERSION_V2:
+        if (!has_v2) {
+            LOG(ERROR, "GICv2 requested but not supported on this host");
+            return ERROR_FAIL;
+        }
+        break;
+
+    default:
+        LOG(ERROR, "Unknown GIC version %d", b_info->arch_arm=2Egic_versi=
on);
+        return ERROR_FAIL;
+    }
+
     /* Sanitise SVE parameter */
     if (b_info->arch_arm=2Esve_vl) {
         unsigned int max_sve_vl =3D
diff --git a/tools/python/xen/lowlevel/xc/xc=2Ec b/tools/python/xen/lowlev=
el/xc/xc=2Ec
index 7a4bf54597=2E=2E0127b4b1b7 100644
--- a/tools/python/xen/lowlevel/xc/xc=2Ec
+++ b/tools/python/xen/lowlevel/xc/xc=2Ec
@@ -163,7 +163,23 @@ static PyObject *pyxc_domain_create(XcObject *self,
                                       ~(XEN_X86_EMU_VPCI |
                                         XEN_X86_EMU_USE_PIRQ);
 #elif defined (__arm__) || defined(__aarch64__)
-    config=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
+    {
+        xc_physinfo_t pinfo;
+
+        if ( xc_physinfo(self->xc_handle, &pinfo) !=3D 0 )
+            return pyxc_error_to_exception(self->xc_handle);
+
+        if ( arch_capabilities_arm_gic_v3(pinfo=2Earch_capabilities) )
+            config=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V3;
+        else if ( arch_capabilities_arm_gic_v2(pinfo=2Earch_capabilities)=
 )
+            config=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V2;
+        else
+        {
+            errno =3D EINVAL;
+            PyErr_SetFromErrno(xc_error_obj);
+            return NULL;
+        }
+    }
 #else
 #error Architecture not supported
 #endif
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.101.496efd8cccc2d247.1a130598a37.9d32a5d92b62309f=---

