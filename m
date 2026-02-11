Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464BDECD6CD
	for <xen-devel@archiver.kernel.org>; Wed, 11 Feb 2026 17:16:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1227993.1534366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDop-0004yg-Gz; Wed, 11 Feb 2026 17:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227993.1534366; Wed, 11 Feb 2026 17:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDop-0004yP-DP; Wed, 11 Feb 2026 17:16:03 +0000
Received: by outflank-mailman (input) for mailman id 1227993;
 Wed, 11 Feb 2026 17:16:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vqDon-0004U4-AV
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 17:16:01 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 55995b5d-076d-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 18:15:59 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A21EB497;
 Wed, 11 Feb 2026 09:15:52 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.53.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB1083F63F;
 Wed, 11 Feb 2026 09:15:57 -0800 (PST)
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
X-Inumbo-ID: 55995b5d-076d-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 02/12] xen/arm: ffa: Fix MEM_SHARE NS attribute handling
Date: Wed, 11 Feb 2026 18:15:26 +0100
Message-ID: <a1ad366eff0f0e41c8668ba13d42660c79405057.1770826406.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770826406.git.bertrand.marquis@arm.com>
References: <cover.1770826406.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FF-A memory attribute encoding is currently a literal value (0x2f),
which makes reviews and validation harder. In addition, MEM_SHARE
accepts the NS (non-secure) attribute bit even though the normal world
must not set it according to FF-A specification.

Introduce named attribute bit masks and express FFA_NORMAL_MEM_REG_ATTR
in terms of them for clarity.

Reject MEM_SHARE descriptors with the NS bit set, returning
INVALID_PARAMETERS to match FF-A v1.1 rules that prohibit normal world
from setting this bit.

Functional impact: MEM_SHARE now rejects descriptors with NS bit set
with the right error code, INVALID_PARAMETER.

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
- Fix functional impact to mention the error code fix as the case was
  already filtered before but with a non spec compliant code
- Add Jens R-b
---
 xen/arch/arm/tee/ffa_private.h | 17 ++++++++++++++++-
 xen/arch/arm/tee/ffa_shm.c     |  6 ++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index cd7ecabc7eff..b625f1c72914 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -129,11 +129,26 @@
 #define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
 #define FFA_HANDLE_INVALID              0xffffffffffffffffULL
 
+/* NS attribute was introduced in v1.1 */
+#define FFA_MEM_ATTR_NS                 BIT(6, U)
+
+#define FFA_MEM_ATTR_TYPE_DEV           (1U << 3)
+#define FFA_MEM_ATTR_TYPE_MEM           (2U << 4)
+
+#define FFA_MEM_ATTR_NC                 (1U << 2)
+#define FFA_MEM_ATTR_WB                 (3U << 2)
+
+#define FFA_MEM_ATTR_NON_SHARE          (0U)
+#define FFA_MEM_ATTR_OUT_SHARE          (2U)
+#define FFA_MEM_ATTR_INN_SHARE          (3U)
+
 /*
  * Memory attributes: Normal memory, Write-Back cacheable, Inner shareable
  * Defined in FF-A-1.1-REL0 Table 10.18 at page 175.
  */
-#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
+#define FFA_NORMAL_MEM_REG_ATTR         (FFA_MEM_ATTR_TYPE_MEM | \
+                                         FFA_MEM_ATTR_WB | \
+                                         FFA_MEM_ATTR_INN_SHARE)
 /*
  * Memory access permissions: Read-write
  * Defined in FF-A-1.1-REL0 Table 10.15 at page 168.
diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
index 8282bacf85d3..90800e44a86a 100644
--- a/xen/arch/arm/tee/ffa_shm.c
+++ b/xen/arch/arm/tee/ffa_shm.c
@@ -512,6 +512,12 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
     if ( ret )
         goto out_unlock;
 
+    if ( trans.mem_reg_attr & FFA_MEM_ATTR_NS )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out_unlock;
+    }
+
     if ( trans.mem_reg_attr != FFA_NORMAL_MEM_REG_ATTR )
     {
         ret = FFA_RET_NOT_SUPPORTED;
-- 
2.52.0


