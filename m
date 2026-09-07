Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77249C79F9E
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 11:56:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410804.1641610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Xwq-0007BL-DH; Mon, 07 Sep 2026 11:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410804.1641610; Mon, 07 Sep 2026 11:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Xwq-0007BE-Ac; Mon, 07 Sep 2026 11:55:40 +0000
Received: by outflank-mailman (input) for mailman id 1410804;
 Mon, 07 Sep 2026 11:55:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a07bb94a33000c4f3@swg.vates.tech>)
 id 1x3Xwn-0007B5-W7
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 11:55:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3Xwn-001C8S-CS
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 13:55:37 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a07bb94a33000c4f3@swg.vates.tech>)
 id 6a9ea62c-e002-0a2a0a5209dd-0a2a450ab44a-46
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 13:55:37 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a07bb94a33000c4f3@swg.vates.tech>)
 id 6a9ea638-f2d2-0a2a450a0019-b9ff1c23b31d-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 13:55:37 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a07bb94a33000c4f3.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 07 Sep 2026 11:55:35 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1AE6881FD4;
 Mon,  7 Sep 2026 13:55:35 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=YjOE8REo2CBY71a9iSMAFpW+kTRW8M15Sl+pkAQMNcg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=L1A/BXYO+iZJLCc4uQp7LOtWCSWAscanujONuGSszB9hn6T0zDPUoGZYbwVabwy9a6goCSglz
 PqiL60Ff6RIA4ettMaSgC1a7BcBXXeBgiaqpmiuSs3gY7/JcstM2Aoc7KO/CWk2EbndnVWjERbQ
 8doOinznqmuOHTfs7A5jLgmPjZukVfpYtQCa62J918aGsWDjmBofFs/ewajjxP8pB5AYfBcSdsn
 3oBIjNK5/8lv9/k9oUsibcVJYhB4C6UvXk4M3E1MMa/fa4VXuW5D9o5dWkT12vFhOYpFs9Hvq6z
 xc2B494n45FYGiiIvvxP/2ysfrBdQ5VPmkQydT/L2NXw==
X-Zone-Loop: 75edadf0f8b99601145d024117e651b3204e4512f6c0
x-campaign-type: default
x-transaction-id: 668a922f-16b7-477e-84a6-e8d8ed50026f
x-swg-uid: 01-b41cde92-c6b1-4d64-94d2-b12cbe190249
X-Mailer: Sweego
Message-ID:
 <1788782135.8631fc262581453bbf619ec5b2062170.1a07bb94a33000c4f3@vates.tech>
x-swg-bid: 1788782135.8631fc262581453bbf619ec5b2062170.1a07bb94a33000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH] hw/xen: Prepare qemu for multi-ioreqpage support
Date: Mon,  7 Sep 2026 13:55:28 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.37f2.6c69314bc0b464d5.1a07bb947b7.d34544470c674e2=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788782135226
X-purgate-ID: tlsNG-4011c0/1788782137-5A5DBCFC-2339E7C1/0/0
X-purgate-type: clean
X-purgate-size: 7926

---=Part.37f2.6c69314bc0b464d5.1a07bb947b7.d34544470c674e2=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When Xen gains support for ioreq servers backed by more than a single
ioreq page, which is needed once a domain's vCPU count exceeds what fits
on one page (XC_PAGE_SIZE / sizeof(ioreq_t) =3D 128 vCPUs), Qemu needs to
be extended to request as many ioreq frames as the domain's max vCPU
count requires, via xen_map_ioreq_server() and treat the mapped ioreq
region as a flat array of ioreq_t rather than a single shared_iopage_t=2E

To support this, xen_map_ioreq_server() now takes max_cpus and computes
the number of required ioreq frames and then requests that many frames
from the resource-mapping API=2E

XenIOState::shared_page is changed from shared_iopage_t * to ioreq_t *,
and xen_vcpu_eport()/xen_vcpu_ioreq() index it directly as a flat array,
matching how the Xen side will lay out multiple ioreq pages contiguously
via vmap()=2E

