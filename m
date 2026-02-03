Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91936E8784C
	for <xen-devel@archiver.kernel.org>; Tue,  3 Feb 2026 17:47:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1219614.1528497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKUn-0006LY-Ok; Tue, 03 Feb 2026 17:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219614.1528497; Tue, 03 Feb 2026 17:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKUn-0006KU-Js; Tue, 03 Feb 2026 17:47:25 +0000
Received: by outflank-mailman (input) for mailman id 1219614;
 Tue, 03 Feb 2026 17:47:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vnKMZ-0000Zt-Q7
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 17:38:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 35442268-0127-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 18:38:53 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD3931063;
 Tue,  3 Feb 2026 09:38:46 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.54.220])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27CF83F632;
 Tue,  3 Feb 2026 09:38:52 -0800 (PST)
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
X-Inumbo-ID: 35442268-0127-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 09/12] xen/arm: ffa: Fix SEND2 SP support gating
Date: Tue,  3 Feb 2026 18:38:04 +0100
Message-ID: <9466059cffcae65acb96a6c3710778f2e9ebcbbd.1770115302.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1770115301.git.bertrand.marquis@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen only maps a VM RX/TX buffer into the SPMC when firmware supports
FFA_RX_ACQUIRE. Without that mapping, the SPMC cannot access the VM TX
buffer to relay FFA_MSG_SEND2 to a secure partition.

Advertise FFA_MSG_SEND2 to guests only when VM-to-VM is enabled or when
the firmware supports both FFA_MSG_SEND2 and FFA_RX_ACQUIRE, and reject
SEND2 to a secure partition otherwise. Add comments to document the
mapping/ownership dependency.

Functional impact: SEND2 to a secure partition is reported as
NOT_SUPPORTED when FFA_RX_ACQUIRE is absent.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c     |  8 +++++++-
 xen/arch/arm/tee/ffa_msg.c | 11 +++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index e9e020bb0cb3..a46c6e5e67f1 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -292,7 +292,13 @@ static void handle_features(struct cpu_user_regs *regs)
             ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
         break;
     case FFA_MSG_SEND2:
-        if ( ffa_fw_supports_fid(a1) || IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+        /*
+         * Forwarding SEND2 to an SP requires the SPMC to see the VM TX buffer.
+         * We only map VM RX/TX into the SPMC when RX_ACQUIRE is supported.
+         */
+        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) ||
+             (ffa_fw_supports_fid(FFA_MSG_SEND2) &&
+              ffa_fw_supports_fid(FFA_RX_ACQUIRE)) )
             ffa_set_regs_success(regs, 0, 0);
         else
             ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
index 10856fddcbc4..928f269f6c3a 100644
--- a/xen/arch/arm/tee/ffa_msg.c
+++ b/xen/arch/arm/tee/ffa_msg.c
@@ -274,6 +274,17 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
             ret = FFA_RET_NOT_SUPPORTED;
             goto out;
         }
+        /*
+         * The SPMC needs access to the VM TX buffer to relay SEND2.
+         * We only map VM RX/TX into the SPMC when RX_ACQUIRE is supported.
+         */
+        if ( !ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
+        {
+            ret = FFA_RET_NOT_SUPPORTED;
+            gdprintk(XENLOG_DEBUG,
+                     "ffa: msg_send2 to SP requires RX_ACQUIRE\n");
+            goto out;
+        }
 
         ret = ffa_simple_call(FFA_MSG_SEND2,
                               ((uint32_t)ffa_get_vm_id(src_d)) << 16, 0, 0, 0);
-- 
2.50.1 (Apple Git-155)


