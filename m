Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8066C61DBE
	for <xen-devel@archiver.kernel.org>; Sat, 29 Aug 2026 05:08:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402615.1637620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0BIM-0007H6-7e; Sat, 29 Aug 2026 05:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402615.1637620; Sat, 29 Aug 2026 05:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0BIM-0007Gy-3H; Sat, 29 Aug 2026 05:07:58 +0000
Received: by outflank-mailman (input) for mailman id 1402615;
 Sat, 29 Aug 2026 05:07:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jan.SetjeEilers@oracle.com>) id 1x0BIK-0007Gc-DD
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 05:07:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0BIJ-00GNLT-Ab
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 07:07:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jan.SetjeEilers@oracle.com>)
 id 6a926906-8faa-0a2a0a5109dd-0a2a4509e760-34
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 07:07:55 +0200
Received: from [205.220.165.32] (helo=mx0a-00069f02.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jan.SetjeEilers@oracle.com>)
 id 6a926929-be1a-0a2a45090019-cddca5200b40-3
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 07:07:54 +0200
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67T4j77Y024032; Sat, 29 Aug 2026 05:07:43 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbqyrr0t3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Aug 2026 05:07:42 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 67T53x0n035474; Sat, 29 Aug 2026 05:07:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4gbnvbawh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Aug 2026 05:07:41 +0000 (GMT)
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67T56FsB001517;
 Sat, 29 Aug 2026 05:07:41 GMT
Received: from setje-aarch64-ol9-builds.osdevelopmeniad.oraclevcn.com
 (setje-aarch64-ol9-builds.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.248.24])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 4gbnvbaw2h-2; Sat, 29 Aug 2026 05:07:41 +0000 (GMT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=corp-2025-04-25 header.d=oracle.com header.i="@oracle.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=oW5UF
	RBVvmLX6waJJvDC7VRRMFdstu+Xd77ISLIKXY0=; b=MA/NCrF+vyWp+yHEkrcWa
	GomxF8CvVRgE10apE1Ze3cNUOPakmhN1r+cbQaZTUK4SP4NpcF3ijeuAW+qZ8TXq
	Na1pUxxP8Jug95OEo3U2rKjXUJayk/4Pt2Hgfm+0stcZOj9x6JO0G5N2ruFibLk7
	gKh0ZwrWzWP/uoyn7eZ5qSTfgRTvvbP1KP7gzlWnZtK2D6DpfxeT/0Tt/8JKx3tN
	9nBXpdqTOXS1ECowyDygIWyAeJ8miINgDecFbAbrsu/026/DkqVuor6pqjvGS30X
	dUPYxUQEe3IF0JamFKyyuT6R8PQCiPvFNgFKE1OabqLC/g2ZRBKocHDQXd4tHqCT
	g==
From: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
To: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>,
        xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 1/1] static-memory: allow skipping the cache flush
Date: Sat, 29 Aug 2026 05:06:11 +0000
Message-ID: <20260829050611.3353566-2-Jan.SetjeEilers@oracle.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260829050611.3353566-1-Jan.SetjeEilers@oracle.com>
References: <20260829050611.3353566-1-Jan.SetjeEilers@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608290041
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA0MiBTYWx0ZWRfX7kH/mzWCzH/7
 PB9bV8u8p+USg+Nv8wdvNtKt6rxJDTUlXsktgYL3DsaweNV+H5yoveemIbaao8E1+S3Ed0cZ8Dn
 VRjALdWOPE6gHHHmAjfWezLPm9Mj9Orw1JAt1aCaMODJ/mwUq+xalokSMYnIVn/jdyewri3MFgq
 q9V/Zcfn7D1B8ZRznB31XiwbjfF8zAsM2AR4CmBTJnCL3EneUT0O0CPdhqvTGA3JWvf1HCYOJw4
 QHJgRmz3eL2muPJoDMSc8vtmo/2qKXjFc/WTAkruDf/o8NTXfE4CvBRVabN3IUI0HwZiNiO7RXi
 BvwWO45Ekrn4wGJe3TbdYu9vpNdgL+6uCenUAWLOJaho87rKiKbCLYagLKLx8GTx98Dvqg6HCV6
 5a5UejfzKBysNC6nPm0DYuiDO/VoHGACCEE9gvrKfHkhzPAstnoo4nI+Pbx8LwPtLUfl+e1piJZ
 Y2cSHVQDQ2Sji9OvS/A==
X-Proofpoint-ORIG-GUID: JgDE75mghZLD7eF-8FUP-Rt00u3MJRls
X-Authority-Analysis: v=2.4 cv=fbCdDUQF c=1 sm=1 tr=0 ts=6a92691e cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=TQ28Xt2rEOyNch8bdtYA:9
X-Proofpoint-GUID: JgDE75mghZLD7eF-8FUP-Rt00u3MJRls
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA0MiBTYWx0ZWRfXw7lxSff8ipoI
 QuPrCIgOO5eUV7YTLWe6D1uvBha1OEopTfSl6AI7VRfEXC4WYsJlEuT/JBdwaX24obdNM9GqlpC
 4ShqNCidQRu3RuEy/eo/lM946h/JOI5IZ9zPUv8HsL/U6lHpvCw5
X-purgate-ID: tlsNG-bad1c0/1787980075-FC817034-F07CCC95/0/0
X-purgate-type: clean
X-purgate-size: 6323

Static memory acquisition follows the same cache-coherency policy as
ordinary heap allocation. Xen therefore cleans and invalidates every page
in each xen,static-mem bank before assigning it to a domain.

