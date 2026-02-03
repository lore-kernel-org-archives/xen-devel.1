Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF98E87851
	for <xen-devel@archiver.kernel.org>; Tue,  3 Feb 2026 17:47:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1219612.1528492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKUn-0006JD-Gp; Tue, 03 Feb 2026 17:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219612.1528492; Tue, 03 Feb 2026 17:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKUn-0006J6-Cj; Tue, 03 Feb 2026 17:47:25 +0000
Received: by outflank-mailman (input) for mailman id 1219612;
 Tue, 03 Feb 2026 17:47:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vnKMe-0000Zt-R6
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 17:39:00 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 36fa34b3-0127-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 18:38:56 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84871497;
 Tue,  3 Feb 2026 09:38:49 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.54.220])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1D003F632;
 Tue,  3 Feb 2026 09:38:54 -0800 (PST)
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
X-Inumbo-ID: 36fa34b3-0127-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 11/12] xen/arm: ffa: Add MEM_SHARE page diagnostics
Date: Tue,  3 Feb 2026 18:38:06 +0100
Message-ID: <94e10f14d499d7e584fb0fbdd28d0288bb5831bd.1770115302.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1770115301.git.bertrand.marquis@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MEM_SHARE failures in get_shm_pages() are silent, which makes malformed
ranges and page mapping failures hard to diagnose.

Add debug logging for page validation failures:
- descriptor validation failures (unaligned, range short/overflow)
- per-page mapping failures (unmapped GFN, wrong p2m type)
- address overflow detection in range walks

Ratelimit temporary reclaim failures and log permanent reclaim failures
as errors.

No functional changes.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_shm.c | 73 ++++++++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
index 905a64e3db01..89161753e922 100644
--- a/xen/arch/arm/tee/ffa_shm.c
+++ b/xen/arch/arm/tee/ffa_shm.c
@@ -169,6 +169,12 @@ static int32_t get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
     uint64_t addr;
     uint64_t page_count;
     uint64_t gaddr;
+    int32_t ret = FFA_RET_OK;
+    const char *reason = NULL;
+    unsigned int bad_rg = 0;
+    unsigned int bad_pg = 0;
+    unsigned long bad_addr = 0;
+    p2m_type_t bad_t = p2m_invalid;
 
     for ( n = 0; n < range_count; n++ )
     {
@@ -176,34 +182,78 @@ static int32_t get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
         addr = ACCESS_ONCE(range[n].address);
 
         if ( !IS_ALIGNED(addr, FFA_PAGE_SIZE) )
-            return FFA_RET_INVALID_PARAMETERS;
+        {
+            ret = FFA_RET_INVALID_PARAMETERS;
+            reason = "unaligned";
+            bad_rg = n;
+            bad_addr = (unsigned long)addr;
+            goto out;
+        }
 
         for ( m = 0; m < page_count; m++ )
         {
             if ( pg_idx >= shm->page_count )
-                return FFA_RET_INVALID_PARAMETERS;
+            {
+                ret = FFA_RET_INVALID_PARAMETERS;
+                reason = "range overflow";
+                bad_rg = n;
+                bad_pg = m;
+                goto out;
+            }
 
             if ( !ffa_safe_addr_add(addr, m) )
-                return FFA_RET_INVALID_PARAMETERS;
+            {
+                ret = FFA_RET_INVALID_PARAMETERS;
+                reason = "addr overflow";
+                bad_rg = n;
+                bad_pg = m;
+                bad_addr = (unsigned long)addr;
+                goto out;
+            }
 
             gaddr = addr + m * FFA_PAGE_SIZE;
             gfn = gaddr_to_gfn(gaddr);
             shm->pages[pg_idx] = get_page_from_gfn(d, gfn_x(gfn), &t,
 						   P2M_ALLOC);
             if ( !shm->pages[pg_idx] )
-                return FFA_RET_DENIED;
+            {
+                ret = FFA_RET_DENIED;
+                reason = "gfn unmapped";
+                bad_rg = n;
+                bad_pg = m;
+                bad_addr = (unsigned long)gaddr;
+                goto out;
+            }
             /* Only normal RW RAM for now */
             if ( t != p2m_ram_rw )
-                return FFA_RET_DENIED;
+            {
+                ret = FFA_RET_DENIED;
+                reason = "p2m type";
+                bad_rg = n;
+                bad_pg = m;
+                bad_addr = (unsigned long)gaddr;
+                bad_t = t;
+                goto out;
+            }
             pg_idx++;
         }
     }
 
     /* The ranges must add up */
     if ( pg_idx < shm->page_count )
-        return FFA_RET_INVALID_PARAMETERS;
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        reason = "range short";
+        bad_pg = pg_idx;
+        goto out;
+    }
 
-    return FFA_RET_OK;
+out:
+    if ( ret )
+        gdprintk(XENLOG_DEBUG,
+                 "ffa: mem share pages invalid: %s rg %u pg %u addr %#lx p2m %u\n",
+                 reason ? reason : "unknown", bad_rg, bad_pg, bad_addr, bad_t);
+    return ret;
 }
 
 static void put_shm_pages(struct ffa_shm_mem *shm)
@@ -759,8 +809,10 @@ bool ffa_shm_domain_destroy(struct domain *d)
              * A temporary error that may get resolved a bit later, it's
              * worth retrying.
              */
-            printk(XENLOG_G_INFO "%pd: ffa: Failed to reclaim handle %#lx : %d\n",
-                   d, shm->handle, res);
+            if ( printk_ratelimit() )
+                printk(XENLOG_G_WARNING
+                       "%pd: ffa: Failed to reclaim handle %#lx : %d\n",
+                       d, shm->handle, res);
             break; /* We will retry later */
         default:
             /*
@@ -772,7 +824,8 @@ bool ffa_shm_domain_destroy(struct domain *d)
              * FFA_RET_NO_MEMORY might be a temporary error as it it could
              * succeed if retried later, but treat it as permanent for now.
              */
-            printk(XENLOG_G_INFO "%pd: ffa: Permanent failure to reclaim handle %#lx : %d\n",
+            printk(XENLOG_G_ERR
+                   "%pd: ffa: Permanent failure to reclaim handle %#lx : %d\n",
                    d, shm->handle, res);
 
             /*
-- 
2.50.1 (Apple Git-155)


