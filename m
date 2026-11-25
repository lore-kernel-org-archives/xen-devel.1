Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA819606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 17:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=YplBFpgD
Received: from list by lists.xenproject.org with outflank-mailman.1502668.1698648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWHER-0006x1-8n; Wed, 25 Nov 2026 17:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502668.1698648; Wed, 25 Nov 2026 17:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWHER-0006wt-5V; Wed, 25 Nov 2026 17:56:35 +0000
Received: by outflank-mailman (input) for mailman id 1502668;
 Wed, 25 Nov 2026 17:56:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xWHEP-0006wV-Gu
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 17:56:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWHEO-008bjM-MT
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 18:56:32 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6b07214a-bab6-0a2a0a5309dd-0a2a4503c0fa-8
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 18:56:32 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6b072150-fae8-0a2a45030019-d155dd34ad1c-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 18:56:32 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-4a9be758734so3862829f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:56:32 -0800 (PST)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6baa3c4dsm29953505f8f.46.2026.11.25.09.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 09:56:31 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=edera.dev header.i="@edera.dev" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1795629392; x=1796234192; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMliCiq+rMD1+mCQRY1dj6Jf7nFw2vsQlo6Vs/2xDuk=;
        b=YplBFpgDcQ+uerBkpxw6TLsqfWAvG7i3nP3psuqUF0SGuGgb24lqfspcJApemsgIu0
         qUkghBR4yEYwjGYDmtUHJpAKzoUTi6He12iup3lyc+BNMP4rTQE0lqtfaBpO2nyA/78H
         gE+kaN6NjgPyQmXIIoTr0kTq+8MZvLZP2uEuARc4FyVz2s2E2ca1WUdjDrig1Fyd/F4t
         1gYMM6bBkhAxDbKIExHmFABJo/1GfYWlaVCfpomWn4FU4XJ9RPS/oliRrvtFKpKKd8E7
         BUvsNX6bxwh3JJrTmX+q3f0RSOQ+wf+ioqx0sc4k9TFQoAaFPh8qhQvSntIhDj0QK0v7
         wGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629392; x=1796234192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eMliCiq+rMD1+mCQRY1dj6Jf7nFw2vsQlo6Vs/2xDuk=;
        b=JaBstAF6ulrMI0IeM4MJRXpfWhZOQrApGvMz0N/V0dIHA97X8kwcOj0LWOcQRDg4qO
         27WwTF5AngphOqgdn35M8dLVHuh4c0Yete7hWEOmEG6HVFTVPcq6lDmOol1RR8w3Nh1z
         vKesHpbhKz94+1ke8AzXy4SW93eeY4MuVStzsfWzT1gR1TYrprlQ9SNcJ3s4fFDfWoAx
         u6Mu0tn/EchRNn9J4g8wo+51eHXfJL0fmIS6EJyb6gy3GlJi0pdXKIlOCP2TfKqDXBp9
         udLF+bfRR/GCsHmvEWjvqpk4amdnEI+0zBKzxgOwZJ5d7uxZsdtHY+aWqUTvEfZg3y//
         hSZA==
X-Gm-Message-State: APuU4Z8EuW7+ezmRBEYZ7ZqEqQZe8Mq5VcB5ZlNgatbMLK7NMMDdnJ5/
	OCHblHhjS5jZYRFSFCrA2uuHj7oGP4vt4DKHFYxpIeJvjGX3iPbKNHwf5mALHlGT7duzbdr55so
	gEgU5O9U=
X-Gm-Gg: AZFdTZeKqi96g0w4HiXZ6tEqPay7txFEBPp0mJxrWqzN4ROvZQpqEGQUg6UAx9y5/l6
	b6Yx+osr10jPmrtI5kL/p9XX01JxWZt/ztS1+ULr8xxn3gbZyWwRWLsJuQ1CT1PGw5Hyta/0VhI
	vvz73FLsaqb8f2JnCRYxnP2TgfbN7wwetStnRjXtPbvutlP4YqOwpvjr7/LbojbO0cDOgbSDXio
	bEcngnxcnO+UE0LBgoryzCPcw0I0aoEw3Yd8w9gafAKUKqoXaYWKA04GRz2z5DidtFkJ3sNYFo1
	ySlDYSTravePtfYxo57/lh7zkDbLj1nAJAVNgXe16clK8rxbdjvpUEH4Tulpmwh46boGlH/UmPU
	IxpC7E7F8p0R7RyrnOzk9nrOm5Hw0dQDU0T/V+CVU0Cu4s5bodNqZD5JTMCVUvcc04xdEIseTzj
	fwSyJo0EkNgEYKw3OfVyYkbl5gZs22/TIP2LrwoTkuQgAAI2mGS4vxDjPSa3hb0ICi0fHx1waSJ
	JdZoTMf5CjNzLXk+HzFAqWpxNo2owekSSnjHPPuLwnh5WEXygHfLAqHVPQzgN0irhdBI+rGcTWB
	+clt3jqpb+AcLQehABqE5p78fZgvtJ+WMv0zfOFIX+Vrq48=
