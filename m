Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991FC1093192
	for <xen-devel@archiver.kernel.org>; Fri, 20 Mar 2026 09:07:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1257869.1552124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Vpa-0006Cz-I4; Fri, 20 Mar 2026 09:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257869.1552124; Fri, 20 Mar 2026 09:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Vpa-0006Cp-EN; Fri, 20 Mar 2026 09:07:46 +0000
Received: by outflank-mailman (input) for mailman id 1257869;
 Fri, 20 Mar 2026 09:07:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GknJ=BU=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1w3VpZ-0005zQ-UZ
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 09:07:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4159f72e-243c-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 10:07:44 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FDDC1596;
 Fri, 20 Mar 2026 02:07:37 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.84.63])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E422C3F778;
 Fri, 20 Mar 2026 02:07:41 -0700 (PDT)
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
X-Inumbo-ID: 4159f72e-243c-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 1/2] xen/arm: ffa: Fix local ffa_vm_count shadowing
Date: Fri, 20 Mar 2026 10:07:21 +0100
Message-ID: <030d24e1776af7c2391c588bc696592a64a92c51.1773911799.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773911799.git.bertrand.marquis@arm.com>
References: <cover.1773911799.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ffa_handle_partition_info_get() declares a local variable named
ffa_vm_count, which hides the global atomic ffa_vm_count declared in
ffa_private.h.

This triggered the ECLAIR Rule 5.3 finding "non-compliant local variable
`ffa_vm_count'".

Rename the local counters to vm_count and sp_count and update their
uses.

No functional changes.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_partinfo.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index 4580bd5edb65..ed28820502f8 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -346,7 +346,7 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
     uint32_t dst_size = 0;
     size_t buf_size;
     void *dst_buf, *end_buf;
-    uint32_t ffa_vm_count = 0, ffa_sp_count = 0;
+    uint32_t vm_count = 0, sp_count = 0;
 
     ffa_uuid_set(&uuid,
              get_user_reg(regs, 1),
@@ -380,7 +380,7 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
 
         if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
         {
-            ret = ffa_get_sp_count(uuid, &ffa_sp_count);
+            ret = ffa_get_sp_count(uuid, &sp_count);
             if ( ret )
                 goto out;
         }
@@ -391,7 +391,7 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
          */
         if ( ffa_uuid_is_nil(uuid) )
         {
-            ffa_vm_count = get_ffa_vm_count();
+            vm_count = get_ffa_vm_count();
 
             /*
              * Workaround for Linux FF-A Driver not accepting to have its own
@@ -401,7 +401,7 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
              * the requester endpoint information should be included or not
              */
             if ( ACCESS_ONCE(ctx->guest_vers) < FFA_VERSION_1_2 )
-                ffa_vm_count -= 1;
+                vm_count -= 1;
         }
 
         goto out;
@@ -429,14 +429,14 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
 
     if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
     {
-        ret = ffa_get_sp_partinfo(uuid, &ffa_sp_count, &dst_buf, end_buf,
+        ret = ffa_get_sp_partinfo(uuid, &sp_count, &dst_buf, end_buf,
                                   dst_size);
 
         if ( ret )
             goto out_rx_release;
     }
 
-    ret = ffa_get_vm_partinfo(uuid, 0, &ffa_vm_count, &dst_buf, end_buf,
+    ret = ffa_get_vm_partinfo(uuid, 0, &vm_count, &dst_buf, end_buf,
                               dst_size);
 
 out_rx_release:
@@ -451,7 +451,7 @@ out:
         if ( flags || ACCESS_ONCE(ctx->guest_vers) == FFA_VERSION_1_0 )
             dst_size = 0;
 
-        ffa_set_regs_success(regs, ffa_sp_count + ffa_vm_count, dst_size);
+        ffa_set_regs_success(regs, sp_count + vm_count, dst_size);
     }
 }
 
-- 
2.52.0


