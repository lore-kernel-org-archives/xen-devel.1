Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFA2CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 15:46:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442499.1660057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xETqv-00044K-S8; Wed, 07 Oct 2026 15:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442499.1660057; Wed, 07 Oct 2026 15:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xETqv-00044D-MK; Wed, 07 Oct 2026 15:46:45 +0000
Received: by outflank-mailman (input) for mailman id 1442499;
 Wed, 07 Oct 2026 15:46:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1170b93ac0003f66@swg.vates.tech>)
 id 1xETqt-0003r3-MX
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:46:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xETqt-008eFd-3R
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 17:46:43 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1170b93ac0003f66@swg.vates.tech>)
 id 6ac66961-8faa-0a2a0a5109dd-0a2a450ba5ac-12
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 17:46:43 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1170b93ac0003f66@swg.vates.tech>)
 id 6ac66960-b7e8-0a2a450b0019-b9ff1c22902f-4
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 17:46:42 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1170b93ac0003f66.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 15:46:37 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8A7A681F5F;
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
 q=dns/txt; s=selector1; bh=WwKq5yOW5P38TgAgPmeL7dXcpScmTECxeMSB9MdS3mo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=RhYHFS7z7YUntviwe2BgMSxCAn5BbYhUlzzJof7P8fDR5dh15rwFqvq5l8BW5cmV/YlWygQq1
 SjeH/pRT8q0w3heKyhkEdHGgEWJ6FZpXcueyZ3e0/3IacvF2GXUWTBTco2NTdLWES95Ii8OuFpt
 uFLTE/rSfIp9uXci9G7JquGTDJcCFZBeias4IJZBJN34j7aDloDZDLu2nUmrRF2K0Ds8wIGZYYs
 JjexdlCLv7I2xbaO/iL/45VXtAPado4t5EIyUD8tcHX4QMRF7ezbSBsVwUBpEXP2fD9j5XXJvXN
 3YSmqUHQFV+sNMrcNCWSFomUgwNxgwu/BGGVor/H5Muw==
X-Zone-Loop: 5a423810c237a6b2973e1c4a5a2daeea5bbc121134bd
x-campaign-type: default
x-transaction-id: a4b6c01e-995c-45bc-a4d1-1fd194071bc4
x-swg-uid: 01-b3ad82ba-bfb1-4773-ab6d-5880a001f0e2
X-Mailer: Sweego
Message-ID:
 <1791387997.8631fc262581453bbf619ec5b2062170.1a1170b93ac0003f66@vates.tech>
x-swg-bid: 1791387997.8631fc262581453bbf619ec5b2062170.1a1170b93ac0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH 2/4] libxl: Introduce CPU status map interface
Date: Wed,  7 Oct 2026 17:46:04 +0200
In-Reply-To: <20261007154607.119543-2-teddy.astie@vates.tech>
References: <1791387811.8631fc262581453bbf619ec5b2062170.1a11708bf380003f66@vates.tech>
 <20261007154607.119543-2-teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.703.294bea765ded471c.1a1170b91ff.9461faef7aed09b3=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791387996671
X-purgate-ID: tlsNG-42698a/1791388002-A88C99EA-74E899A5/0/0
X-purgate-type: clean
X-purgate-size: 4113

---=Part.703.294bea765ded471c.1a1170b91ff.9461faef7aed09b3=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Introduce a way to query CPU status map (online, present, possible)
using the newly introduced XEN_SYSCTL_get_cpu_status_map operation=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 tools/include/libxl=2Eh            | 11 +++++++++
 tools/libs/light/libxl=2Ec         | 39 ++++++++++++++++++++++++++++++++
 tools/libs/light/libxl_types=2Eidl |  6 +++++
 3 files changed, 56 insertions(+)

diff --git a/tools/include/libxl=2Eh b/tools/include/libxl=2Eh
index 7c098edab6=2E=2E08a2df7fc3 100644
--- a/tools/include/libxl=2Eh
+++ b/tools/include/libxl=2Eh
@@ -1536,6 +1536,14 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst,=
 const libxl_mac *src);
  */
 #define LIBXL_HAVE_XEN_PLATFORM_PCI_BAR_UC
