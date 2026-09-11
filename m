Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42457C88E56
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 12:48:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416561.1645541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50fh-0004j8-4u; Fri, 11 Sep 2026 12:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416561.1645541; Fri, 11 Sep 2026 12:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50fh-0004iy-0Q; Fri, 11 Sep 2026 12:48:01 +0000
Received: by outflank-mailman (input) for mailman id 1416561;
 Fri, 11 Sep 2026 12:47:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a090827272000c4f3@swg.vates.tech>)
 id 1x50ff-0004go-Dc
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:47:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50fe-008TeR-9z
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:47:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a090827272000c4f3@swg.vates.tech>)
 id 6aa3f877-bab6-0a2a0a5309dd-0a2a4502e99c-14
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:47:58 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a090827272000c4f3@swg.vates.tech>)
 id 6aa3f87d-6ca4-0a2a45020019-b9ff1c239bc3-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:47:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a090827272000c4f3.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 12:47:43 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 52F7081E4A;
 Fri, 11 Sep 2026 14:47:42 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=vrC5MCXxLXkzGn7Ngh7f+8ojnwijQbLllCJ+rZnRPgc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=OPkpc6pvgZSQvxmsmOL6Tj+9fky4rSsYhrMNQUkfLTJ9kL07+O1YWA86FbvEpuT35s0QnVfwl
 n+KH9ypUSOv4akxYTBupy8fH5EfAZILJq9qZLwA0c/YDxKi7dOrgbQAy6znP67Onz0jQfX3MwAo
 EzW0nP91ANi12s+0rTt0WvuUDydduMvPZgE7wBE1xGrEX6ogQzDUJQmrqTN83K1k2V66fqXGRll
 cjZcxUqY1B8x+IRVbK6IlGVMvY9VMdpgqNhMj5YnmSWHS0s27tFIxL7wcgcTiE75sW0NobVdi/k
 QS3sB3UraFeR+ShVOxFX2AC1gGsV9PEz++ErYh4yeV8g==
X-Zone-Loop: 4a3653298c3bf37ca16e2812419115f707825a9f6892
x-campaign-type: default
x-transaction-id: 78459a14-e521-4521-990a-8b7311a5bc2a
x-swg-uid: 01-92954f62-b3c4-493b-b03d-5b6ef9ae6f6d
X-Mailer: Sweego
Message-ID:
 <1789130863.8631fc262581453bbf619ec5b2062170.1a090827272000c4f3@vates.tech>
x-swg-bid: 1789130863.8631fc262581453bbf619ec5b2062170.1a090827272000c4f3
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
Subject: [PATCH v5 3/6] tools/arm: choose GIC version explicitly instead of relying on GIC_NATIVE
Date: Fri, 11 Sep 2026 14:47:33 +0200
In-Reply-To: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
References: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.b4.900c1da711343b33.1a09082703b.b4d96a58cee70c8d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789130862651
X-purgate-ID: tlsNG-720697/1789130878-F36BF2AC-B6BB2CCB/0/0
X-purgate-type: clean
X-purgate-size: 9446

---=Part.b4.900c1da711343b33.1a09082703b.b4d96a58cee70c8d=-
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

The LIBXL_GIC_VERSION enum value 0 is renamed from DEFAULT to NONE to
reflect that it now only means "the user did not pick a version"=2E
setdefault() resolves it before anything else can observe it, so there
is no longer a "default" left in the config=2E The xl=2Ecfg(5) gic_version
documentation is updated to match=2E

This guarantees no toolstack path can still produce
XEN_DOMCTL_CONFIG_GIC_NATIVE, in preparation for removing it from the
Xen side and from the ABI entirely=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v5:
- Go back to the initial per-version arch_capabilities_arm_gic_{v2,v3}()
  helpers instead of a generic arch_capabilities_arm_has(caps, mask)
- Validate an explicitly requested GIC version against the host
  capabilities, not just resolve an unspecified one
