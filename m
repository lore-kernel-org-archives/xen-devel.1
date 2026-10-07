Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B3BCA6002
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 15:46:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442498.1660047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xETqt-0003qh-FX; Wed, 07 Oct 2026 15:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442498.1660047; Wed, 07 Oct 2026 15:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xETqt-0003qa-Cc; Wed, 07 Oct 2026 15:46:43 +0000
Received: by outflank-mailman (input) for mailman id 1442498;
 Wed, 07 Oct 2026 15:46:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1170b92c90003f66@swg.vates.tech>)
 id 1xETqs-0003qU-1F
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:46:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xETqr-008eFd-Bn
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 17:46:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1170b92c90003f66@swg.vates.tech>)
 id 6ac66961-8faa-0a2a0a5109dd-0a2a450ba5ac-2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 17:46:41 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1170b92c90003f66@swg.vates.tech>)
 id 6ac66960-b7e8-0a2a450b0019-b9ff1c22902f-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 17:46:41 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1170b92c90003f66.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 15:46:36 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 08DB781DEB;
 Wed,  7 Oct 2026 17:46:36 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=rk3uy03w5V24iPjfPh6M2D24moaVetkS2x93l1CxY9g=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=q96vPC+bHmZk2E383Ax0sG+CQg1LgqB9jVIwTfx6VntH/EhXke9YAl/RPI8dp5T4jAdjUTpyo
 SVWIXY3Be6rjQaxSa2zuCmtx8zRTHe64bvTRGRWhN3MeHuaG+eEkOQoc0gbjFQmhAyW9Y0sl0Sw
 uLPQOvBDWB1Nk2zoyX0wdE3ifwSaJEvdPGKKu4uLJ39ceoZppCeo71z8mkjJmR6BOOeW14ne9JW
 /BpUnEpoK15JxewL+SX+/5BcTPP8ZuUGYFmmyKumVHN+rYPfS5bihInoLVKbTeQR5VyWIZS+G3R
 Ui6i1r/Vzfz5jzVQuZrYMnP8x3yqnImnNr0Ml/LyEcgQ==
X-Zone-Loop: 87df29df85a04a18a7b16c952131a823607fd96f2a11
x-campaign-type: default
x-transaction-id: 11fc5f81-23fd-4004-88cc-f4a23a93d46b
x-swg-uid: 01-915d429a-e14a-48f4-81c0-dde98a2859e9
X-Mailer: Sweego
Message-ID:
 <1791387996.8631fc262581453bbf619ec5b2062170.1a1170b92c90003f66@vates.tech>
x-swg-bid: 1791387996.8631fc262581453bbf619ec5b2062170.1a1170b92c90003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [RFC PATCH 1/4] sysctl: Introduce XEN_SYSCTL_get_cpu_status_map
Date: Wed,  7 Oct 2026 17:46:03 +0200
In-Reply-To: <1791387811.8631fc262581453bbf619ec5b2062170.1a11708bf380003f66@vates.tech>
References: <1791387811.8631fc262581453bbf619ec5b2062170.1a11708bf380003f66@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.702.3f88af7e61409967.1a1170b9067.3da2fa25f2569846=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791387996263
X-purgate-ID: tlsNG-42698a/1791388001-19CC79EA-1AB07DBA/0/0
X-purgate-type: clean
X-purgate-size: 7687

---=Part.702.3f88af7e61409967.1a1170b9067.3da2fa25f2569846=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Introduce XEN_SYSCTL_get_cpu_status_map as a way to get bitmaps of
cpu_online_map, cpu_present_map and cpu_possible_map (if available)=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
On x86, cpu_possible_map doesn't exist, that may not be expected=2E

Should we add additional infos like cpu_sibling_mask and cpu_core_mask ?

 tools/include/xenctrl=2Eh     |  4 ++++
 tools/libs/ctrl/xc_misc=2Ec   | 45 +++++++++++++++++++++++++++++++++++++
 xen/common/sysctl=2Ec         | 34 ++++++++++++++++++++++++++++
 xen/include/public/sysctl=2Eh | 13 +++++++++++
 xen/xsm/flask/hooks=2Ec       |  1 +
 5 files changed, 97 insertions(+)

