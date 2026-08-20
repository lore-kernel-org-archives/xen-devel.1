Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D58C5DF87
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 12:40:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396457.1634304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx24Y-0003Rj-EL; Thu, 20 Aug 2026 12:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396457.1634304; Thu, 20 Aug 2026 12:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx24Y-0003RT-BQ; Thu, 20 Aug 2026 12:40:42 +0000
Received: by outflank-mailman (input) for mailman id 1396457;
 Thu, 20 Aug 2026 12:40:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01f2fd7e5000c4f3@swg.vates.tech>)
 id 1wx24X-0003QM-3L
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 12:40:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx24W-0023ST-GA
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 14:40:40 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01f2fd7e5000c4f3@swg.vates.tech>)
 id 6a86f5c5-2eae-0a2a0a5409dd-0a2a45028d6a-18
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 14:40:40 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01f2fd7e5000c4f3@swg.vates.tech>)
 id 6a86f5c8-6ca4-0a2a45020019-b9ff1c23a55f-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 14:40:40 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a01f2fd7e5000c4f3.00b for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Aug 2026 12:40:24 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9432E83985;
 Thu, 20 Aug 2026 14:40:23 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=IJH2HUzYWNXRVAto16EctIl+NY5cYVjwj2qJDihG+M0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=gYQWm7Rj+Oh2ZarD4c4H1sMz5cPAlHKomK222NvZtZrmX7F/o8fbn3Qa9bxWGVSUemNcYV7Li
 /Z7UN6AoEb3ZgPpo4xyfr//1+VZVv9Dly5QIZKhHy4eoX5RasCodcqfQzsjAQhotjFduF+6BsPE
 3iPUmf8Dj0SAGDysvRTvD02p6JSZm7rVQxnmH5A4lL5kJdjVHd1qJaR9ldm1e5R5mi4M8f1Juv+
 XQb++ukeq0mNe+SyYrdUmh42X91EymYxd7oQq+DXVhPbGtrbDefXWUfbNx7YieNrT5M1TnYiKQ/
 m9zw1+oyX7ho54E5lyrgPOfgPWrPAcXXF92qTmJJZiiA==
X-Zone-Loop: a84a9237816b35c13009cb664476e9ef8cefda7aa3ef
x-campaign-type: default
x-transaction-id: 00648aeb-0ac8-40b3-b0ae-1751fc39965c
x-swg-uid: 01-5ef02326-ce55-4969-bf7b-e014a950eadc
X-Mailer: Sweego
Message-ID:
 <1787229624.8631fc262581453bbf619ec5b2062170.1a01f2fd7e5000c4f3@vates.tech>
x-swg-bid: 1787229624.8631fc262581453bbf619ec5b2062170.1a01f2fd7e5000c4f3
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
Subject: [PATCH v4 3/6] tools/arm: choose GIC version explicitly instead of relying on GIC_NATIVE
Date: Thu, 20 Aug 2026 14:40:13 +0200
In-Reply-To: <20260820124016.2033421-1-julian.vetter@vates.tech>
References: <20260820123805.2033085-1-julian.vetter@vates.tech>
 <20260820124016.2033421-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2670.4ba10b5e3851bf08.1a01f2fd658.85baa265d6fc9dfa=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787229623896
X-purgate-ID: tlsNG-720697/1787229640-F16AF2AC-68CFD960/0/0
X-purgate-type: clean
X-purgate-size: 6203

---=Part.2670.4ba10b5e3851bf08.1a01f2fd658.85baa265d6fc9dfa=-
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

 * libxl__arch_domain_build_info_setdefault() resolves
   LIBXL_GIC_VERSION_DEFAULT to v3 if available, else v2, else fails,
   before the config is built=2E
 * The Python xc=2Edomain_create() binding does the same via a call to
   xc_physinfo()=2E
 * libxl__arch_domain_prepare_config() therefore only ever sees a
   concrete v2/v3 request and just validates it=2E The GIC_NATIVE case is
   dropped since setdefault() always resolves it first=2E

