Return-Path: <SRS0=OTPY=JP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE64C433B4
	for <xen-devel@archiver.kernel.org>; Sun, 18 Apr 2021 18:03:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85405610E9
	for <xen-devel@archiver.kernel.org>; Sun, 18 Apr 2021 18:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85405610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.112521.214663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYBlk-0005oV-4c; Sun, 18 Apr 2021 18:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112521.214663; Sun, 18 Apr 2021 18:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYBlk-0005oO-1N; Sun, 18 Apr 2021 18:03:40 +0000
Received: by outflank-mailman (input) for mailman id 112521;
 Sun, 18 Apr 2021 18:03:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYBli-0005oJ-D2
 for xen-devel@lists.xenproject.org; Sun, 18 Apr 2021 18:03:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYBlh-0007XW-O1; Sun, 18 Apr 2021 18:03:37 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYBlh-0002Xn-D6; Sun, 18 Apr 2021 18:03:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=96wmvVmUvk1SAzPK9gUn+uB2sa5vhjbL3WN2g/dsoxA=; b=aZxBt3iu9qMEaW70ai9d/CTUqF
	ziUlpMM79w9T5GlIQNcigUelWKDSlHPYKwCE9g0O4varWnpJ34brmfwuLma4LTKEqm0xF5ZXlnHup
	TbcO9IyFUpbU0mW23JDz884z9D+f8sx/gsryL73l06X0DZcKZWTVIr5Wjxnjlj+f+6+g=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4] xen/arm64: Place a speculation barrier following an ret instruction
Date: Sun, 18 Apr 2021 19:03:34 +0100
Message-Id: <20210418180334.7829-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Some CPUs can speculate past a RET instruction and potentially perform
speculative accesses to memory before processing the return.

There is no known gadget available after the RET instruction today.
However some of the registers (such as in check_pending_guest_serror())
may contain a value provided by the guest.

In order to harden the code, it would be better to add a speculation
barrier after each RET instruction. The performance impact is meant to
be negligeable as the speculation barrier is not meant to be
architecturally executed.

Rather than manually inserting a speculation barrier, use a macro
which overrides the mnemonic RET and replace with RET + SB. We need to
use the opcode for RET to prevent any macro recursion.

This patch is only covering the assembly code. C code would need to be
covered separately using the compiler support.

Note that the definition of the macros sb needs to be moved earlier in
asm-arm/macros.h so it can be used by the new macro.

This is part of the work to mitigate straight-line speculation.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

It is not clear to me whether Armv7 (we don't officially support 32-bit
hypervisor on Armv8) is also affected by straight-line speculation.
The LLVM website suggests it is: https://reviews.llvm.org/D92395

For now only focus on arm64.

    Changes in v4:
        - Remove Bertand's reviewed-by
        - Use /* ... */ rather than // for comments
        - Remove arm32 changes
        - Explain why the macro sb is moved around

    Changes in v3:
        -  Add Bertrand's reviewed-by

    Changes in v2:
        - Use a macro rather than inserting the speculation barrier
        manually
        - Remove mitigation for arm32
---
 xen/include/asm-arm/arm64/macros.h |  6 ++++++
 xen/include/asm-arm/macros.h       | 18 +++++++++---------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/xen/include/asm-arm/arm64/macros.h b/xen/include/asm-arm/arm64/macros.h
index f981b4f43e84..5ad66efd6ba4 100644
--- a/xen/include/asm-arm/arm64/macros.h
+++ b/xen/include/asm-arm/arm64/macros.h
@@ -21,6 +21,12 @@
     ldr     \dst, [\dst, \tmp]
     .endm
 
+    .macro  ret
+        /* ret opcode */
+        .inst 0xd65f03c0
+        sb
+    .endm
+
 /*
  * Register aliases.
  */
diff --git a/xen/include/asm-arm/macros.h b/xen/include/asm-arm/macros.h
index 4833671f4ced..1aa373760f98 100644
--- a/xen/include/asm-arm/macros.h
+++ b/xen/include/asm-arm/macros.h
@@ -5,6 +5,15 @@
 # error "This file should only be included in assembly file"
 #endif
 
+    /*
+     * Speculative barrier
+     * XXX: Add support for the 'sb' instruction
+     */
+    .macro sb
+    dsb nsh
+    isb
+    .endm
+
 #if defined (CONFIG_ARM_32)
 # include <asm/arm32/macros.h>
 #elif defined(CONFIG_ARM_64)
@@ -20,13 +29,4 @@
     .endr
     .endm
 
-    /*
-     * Speculative barrier
-     * XXX: Add support for the 'sb' instruction
-     */
-    .macro sb
-    dsb nsh
-    isb
-    .endm
-
 #endif /* __ASM_ARM_MACROS_H */
-- 
2.17.1