diff --git a/tools/include/xenctrl=2Eh b/tools/include/xenctrl=2Eh
index 9f00d4a19d=2E=2E55804f2f1c 100644
--- a/tools/include/xenctrl=2Eh
+++ b/tools/include/xenctrl=2Eh
@@ -1145,6 +1145,10 @@ typedef uint32_t xc_node_to_node_dist_t;
 int xc_physinfo(xc_interface *xch, xc_physinfo_t *info);
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo);
+int xc_get_cpu_status_map(xc_interface *xch, unsigned nr_cpus,
+                          xc_cpumap_t cpu_online_map,
+                          xc_cpumap_t cpu_present_map,
+                          xc_cpumap_t cpu_possible_map);
 int xc_microcode_update(xc_interface *xch, const void *buf,
                         size_t len, unsigned int flags);
 int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_=
ver);
diff --git a/tools/libs/ctrl/xc_misc=2Ec b/tools/libs/ctrl/xc_misc=2Ec
index 10ddf85667=2E=2Ebff4f5ff01 100644
--- a/tools/libs/ctrl/xc_misc=2Ec
+++ b/tools/libs/ctrl/xc_misc=2Ec
@@ -264,6 +264,51 @@ int xc_get_ucode_revision(xc_interface *xch,
     return 0;
 }
=20
+int xc_get_cpu_status_map(xc_interface *xch, unsigned nr_cpus,
+                          xc_cpumap_t cpu_online_map,
+                          xc_cpumap_t cpu_present_map,
+                          xc_cpumap_t cpu_possible_map)
+{
+    int ret;
+    struct xen_sysctl sysctl =3D {};
+    struct xen_sysctl_cpu_status_map cpu_status_map;
+    DECLARE_HYPERCALL_BOUNCE(cpu_online_map, (nr_cpus + 7) / 8,
+                             XC_HYPERCALL_BUFFER_BOUNCE_OUT);
+    DECLARE_HYPERCALL_BOUNCE(cpu_present_map, (nr_cpus + 7) / 8,
+                             XC_HYPERCALL_BUFFER_BOUNCE_OUT);
+    DECLARE_HYPERCALL_BOUNCE(cpu_possible_map, (nr_cpus + 7) / 8,
+                             XC_HYPERCALL_BUFFER_BOUNCE_OUT);
+
+    if ( (ret =3D xc_hypercall_bounce_pre(xch, cpu_online_map)) )
+        goto out;
+
+    if ( (ret =3D xc_hypercall_bounce_pre(xch, cpu_present_map)) )
+        goto out;
+
+    if ( (ret =3D xc_hypercall_bounce_pre(xch, cpu_possible_map)) )
+        goto out;
+
+    sysctl=2Ecmd =3D XEN_SYSCTL_get_cpu_status_map;
+
+    set_xen_guest_handle(cpu_status_map=2Ecpu_online_map=2Ebitmap, cpu_on=
line_map);
+    cpu_status_map=2Ecpu_online_map=2Enr_bits =3D nr_cpus;
+    set_xen_guest_handle(cpu_status_map=2Ecpu_present_map=2Ebitmap, cpu_p=
resent_map);
+    cpu_status_map=2Ecpu_present_map=2Enr_bits =3D nr_cpus;
+    set_xen_guest_handle(cpu_status_map=2Ecpu_possible_map=2Ebitmap, cpu_=
possible_map);
+    cpu_status_map=2Ecpu_possible_map=2Enr_bits =3D nr_cpus;
+
+    sysctl=2Eu=2Ecpu_status_map =3D cpu_status_map;
+
+    ret =3D do_sysctl(xch, &sysctl);
+
+out:
+    xc_hypercall_bounce_post(xch, cpu_online_map);
+    xc_hypercall_bounce_post(xch, cpu_present_map);
+    xc_hypercall_bounce_post(xch, cpu_possible_map);
+
+    return ret;
+}
+
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo)
 {
diff --git a/xen/common/sysctl=2Ec b/xen/common/sysctl=2Ec
index 8fb5ff0af3=2E=2E840b2243bf 100644
--- a/xen/common/sysctl=2Ec
+++ b/xen/common/sysctl=2Ec
@@ -474,6 +474,40 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u=
_sysctl)
         if ( ret !=3D -ENOSYS && ret !=3D -EOPNOTSUPP )
             copyback =3D 1;
         break;