X-Received: by 2002:a5d:6691:0:b0:4a6:c3f:9d0e with SMTP id ffacd0b85a97d-4abb3d2c0bemr26319938f8f.44.1795629392005;
        Wed, 25 Nov 2026 09:56:32 -0800 (PST)
From: Luca Di Maio <luca@edera.dev>
To: xen-devel@lists.xenproject.org
Cc: Luca Di Maio <luca@edera.dev>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/5] xen/arm64: detect the LSE atomic instructions
Date: Wed, 25 Nov 2026 18:55:48 +0100
Message-ID: <20261125175555.2110163-2-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125175555.2110163-1-luca@edera.dev>
References: <20261125175555.2110163-1-luca@edera.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1795629392-6C6DE4E9-BB5C0772/0/0
X-purgate-type: clean
X-purgate-size: 3905
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Load/store exclusive loops give no forward-progress guarantee, so many
CPUs contending on one cache line can livelock. Add the
ARM64_HAS_LSE_ATOMICS capability and system_uses_lse_atomics(), patched
at boot like Linux's alternative_has_cap_likely(), for the next patches.
Assemblers older than binutils 2.26 lack .arch_extension, so Xen built
with one keeps the exclusive loops.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Luca Di Maio <luca@edera.dev>
---
 xen/arch/arm/arch.mk                  |  3 +++
 xen/arch/arm/cpufeature.c             | 10 +++++++++
 xen/arch/arm/include/asm/arm64/lse.h  | 31 +++++++++++++++++++++++++++
 xen/arch/arm/include/asm/cpufeature.h |  3 ++-
 4 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/include/asm/arm64/lse.h

diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index dea8dbd18a..fe8e02229f 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -19,6 +19,9 @@ endif
 CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
 $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
 
+# Binutils >= 2.26
+$(call as-option-add,CFLAGS-$(CONFIG_ARM_64),CC,".arch_extension lse",-DHAVE_AS_LSE)
+
 ifneq ($(filter command line environment,$(origin CONFIG_EARLY_PRINTK)),)
     $(error You must use 'make menuconfig' to enable/disable early printk now)
 endif
diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 8d8cd19a96..144c3789a3 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -22,6 +22,11 @@ static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
 {
     return system_cpuinfo.isa64.sb;
 }
+
+static bool has_lse_atomics(const struct arm_cpu_capabilities *entry)
+{
+    return system_cpuinfo.isa64.atomic >= 2;
+}
 #endif
 
 static const struct arm_cpu_capabilities arm_features[] = {
@@ -31,6 +36,11 @@ static const struct arm_cpu_capabilities arm_features[] = {
         .capability = ARM_HAS_SB,
         .matches = has_sb_instruction,
     },
+    {
+        .desc = "LSE atomic instructions",
+        .capability = ARM64_HAS_LSE_ATOMICS,
+        .matches = has_lse_atomics,
+    },
 #endif
     {},
 };
diff --git a/xen/arch/arm/include/asm/arm64/lse.h b/xen/arch/arm/include/asm/arm64/lse.h
new file mode 100644
index 0000000000..dbe75dfc59
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm64/lse.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * As Linux's asm/lse.h: LSE atomics always complete, where load/store
+ * exclusive loops can livelock under contention. Each atomic keeps the
+ * barriers of its load/store exclusive version.
+ */
+#ifndef __ASM_ARM64_LSE_H
+#define __ASM_ARM64_LSE_H
+
+#include <asm/alternative.h>
+
+#define __LSE_PREAMBLE ".arch_extension lse\n"
+
+/* Patched at boot, like Linux's alternative_has_cap_likely(). */
+static always_inline bool system_uses_lse_atomics(void)
+{
+#ifdef HAVE_AS_LSE
+    register_t ret;
+
+    asm_inline volatile ( ALTERNATIVE("mov %0, #0", "mov %0, #1",
+                                      ARM64_HAS_LSE_ATOMICS)
+                          : "=r" (ret) );
+
+    return likely(ret);
+#else
+    /* The compiler drops the LSE blocks, which this assembler can't take. */
+    return false;
+#endif
+}
+
+#endif /* __ASM_ARM64_LSE_H */
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index c554686415..4d097a77ce 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -76,8 +76,9 @@
 #define ARM_WORKAROUND_BHB_SMCC_3 15
 #define ARM_HAS_SB 16
 #define ARM64_WORKAROUND_1508412 17
+#define ARM64_HAS_LSE_ATOMICS 18
 
-#define ARM_NCAPS           18
+#define ARM_NCAPS           19
 
 #ifndef __ASSEMBLER__
 
-- 
2.47.3