Also guard against hosts that don't support multi-page ioreq servers=2E
Currently the xen_get_ioreq_server_info()/xenforeignmemory_map() path
only gives out a single ioreq page, so bail out instead of silently
mapping fewer pages than max_cpus needs=2E Continuing past that one page
leaves xen_vcpu_eport()/xen_vcpu_ioreq() reading and writing past the
single mapped page for vCPUs beyond the first 128=2E Likewise, a host that
recognizes XENMEM_resource_ioreq_server but predates multi-page support
rejects frame indices beyond the legacy bufioreq/ioreq pair with EINVAL=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
This patch is the QEMU counterpart to the corresponding Xen-side ioreq
multi-page series, which adds support to expose more than one ioreq
frame per server depending on the number of vCPUs:

https://lore=2Ekernel=2Eorg/xen-devel/20260420093820=2E825969-1-julian=2Ev=
etter@vates=2Etech/

As long as this series hasn't landed this patch has no effect, other
than explicitly rejecting requests for HVM domains with more than 128
vCPUs=2E But, this isn't currenly possible because HVM_MAX_VCPUS is still
128 in Xen=2E So, on an unmodified Xen, num_ioreq_pages can never exceed
1=2E This patch and the series for Xen is just preparatory work=2E Once a
patch raises the HVM_MAX_VCPUS the ioreq server code is ready=2E
---
 hw/xen/xen-hvm-common=2Ec         | 39 ++++++++++++++++++++++++++++-----
 include/hw/xen/xen-hvm-common=2Eh | 10 ++++-----
 2 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/hw/xen/xen-hvm-common=2Ec b/hw/xen/xen-hvm-common=2Ec
index 62d88804c4=2E=2Ede729ead95 100644
--- a/hw/xen/xen-hvm-common=2Ec
+++ b/hw/xen/xen-hvm-common=2Ec
@@ -677,16 +677,19 @@ void xen_exit_notifier(Notifier *n, void *data)
     xs_daemon_close(state->xenstore);
 }