+   =20
+    case XEN_SYSCTL_get_cpu_status_map:
+    {
+        struct xen_sysctl_cpu_status_map *csm =3D &op->u=2Ecpu_status_map=
;
+
+        if ( !guest_handle_is_null(csm->cpu_online_map=2Ebitmap) )
+        {
+            ret =3D cpumask_to_xenctl_bitmap(&csm->cpu_online_map,
+                                           &cpu_online_map);
+            if ( ret )
+                break;
+        }
+
+        if ( !guest_handle_is_null(csm->cpu_present_map=2Ebitmap) )
+        {
+            ret =3D cpumask_to_xenctl_bitmap(&csm->cpu_present_map,
+                                           &cpu_present_map);
+            if ( ret )
+                break;
+        }
+
+        if ( !guest_handle_is_null(csm->cpu_possible_map=2Ebitmap) )
+        {
+#ifdef CONFIG_X86
+            /* On x86, cpu_possible_map doesn't exist, use cpumask_all in=
stead=2E */
+            ret =3D cpumask_to_xenctl_bitmap(&csm->cpu_possible_map,
+                                           &cpumask_all);
+#else
+            ret =3D cpumask_to_xenctl_bitmap(&csm->cpu_possible_map,
+                                           &cpu_possible_map);
+#endif
+        }
+        break;
+    }
=20
     default:
         ret =3D arch_do_sysctl(op, u_sysctl);
diff --git a/xen/include/public/sysctl=2Eh b/xen/include/public/sysctl=2Eh
index 63d0ee062b=2E=2E3a2a1d2402 100644
--- a/xen/include/public/sysctl=2Eh
+++ b/xen/include/public/sysctl=2Eh
@@ -1181,6 +1181,17 @@ struct xen_sysctl_livepatch_op {
     } u;
 };
=20
+/*=20
+ * XEN_SYSCTL_get_cpu_status_map
+ *
+ * Get bitmaps of CPU status (possible, online, present)=2E
+ */
+struct xen_sysctl_cpu_status_map {
+    struct xenctl_bitmap cpu_online_map;
+    struct xenctl_bitmap cpu_present_map;
+    struct xenctl_bitmap cpu_possible_map;
+};
+
 #if defined(__i386__) || defined(__x86_64__)
 /*
  * XEN_SYSCTL_get_cpu_policy (x86 specific)
@@ -1262,6 +1273,7 @@ struct xen_sysctl {
 /* #define XEN_SYSCTL_set_parameter              28 */
 #define XEN_SYSCTL_get_cpu_policy                29
 #define XEN_SYSCTL_dt_overlay                    30
+#define XEN_SYSCTL_get_cpu_status_map            31
     uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
     union {
         struct xen_sysctl_readconsole       readconsole;
@@ -1288,6 +1300,7 @@ struct xen_sysctl {
         struct xen_sysctl_psr_alloc         psr_alloc;
         struct xen_sysctl_cpu_featureset    cpu_featureset;
         struct xen_sysctl_livepatch_op      livepatch;
+        struct xen_sysctl_cpu_status_map    cpu_status_map;
 #if defined(__i386__) || defined(__x86_64__)
         struct xen_sysctl_cpu_policy        cpu_policy;
 #endif
diff --git a/xen/xsm/flask/hooks=2Ec b/xen/xsm/flask/hooks=2Ec
index d65ba0aeae=2E=2E4ea0aeb1bb 100644
--- a/xen/xsm/flask/hooks=2Ec
+++ b/xen/xsm/flask/hooks=2Ec
@@ -952,6 +952,7 @@ static int cf_check flask_sysctl(const struct xen_sysc=
tl *op)
     case XEN_SYSCTL_numainfo:
     case XEN_SYSCTL_pcitopoinfo:
     case XEN_SYSCTL_get_cpu_policy:
+    case XEN_SYSCTL_get_cpu_status_map:
         return domain_has_xen(current->domain, XEN__PHYSINFO);
=20
     case XEN_SYSCTL_getdomaininfolist:
--=20
2=2E55=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.702.3f88af7e61409967.1a1170b9067.3da2fa25f2569846=---