This guarantees no toolstack path can still produce
XEN_DOMCTL_CONFIG_GIC_NATIVE, in preparation for removing it from the
Xen side and from the ABI entirely=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v4:
- Fix a missing closing bracket in arch_capabilities_arm_has()
---
 =2E=2E=2E/include/xen-tools/arm-arch-capabilities=2Eh | 17 ++++++++++++++=
++
 tools/libs/light/libxl_arm=2Ec                  | 17 +++++++++++++---
 tools/python/xen/lowlevel/xc/xc=2Ec             | 20 ++++++++++++++++++-
 3 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/tools/include/xen-tools/arm-arch-capabilities=2Eh b/tools/inc=
lude/xen-tools/arm-arch-capabilities=2Eh
index 4aa4c6c34a=2E=2Ece1b3bdd71 100644
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
@@ -25,4 +26,20 @@ unsigned int arch_capabilities_arm_sve(unsigned int arc=
h_capabilities)
 #endif
 }
=20
+/*
+ * Generic test for any single-bit XEN_SYSCTL_PHYSCAP_ARM_* capability, e=
=2Eg=2E
+ * arch_capabilities_arm_has(caps, XEN_SYSCTL_PHYSCAP_ARM_GIC_V2)=2E Mult=
i-bit
+ * fields (like the SVE vector length above) still need their own decoder=
=2E
+ */
+static inline
+bool arch_capabilities_arm_has(unsigned int arch_capabilities,
+                               unsigned int mask)
+{
+#if defined(__arm__) || defined(__aarch64__)
+    return !!(arch_capabilities & mask);
+#else
+    return false;
+#endif
+}
+
 #endif /* ARM_ARCH_CAPABILITIES_H */
diff --git a/tools/libs/light/libxl_arm=2Ec b/tools/libs/light/libxl_arm=
=2Ec
index 7e9f8a1bc3=2E=2E926d651857 100644
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
@@ -1800,6 +1797,20 @@ int libxl__arch_domain_build_info_setdefault(libxl_=
_gc *gc,
     /* Trapping of unmapped accesses enabled by default=2E  */
     libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, true);
=20
+    /* Pick the best GIC version available if none was requested=2E */
+    if (b_info->arch_arm=2Egic_version =3D=3D LIBXL_GIC_VERSION_DEFAULT) =
{
+        if (arch_capabilities_arm_has(physinfo->arch_capabilities,
+                                      XEN_SYSCTL_PHYSCAP_ARM_GIC_V3))
+            b_info->arch_arm=2Egic_version =3D LIBXL_GIC_VERSION_V3;
+        else if (arch_capabilities_arm_has(physinfo->arch_capabilities,
+                                           XEN_SYSCTL_PHYSCAP_ARM_GIC_V2)=
)
+            b_info->arch_arm=2Egic_version =3D LIBXL_GIC_VERSION_V2;
+        else {
+            LOG(ERROR, "No supported GIC version found on this host");
+            return ERROR_FAIL;
+        }
+    }
+
     /* Sanitise SVE parameter */
     if (b_info->arch_arm=2Esve_vl) {
         unsigned int max_sve_vl =3D
diff --git a/tools/python/xen/lowlevel/xc/xc=2Ec b/tools/python/xen/lowlev=
el/xc/xc=2Ec
index 7a4bf54597=2E=2Ee9e1d8572e 100644
--- a/tools/python/xen/lowlevel/xc/xc=2Ec
+++ b/tools/python/xen/lowlevel/xc/xc=2Ec
@@ -163,7 +163,25 @@ static PyObject *pyxc_domain_create(XcObject *self,
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
+        if ( arch_capabilities_arm_has(pinfo=2Earch_capabilities,
+                                       XEN_SYSCTL_PHYSCAP_ARM_GIC_V3) )
+            config=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V3;
+        else if ( arch_capabilities_arm_has(pinfo=2Earch_capabilities,
+                                            XEN_SYSCTL_PHYSCAP_ARM_GIC_V2=
) )
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
---=Part.2670.4ba10b5e3851bf08.1a01f2fd658.85baa265d6fc9dfa=---