=20
-static int xen_map_ioreq_server(XenIOState *state)
+static int xen_map_ioreq_server(XenIOState *state, unsigned int max_cpus)
 {
     void *addr =3D NULL;
     xen_pfn_t ioreq_pfn;
     xen_pfn_t bufioreq_pfn;
     evtchn_port_t bufioreq_evtchn;
-    unsigned long num_frames =3D 1;
-    unsigned long frame =3D 1;
+    unsigned long num_ioreq_pages;
+    unsigned long num_frames;
+    unsigned long frame;
     int rc;
=20
+    num_ioreq_pages =3D DIV_ROUND_UP(max_cpus, XC_PAGE_SIZE / sizeof(iore=
q_t));
+
     /*
      * Attempt to map using the resource API and fall back to normal
      * foreign mapping if this is not supported=2E
@@ -696,7 +699,10 @@ static int xen_map_ioreq_server(XenIOState *state)
=20
     if (state->has_bufioreq) {
         frame =3D 0;
-        num_frames =3D 2;
+        num_frames =3D 1 + num_ioreq_pages;
+    } else {
+        frame =3D 1;
+        num_frames =3D num_ioreq_pages;
     }
     state->fres =3D xenforeignmemory_map_resource(xen_fmem, xen_domid,
                                          XENMEM_resource_ioreq_server,
@@ -711,6 +717,17 @@ static int xen_map_ioreq_server(XenIOState *state)
             state->buffered_io_page =3D addr;
             state->shared_page =3D addr + XC_PAGE_SIZE;
         }
+    } else if (errno =3D=3D EINVAL && num_ioreq_pages > 1) {
+        /*
+         * The host may predate support for more than a single ioreq fram=
e
+         * (i=2Ee=2E it rejects any frame index beyond the single bufiore=
q/ioreq
+         * pair with EINVAL)=2E We can't run this many vCPUs without an i=
oreq
+         * slot for each of them=2E
+         */
+        error_report("Xen does not support mapping %lu ioreq pages "
+                     "(needed for %u vCPUs)",
+                     num_ioreq_pages, max_cpus);
+        return -1;
     } else if (errno !=3D EOPNOTSUPP) {
         error_report("failed to map ioreq server resources: error %d hand=
le=3D%p",
                      errno, xen_xc);
@@ -740,6 +757,17 @@ static int xen_map_ioreq_server(XenIOState *state)
         if (state->shared_page =3D=3D NULL) {
             trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
=20
+            if (num_ioreq_pages > 1) {
+                /*
+                 * The legacy get_ioreq_server_info()/map() path only eve=
r
+                 * hands out a single ioreq page, so it has no way to giv=
e us
+                 * ioreq slots for every vCPU=2E
+                 */
+                error_report("ioreq server fallback path supports only 1 =
"
+                             "ioreq page=2E %lu pages are needed for %u v=
CPUs",
+                             num_ioreq_pages, max_cpus);
+                return -1;
+            }
             state->shared_page =3D xenforeignmemory_map(xen_fmem, xen_dom=
id,
                                                       PROT_READ | PROT_WR=
ITE,
                                                       1, &ioreq_pfn, NULL=
);
@@ -840,7 +868,7 @@ static void xen_do_ioreq_register(XenIOState *state,
      */
     qemu_register_wakeup_support();
=20
-    rc =3D xen_map_ioreq_server(state);
+    rc =3D xen_map_ioreq_server(state, max_cpus);
     if (rc < 0) {
         goto err;
     }
@@ -857,7 +885,6 @@ static void xen_do_ioreq_register(XenIOState *state,
=20
     state->ioreq_local_port =3D g_new0(evtchn_port_t, max_cpus);
=20
-    /* FIXME: how about if we overflow the page here? */
     for (i =3D 0; i < max_cpus; i++) {
         rc =3D qemu_xen_evtchn_bind_interdomain(state->xce_handle, xen_do=
mid,
                                               xen_vcpu_eport(state->share=
d_page,
diff --git a/include/hw/xen/xen-hvm-common=2Eh b/include/hw/xen/xen-hvm-co=
mmon=2Eh
index d177ff14ea=2E=2E7a0037aa45 100644
--- a/include/hw/xen/xen-hvm-common=2Eh
+++ b/include/hw/xen/xen-hvm-common=2Eh
@@ -25,13 +25,13 @@ extern DeviceListener xen_device_listener;
=20
 #define XEN_GRANT_ADDR_OFF (1ULL << 63)
=20
-static inline uint32_t xen_vcpu_eport(shared_iopage_t *shared_page, int i=
)
+static inline uint32_t xen_vcpu_eport(ioreq_t *shared_page, int i)
 {
-    return shared_page->vcpu_ioreq[i]=2Evp_eport;
+    return shared_page[i]=2Evp_eport;
 }
-static inline ioreq_t *xen_vcpu_ioreq(shared_iopage_t *shared_page, int v=
cpu)
+static inline ioreq_t *xen_vcpu_ioreq(ioreq_t *shared_page, int vcpu)
 {
-    return &shared_page->vcpu_ioreq[vcpu];
+    return &shared_page[vcpu];
 }
=20
 #define BUFFER_IO_MAX_DELAY  100
@@ -53,7 +53,7 @@ typedef struct XenPciDevice {
=20
 typedef struct XenIOState {
     ioservid_t ioservid;
-    shared_iopage_t *shared_page;
+    ioreq_t *shared_page;
     buffered_iopage_t *buffered_io_page;
     xenforeignmemory_resource_handle *fres;
     QEMUTimer *buffered_io_timer;
--=20
2=2E53=2E0



-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.37f2.6c69314bc0b464d5.1a07bb947b7.d34544470c674e2=---