- Rename LIBXL_GIC_VERSION_DEFAULT to LIBXL_GIC_VERSION_NONE
- Document the change in xl=2Ecfg(5)
---
 docs/man/xl=2Ecfg=2E5=2Epod=2Ein                      |  9 ++--
 =2E=2E=2E/include/xen-tools/arm-arch-capabilities=2Eh | 21 +++++++++
 tools/libs/light/libxl_arm=2Ec                  | 45 +++++++++++++++++--
 tools/libs/light/libxl_types=2Eidl              |  4 +-
 tools/python/xen/lowlevel/xc/xc=2Ec             | 18 +++++++-
 5 files changed, 87 insertions(+), 10 deletions(-)

diff --git a/docs/man/xl=2Ecfg=2E5=2Epod=2Ein b/docs/man/xl=2Ecfg=2E5=2Epo=
d=2Ein
index d34951edb9=2E=2E6a5e75eeab 100644
--- a/docs/man/xl=2Ecfg=2E5=2Epod=2Ein
+++ b/docs/man/xl=2Ecfg=2E5=2Epod=2Ein
@@ -3081,15 +3081,16 @@ Emulate a GICv2
 Emulate a GICv3=2E Note that the emulated GIC does not support the
 GICv2 compatibility mode=2E
=20
-=3Ditem B<default>
+=3Ditem B<none>
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
 This requires hardware compatibility with the requested version, either
-natively or via hardware backwards compatibility support=2E
+natively or via hardware backwards compatibility support=2E The GIC versi=
ons
+the host can emulate for a guest are reported via C<XEN_SYSCTL_physinfo>=
=2E
=20
 =3Ditem B<vuart=3D"uart">
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
index 7e9f8a1bc3=2E=2E283cfb749b 100644
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
@@ -1800,6 +1797,48 @@ int libxl__arch_domain_build_info_setdefault(libxl_=
_gc *gc,
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
+    {
+        bool has_v3 =3D arch_capabilities_arm_gic_v3(physinfo->arch_capab=
ilities);
+        bool has_v2 =3D arch_capabilities_arm_gic_v2(physinfo->arch_capab=
ilities);
+
+        switch (b_info->arch_arm=2Egic_version) {
+        case LIBXL_GIC_VERSION_NONE:
+            if (has_v3)
+                b_info->arch_arm=2Egic_version =3D LIBXL_GIC_VERSION_V3;
+            else if (has_v2)
+                b_info->arch_arm=2Egic_version =3D LIBXL_GIC_VERSION_V2;
+            else {
+                LOG(ERROR, "No supported GIC version found on this host")=
;
+                return ERROR_FAIL;
+            }
+            break;
+
+        case LIBXL_GIC_VERSION_V3:
+            if (!has_v3) {
+                LOG(ERROR, "GICv3 requested but not supported on this hos=
t");
+                return ERROR_FAIL;
+            }
+            break;
+
+        case LIBXL_GIC_VERSION_V2:
+            if (!has_v2) {
+                LOG(ERROR, "GICv2 requested but not supported on this hos=
t");
+                return ERROR_FAIL;
+            }
+            break;
+
+        default:
+            LOG(ERROR, "Unknown GIC version %d", b_info->arch_arm=2Egic_v=
ersion);
+            return ERROR_FAIL;
+        }
+    }
+
     /* Sanitise SVE parameter */
     if (b_info->arch_arm=2Esve_vl) {
         unsigned int max_sve_vl =3D
diff --git a/tools/libs/light/libxl_types=2Eidl b/tools/libs/light/libxl_t=
ypes=2Eidl
index a7893460f0=2E=2E8699ab3013 100644
--- a/tools/libs/light/libxl_types=2Eidl
+++ b/tools/libs/light/libxl_types=2Eidl
@@ -520,10 +520,10 @@ libxl_vnode_info =3D Struct("vnode_info", [
     ])
=20
 libxl_gic_version =3D Enumeration("gic_version", [
-    (0, "DEFAULT"),
+    (0, "NONE"),
     (0x20, "v2"),
     (0x30, "v3")
-    ], init_val =3D "LIBXL_GIC_VERSION_DEFAULT")
+    ], init_val =3D "LIBXL_GIC_VERSION_NONE")
=20
 libxl_tee_type =3D Enumeration("tee_type", [
     (0, "none"),
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
---=Part.b4.900c1da711343b33.1a09082703b.b4d96a58cee70c8d=---