=20
+/*
+ * LIBXL_HAVE_CPU_STATUS_MAP
+ *
+ * If this is defined, libxl_get_cpu_status_map() is available to query C=
PUs
+ * status map (online, present, possible)=2E
+ */
+#define LIBXL_HAVE_CPU_STATUS_MAP
+
 /*
  * LIBXL_HAVE_XENSTORE_QUOTA
  *
@@ -2191,6 +2199,9 @@ void libxl_pcitopology_list_free(libxl_pcitopology *=
, int num_devs);
 libxl_numainfo *libxl_get_numainfo(libxl_ctx *ctx, int *nr);
 void libxl_numainfo_list_free(libxl_numainfo *, int nr);
=20
+libxl_cpu_status_map *libxl_get_cpu_status_map(libxl_ctx *ctx, int *nr);
+void libxl_cpu_status_map_free(libxl_cpu_status_map *);
+
 libxl_vcpuinfo *libxl_list_vcpu(libxl_ctx *ctx, uint32_t domid,
                                 int *nb_vcpu, int *nr_cpus_out);
 void libxl_vcpuinfo_list_free(libxl_vcpuinfo *, int nr_vcpus);
diff --git a/tools/libs/light/libxl=2Ec b/tools/libs/light/libxl=2Ec
index a1fe16274d=2E=2E6d4b2cf4f4 100644
--- a/tools/libs/light/libxl=2Ec
+++ b/tools/libs/light/libxl=2Ec
@@ -546,6 +546,45 @@ libxl_numainfo *libxl_get_numainfo(libxl_ctx *ctx, in=
t *nr)
     return ret;
 }
=20
+libxl_cpu_status_map *libxl_get_cpu_status_map(libxl_ctx *ctx, int *nr)
+{
+    GC_INIT(ctx);
+    libxl_cpu_status_map *ret =3D NULL;
+
+    ret =3D libxl__zalloc(NOGC, sizeof(*ret));
+
+    *nr =3D xc_get_max_cpus(ctx->xch);
+    if (*nr < 0) {
+        LOGE(ERROR, "getting max_cpus");
+        goto out;
+    }
+
+    libxl_bitmap_alloc(ctx, &ret->cpu_online_map, *nr);
+    libxl_bitmap_alloc(ctx, &ret->cpu_present_map, *nr);
+    libxl_bitmap_alloc(ctx, &ret->cpu_possible_map, *nr);
+
+    if (xc_get_cpu_status_map(ctx->xch, *nr,
+                              ret->cpu_online_map=2Emap,
+                              ret->cpu_present_map=2Emap,
+                              ret->cpu_possible_map=2Emap)) {
+        LOGE(ERROR, "getting cpu_status_map");
+        goto out;
+    }
+
+out:
+    GC_FREE;
+    return ret;
+}
+
+void libxl_cpu_status_map_free(libxl_cpu_status_map *cpu_status_map)
+{
+    libxl_bitmap_dispose(&cpu_status_map->cpu_online_map);
+    libxl_bitmap_dispose(&cpu_status_map->cpu_possible_map);
+    libxl_bitmap_dispose(&cpu_status_map->cpu_present_map);
+
+    free(cpu_status_map);
+}
+
 const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
 {
     GC_INIT(ctx);
diff --git a/tools/libs/light/libxl_types=2Eidl b/tools/libs/light/libxl_t=
ypes=2Eidl
index a7893460f0=2E=2E33b81d93c8 100644
--- a/tools/libs/light/libxl_types=2Eidl
+++ b/tools/libs/light/libxl_types=2Eidl
@@ -1276,6 +1276,12 @@ libxl_pcitopology =3D Struct("pcitopology", [
     ("node", uint32),
     ], dir=3DDIR_OUT)
=20
+libxl_cpu_status_map =3D Struct("cpu_status_map", [
+    ("cpu_online_map",   libxl_bitmap),
+    ("cpu_present_map",  libxl_bitmap),
+    ("cpu_possible_map", libxl_bitmap),
+])
+
 libxl_sched_credit_params =3D Struct("sched_credit_params", [
     ("tslice_ms", integer),
     ("ratelimit_us", integer),
--=20
2=2E55=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.703.294bea765ded471c.1a1170b91ff.9461faef7aed09b3=---

