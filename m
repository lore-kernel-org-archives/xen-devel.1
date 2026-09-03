Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D1AC624D6
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:44:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407374.1640489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28fP-0000z5-Ku; Thu, 03 Sep 2026 14:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407374.1640489; Thu, 03 Sep 2026 14:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28fP-0000yr-H5; Thu, 03 Sep 2026 14:43:51 +0000
Received: by outflank-mailman (input) for mailman id 1407374;
 Thu, 03 Sep 2026 14:43:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bertrand.marquis@arm.com>) id 1x28fN-0000kY-Js
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:43:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28fN-0045Cl-0K
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:43:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 6a998799-bab6-0a2a0a5309dd-0a2a4508ed7e-32
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:43:48 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 6a9987a4-f659-0a2a45080019-d98c6eacd0c0-1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:43:48 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA32E1596;
 Thu,  3 Sep 2026 07:43:43 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.7.135])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6269A3F673;
 Thu,  3 Sep 2026 07:43:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788446627; bh=1qC+KeWmCIuBxYNLKqeIe9W9yoXmdFcEs5sm74Rmt9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CA6AvtqkAIE0H3PwHE+KDhP0lxFY63e/bqCYni+vjHqXGjOhHqO2/KE+eho2nOh5Z
	 Gu4ZLmaxiVFWUReZZkehpC1/bFL2n6lcdD4bM6wV9apiT14j3t1pqZVATM1/kk8ZtY
	 rsPekRlWrlFaohTbP6Rk6RVEvoaguYMOcBGt1K+I=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jenswi@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v3 3/6] xen/arm: ffa: Tighten notification parameter validation
Date: Thu,  3 Sep 2026 16:43:28 +0200
Message-ID: <980875f99fe01ea85f2e453ea447fd14f07c5f5a.1788268510.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788268510.git.bertrand.marquis@arm.com>
References: <cover.1788268510.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1788446628-D4B7187B-4489A60F/0/0
X-purgate-type: clean
X-purgate-size: 6058

The notification handlers still validate overlapping subsets of their
inputs. BIND, UNBIND, and SET each decode caller and destination IDs
locally, GET still accepts a non-zero receiver vCPU ID and reserved flag
bits, and SET still accepts non-zero NS-virtual flags. BIND also treats
unsupported non-zero flag encodings as a supported-feature failure
instead of as malformed input.

Add ffa_notif_validate_params() and use it to centralize the common
caller/destination and non-zero bitmap checks for BIND, UNBIND, and SET.
Also reject malformed GET and SET requests locally before touching
cached state or forwarding anything to the SPMC. Keep BIND limited to
global notifications and reject unsupported non-zero flag encodings with
INVALID_PARAMETERS.

- add a shared parameter validator for notification caller/destination
  checks
- wire BIND and UNBIND through the shared helper and reject unsupported
  bind flag encodings with INVALID_PARAMETERS
- reject non-zero receiver vCPU and reserved flag bits in
  FFA_NOTIFICATION_GET
- reject non-zero flags in the NS-virtual FFA_NOTIFICATION_SET path

Functional impact: malformed notification requests are rejected
consistently earlier in the mediator.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
---
Changes since v2:
- none
Changes since v1:
- rename helper to ffa_notif_validate_params()
- add R-b from Jens
---
 xen/arch/arm/tee/ffa_notif.c | 61 +++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index a631481e3815..1260f98a77e9 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -44,21 +44,40 @@ static bool inject_notif_pending(struct domain *d)
     return false;
 }
 
+static int32_t ffa_notif_validate_params(uint16_t dom_id, uint16_t caller_id,
+                                         uint16_t dest_id, uint32_t bitmap_lo,
+                                         uint32_t bitmap_hi)
+{
+    if ( caller_id != dom_id || dest_id == dom_id || !dest_id )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    if ( !bitmap_lo && !bitmap_hi )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    return FFA_RET_OK;
+}
+
 int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+    int32_t ret;
     uint32_t src_dst = get_user_reg(regs, 1);
     uint32_t flags = get_user_reg(regs, 2);
     uint32_t bitmap_lo = get_user_reg(regs, 3);
     uint32_t bitmap_hi = get_user_reg(regs, 4);
+    uint16_t caller_id = src_dst & GENMASK(15, 0);
+    uint16_t dest_id = src_dst >> 16;
 
-    if ( (src_dst & GENMASK(15, 0)) != ffa_get_vm_id(d) )
+    if ( flags )    /* Only global notifications are supported */
         return FFA_RET_INVALID_PARAMETERS;
 
-    if ( flags )    /* Only global notifications are supported */
-        return FFA_RET_DENIED;
+    ret = ffa_notif_validate_params(ctx->ffa_id, caller_id, dest_id,
+                                    bitmap_lo, bitmap_hi);
+    if ( ret )
+        return ret;
 
-    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
+    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
         return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags,
                                bitmap_lo, bitmap_hi);
 
@@ -68,16 +87,22 @@ int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
 int32_t ffa_handle_notification_unbind(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+    int32_t ret;
     uint32_t src_dst = get_user_reg(regs, 1);
     uint32_t bitmap_lo = get_user_reg(regs, 3);
     uint32_t bitmap_hi = get_user_reg(regs, 4);
+    uint16_t caller_id = src_dst & GENMASK(15, 0);
+    uint16_t dest_id = src_dst >> 16;
 
-    if ( (src_dst & GENMASK(15, 0)) != ffa_get_vm_id(d) )
-        return FFA_RET_INVALID_PARAMETERS;
+    ret = ffa_notif_validate_params(ctx->ffa_id, caller_id, dest_id,
+                                    bitmap_lo, bitmap_hi);
+    if ( ret )
+        return ret;
 
-    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
-        return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_lo,
-                                bitmap_hi);
+    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
+        return ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_lo,
+                               bitmap_hi);
 
     return FFA_RET_NOT_SUPPORTED;
 }
@@ -144,6 +169,12 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
         return;
     }
 
+    if ( recv >> 16 || (flags & GENMASK(31, 4)) )
+    {
+        ffa_set_regs_error(regs, FFA_RET_INVALID_PARAMETERS);
+        return;
+    }
+
     if ( fw_notif_enabled && (flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
                                         FFA_NOTIF_FLAG_BITMAP_SPM )) )
     {
@@ -208,11 +239,19 @@ int32_t ffa_handle_notification_set(struct cpu_user_regs *regs)
     uint32_t flags = get_user_reg(regs, 2);
     uint32_t bitmap_lo = get_user_reg(regs, 3);
     uint32_t bitmap_hi = get_user_reg(regs, 4);
+    uint16_t caller_id = src_dst >> 16;
+    uint16_t dest_id = src_dst & GENMASK(15, 0);
+    int32_t ret;
+
+    ret = ffa_notif_validate_params(ffa_get_vm_id(d), caller_id, dest_id,
+                                    bitmap_lo, bitmap_hi);
+    if ( ret )
+        return ret;
 
-    if ( (src_dst >> 16) != ffa_get_vm_id(d) )
+    if ( flags )
         return FFA_RET_INVALID_PARAMETERS;
 
-    if ( FFA_ID_IS_SECURE(src_dst & GENMASK(15, 0)) && fw_notif_enabled )
+    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
         return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bitmap_lo,
                                bitmap_hi);
 
-- 
2.53.0