Static-memory support is currently enabled only on Arm, but its
implementation and this acquisition path are in common code.

This cache maintenance is independent of boot scrubbing, which clears
memory. With bootscrub=1 or the default bootscrub=idle, create_domUs()
acquires static banks before heap_init_late() starts boot scrubbing. The
pages are in-use by then, while boot scrubbing processes only free pages.
Neither mode therefore clears an assigned static bank.

Walking a large static bank can add several seconds to boot, including time
spent flushing pages Xen does not touch during domain construction.

If a platform permits those untouched pages to be cleared before guest
start, the guest cannot depend on their incoming contents. This is a
platform policy assumption, not a property established by Xen's boot
scrubbing. Xen need not make that initial data coherent with RAM. Xen still
cleans every page it writes while loading the guest kernel, initrd, and
device tree.

Add the default-on staticmem-cache-flush option. Specifying
no-staticmem-cache-flush passes MEMF_no_cache_flush when acquiring a
xen,static-mem bank. The existing behavior remains the default, and static
shared memory is unaffected.

Skipping the flush is safe only if the platform also guarantees that the
untouched pages are absent from all caches and no other agent writes them
before guest start. Such agents include firmware, non-coherent DMA, and
EL3 runtime services.

Assisted-by: Codex:GPT-5
Signed-off-by: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
---
 docs/misc/xen-command-line.pandoc      | 26 ++++++++++++++++++++++++++
 xen/common/device-tree/static-memory.c |  9 ++++++++-
 xen/common/page_alloc.c                |  6 ++++--
 xen/include/xen/mm.h                   |  2 ++
 4 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1c711fa980..3f5c27858c 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2647,6 +2647,32 @@ On Sappire and Emerald Rapids CPUs with May 2025 microcode or later, the
 `ibpb-alt=` option can be used to switch to the alternative mitigation for
 Intel SA-00982.  Intel suggest that some workloads will benefit from this.
 
+### staticmem-cache-flush (arm)
+> `= <boolean>`
+
+> Default: `true`
+
+Control the up-front per-page cache flush over dom0less `xen,static-mem`
+banks. Specify `no-staticmem-cache-flush` to skip it. Xen still cleans the
+guest kernel, initrd, and device tree pages it writes to guest RAM.
+
+Static-memory support is currently available only on Arm. Its implementation
+and this option live in common code.
+
+Here, cleaning means cache maintenance, not boot scrubbing. With
+`bootscrub=1` or the default `bootscrub=idle`, Xen assigns dom0less static
+banks before boot scrubbing starts. Assigned pages are no longer free, so
+boot scrubbing does not clear them. This option is therefore independent of
+`bootscrub`.
+
+Only disable this flush when the guest does not depend on the initial contents
+of pages Xen leaves untouched. For example, this may be true when the platform
+permits those pages to be cleared before guest start.
+
+The platform must also ensure that those pages are absent from all caches and
+rule out other writers before guest start. Such writers may include
+non-coherent DMA or EL3 runtime services active during domain construction.
+
 ### sync_console
 > `= <boolean>`
 
diff --git a/xen/common/device-tree/static-memory.c b/xen/common/device-tree/static-memory.c
index ffbc12aa24..ed155d162d 100644
--- a/xen/common/device-tree/static-memory.c
+++ b/xen/common/device-tree/static-memory.c
@@ -1,10 +1,15 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/init.h>
+#include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/static-memory.h>
 
 #include <asm/setup.h>
 
+static bool __initdata opt_staticmem_cache_flush = true;
+boolean_param("staticmem-cache-flush", opt_staticmem_cache_flush);
+
 static bool __init append_static_memory_to_bank(struct domain *d,
                                                 struct membank *bank,
                                                 mfn_t smfn,
@@ -54,7 +59,9 @@ static mfn_t __init acquire_static_memory_bank(struct domain *d,
     }
 
     smfn = maddr_to_mfn(*pbase);
-    res = acquire_domstatic_pages(d, smfn, PFN_DOWN(*psize), 0);
+    res = acquire_domstatic_pages(d, smfn, PFN_DOWN(*psize),
+                                  opt_staticmem_cache_flush ? 0 :
+                                  MEMF_no_cache_flush);
     if ( res )
     {
         printk(XENLOG_ERR
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1e47f38721..b2ede17bd2 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -3094,8 +3094,10 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
      * Ensure cache and RAM are consistent for platforms where the guest
      * can control its own visibility of/through the cache.
      */
-    for ( i = 0; i < nr_mfns; i++ )
-        flush_page_to_ram(mfn_x(smfn) + i, !(memflags & MEMF_no_icache_flush));
+    if ( !(memflags & MEMF_no_cache_flush) )
+        for ( i = 0; i < nr_mfns; i++ )
+            flush_page_to_ram(mfn_x(smfn) + i,
+                              !(memflags & MEMF_no_icache_flush));
 
     return pg;
 }
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index fd8b0ba3f5..511bbc56e0 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -228,6 +228,8 @@ struct npfec {
 #define  MEMF_no_icache_flush (1U<<_MEMF_no_icache_flush)
 #define _MEMF_no_scrub    8
 #define  MEMF_no_scrub    (1U<<_MEMF_no_scrub)
+#define _MEMF_no_cache_flush 9
+#define  MEMF_no_cache_flush (1U<<_MEMF_no_cache_flush)
 #define _MEMF_node        16
 #define  MEMF_node_mask   ((1U << (8 * sizeof(nodeid_t))) - 1)
 #define  MEMF_node(n)     ((((n) + 1) & MEMF_node_mask) << _MEMF_node)
-- 
2.47.3


