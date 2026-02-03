Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91938E87856
	for <xen-devel@archiver.kernel.org>; Tue,  3 Feb 2026 17:39:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1219545.1528461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKMY-0002Eg-Sd; Tue, 03 Feb 2026 17:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219545.1528461; Tue, 03 Feb 2026 17:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKMY-0002EX-PG; Tue, 03 Feb 2026 17:38:54 +0000
Received: by outflank-mailman (input) for mailman id 1219545;
 Tue, 03 Feb 2026 17:38:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vnKMX-0000Zt-5S
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 17:38:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 33bb85be-0127-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 18:38:51 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30E051063;
 Tue,  3 Feb 2026 09:38:44 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.54.220])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89D673F632;
 Tue,  3 Feb 2026 09:38:49 -0800 (PST)
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
X-Inumbo-ID: 33bb85be-0127-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 07/12] xen/arm: ffa: Fix RXTX_UNMAP ownership race
Date: Tue,  3 Feb 2026 18:38:02 +0100
Message-ID: <971bf27b9a2cafa0ed405a638a532b6fbbf51142.1770115302.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1770115301.git.bertrand.marquis@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rxtx_unmap() checks RX ownership without holding the RX/TX locks and
only enforces the ownership rule when FFA_RX_ACQUIRE is supported. This
allows a vCPU to acquire RX between the check and unmap, and it lets
RXTX_UNMAP proceed while RX is owned when buffers are not forwarded to
firmware.

Hold rx_lock/tx_lock across the ownership check and unmap, and deny
RXTX_UNMAP whenever RX is owned, independent of RX_ACQUIRE support. For
teardown, release RX ownership under the same lock window; use
FFA_RX_RELEASE directly because rx_lock is held, and clear the local
flag when the firmware path is unavailable.

Functional impact: RXTX_UNMAP now reliably returns DENIED while RX is
owned, and teardown releases/clears ownership without a race.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_rxtx.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
index eff95a7955d7..450ce102cbdc 100644
--- a/xen/arch/arm/tee/ffa_rxtx.c
+++ b/xen/arch/arm/tee/ffa_rxtx.c
@@ -220,7 +220,7 @@ err_unlock_rxtx:
     return ret;
 }
 
-static int32_t rxtx_unmap(struct domain *d)
+static int32_t rxtx_unmap(struct domain *d, bool teardown)
 {
     struct ffa_ctx *ctx = d->arch.tee;
     int32_t ret = FFA_RET_OK;
@@ -234,6 +234,36 @@ static int32_t rxtx_unmap(struct domain *d)
         goto err_unlock_rxtx;
     }
 
+    if ( !ctx->rx_is_free )
+    {
+        if ( teardown )
+        {
+            if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
+            {
+                int32_t rel_ret;
+
+                /* Can't use ffa_rx_release() while holding rx_lock. */
+                rel_ret = ffa_simple_call(FFA_RX_RELEASE, ctx->ffa_id,
+                                          0, 0, 0);
+                if ( rel_ret )
+                    gdprintk(XENLOG_DEBUG,
+                             "ffa: RX release during teardown failed: %d\n",
+                             rel_ret);
+                else
+                    ctx->rx_is_free = true;
+            }
+            else
+                ctx->rx_is_free = true;
+        }
+        else
+        {
+            gdprintk(XENLOG_DEBUG,
+                     "ffa: RXTX_UNMAP denied, RX buffer owned by VM\n");
+            ret = FFA_RET_DENIED;
+            goto err_unlock_rxtx;
+        }
+    }
+
     if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
     {
         ret = ffa_rxtx_unmap(ffa_get_vm_id(d));
@@ -261,7 +291,7 @@ err_unlock_rxtx:
 
 int32_t ffa_handle_rxtx_unmap(void)
 {
-    return rxtx_unmap(current->domain);
+    return rxtx_unmap(current->domain, false);
 }
 
 int32_t ffa_rx_acquire(struct ffa_ctx *ctx, void **buf, size_t *buf_size)
@@ -369,7 +399,7 @@ int32_t ffa_rxtx_domain_init(struct domain *d)
 
 void ffa_rxtx_domain_destroy(struct domain *d)
 {
-    rxtx_unmap(d);
+    rxtx_unmap(d, true);
 }
 
 void *ffa_rxtx_spmc_rx_acquire(void)
-- 
2.50.1 (Apple Git-155)


