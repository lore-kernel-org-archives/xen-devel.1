Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F573606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 17:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=Z7pZwhMm
Received: from list by lists.xenproject.org with outflank-mailman.1502674.1698684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWHEc-0007xu-9B; Wed, 25 Nov 2026 17:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502674.1698684; Wed, 25 Nov 2026 17:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWHEc-0007xm-4n; Wed, 25 Nov 2026 17:56:46 +0000
Received: by outflank-mailman (input) for mailman id 1502674;
 Wed, 25 Nov 2026 17:56:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xWHEa-0007uJ-El
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 17:56:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWHEZ-008bjM-R3
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 18:56:43 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6b07214a-bab6-0a2a0a5309dd-0a2a4503c0fa-28
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 18:56:43 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6b07215b-fae8-0a2a45030019-d1558031a92f-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 18:56:43 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4bb77a462c6so52320185e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:56:43 -0800 (PST)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6baa3c4dsm29953505f8f.46.2026.11.25.09.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 09:56:42 -0800 (PST)
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
        d=edera.dev; s=google; t=1795629403; x=1796234203; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQ6q5JFAKLwzgyyTbU3ej2UaVQIUZXaw93a3yaE4iPY=;
        b=Z7pZwhMm4CgyLfGEx65pd56GrXyscFYo9sCIQTShyHFFWze3Fe+bVgX7g11BR9LfyF
         Z+k5NZ5qj5mSbM+mIw6FJEBplKJ9TERSPoGKNNV3N8Y8e9klXfXPk9uxqZNJFgPoApE3
         tLgRnNSCkfRAaOGm6yhmY65LDc2iHtH/Q3jGbVwqByHZjTiVsWADcUzCiWfMqXkB4bjJ
         4ulNGDqEx7IpCuNDU2MkFkyWaCRzIaRoHR1tOqG7JmbLk0Sg+XHDYaPtznihozamJD1c
         5zQDrcoIEfvJn7sciUsU6kBpm3n4mroTzBDg4dW2JfINVSmaYoo/Rm1Edn0v+XHc3ZFg
         yqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629403; x=1796234203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQ6q5JFAKLwzgyyTbU3ej2UaVQIUZXaw93a3yaE4iPY=;
        b=gVf63h6PkjWgy7l+2sOgkWKBbrmtAELp5+Bi4wrTv3Mtsi8oKC5zhI1h7uPDlRj2ev
         ER9IBSPFlREsOUSbwGcmeQQGnt/+4e5My6C1ZnysxVhYloXXt5sPceaoO+dv8iLjyTNY
         vTGIBXrH95ILpBorcYAGSF4rfH5Hg257+LbjUKTox3Z3S4dsY5mbqjihQVWHYQg0yGji
         1z4EQagudOtrhabAg2dLET+6xjZ17z/qj8cxBfS6zxrhHpATRHNeTDJ0kvzkrHHFsJBf
         cnj4NICCDt0J15uqRAud2gvmS2EtlwAFOJznvviyUKiPJUpouHVIXIBwaZpTLTWOT0Nu
         /OfA==
X-Gm-Message-State: APuU4Z9jSmuiYlBxE6dZvG3ZdefNhhUPTGAn5FHTt0YcY064GeS6s4lz
	hwKn5xHOJ16Z4VC9XbzsWYz8Qn8vNt7qmDpiV6IhP+d8LaDbH+6BgN9kJLTo51CqlAqzWRKyRqD
	eEraGNGs=
X-Gm-Gg: AZFdTZdPtJJDCXtxTW5WTliHBT/ZiREE8rceF8m3GXYMz1pFFJbfGGfsa3Okw/mca1u
	ohYUYqxzOMSwA4pT522zieBb687qyaF9wPa41gtv/K1O5JPi6SeUAJir5/kbggBdtRrWRv4d8i5
	7FBkol2YyYQ2WnQWdlgJOJ2YYd88JBYFwfyJ+Qv2Ts1O9KYbBXvHDv6r4aW416uqd/WM7mz92VC
	T9WZHKwDBS4wq8Qi6lUrDlT5iBSJNWSKEti4ipzlk6BHGJqPWMamI5JE33mqr1emsM+fQfNx1X9
	Jmq6n/kewnavg53rN0moGI8X4eD/VIn/1lUB39XwsbFejtWSHb/ttA28Cv0fdbQ77+Kyb7dWpeO
	GSCZSKiILrRn48EYvpSm7DVxQcpAk7Tkfep/NUPcd6HXAAtgJmhR2hN2FEL1Fd6vojfOo1pXipX
	1aq8hxrHWFDlMvNIVATXsgZrC2ZVR1thKNkHBkBKwG9WpoWZbw0KlV0a7rPpMbe//pZInJoGQ9F
	HTgby6wDM5DPjurnyfrf8P8WES8wTKPu4pfudNPjuPMH6p7WhEFcb+z5HSdTP+9d1dwXf/rnKp+
	F4SuWSGwupwvxbjJ3CWClYxSRQ==
X-Received: by 2002:a05:600c:6dc9:b0:4b9:f90b:1c4d with SMTP id 5b1f17b1804b1-4bb8613950amr326062125e9.5.1795629402911;
        Wed, 25 Nov 2026 09:56:42 -0800 (PST)
From: Luca Di Maio <luca@edera.dev>
To: xen-devel@lists.xenproject.org
Cc: Luca Di Maio <luca@edera.dev>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 5/5] xen/arm64: use LSE for arch_fetch_and_add()
Date: Wed, 25 Nov 2026 18:55:52 +0100
Message-ID: <20261125175555.2110163-6-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125175555.2110163-1-luca@edera.dev>
References: <20261125175555.2110163-1-luca@edera.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1795629403-752854E9-1ABAEEB4/0/0
X-purgate-type: clean
X-purgate-size: 2200
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The spinlock tickets come from __sync_fetch_and_add(), which the
compiler builds from an exclusive loop for Armv8.0. On arm64, use
LDADDAL when the CPU has LSE and the builtin otherwise; the builtin
macro is now arm32 only, as it would replace the arm64 function.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Luca Di Maio <luca@edera.dev>
---
 xen/arch/arm/include/asm/arm64/system.h | 20 ++++++++++++++++++++
 xen/arch/arm/include/asm/system.h       |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/system.h b/xen/arch/arm/include/asm/arm64/system.h
index 2e2ee212a1..4cf3295b16 100644
--- a/xen/arch/arm/include/asm/arm64/system.h
+++ b/xen/arch/arm/include/asm/arm64/system.h
@@ -3,6 +3,7 @@
 #define __ASM_ARM64_SYSTEM_H
 
 #include <asm/arm64/cmpxchg.h>
+#include <asm/arm64/lse.h>
 
 /* Uses uimm4 as a bitmask to select the clearing of one or more of
  * the DAIF exception mask bits:
@@ -58,6 +59,25 @@ static inline int local_fiq_is_enabled(void)
     return !(flags & PSR_FIQ_MASK);
 }
 
+/* For Armv8.0 the compiler builds the builtin from an LL/SC loop. */
+static always_inline uint32_t arch_fetch_and_add(volatile uint32_t *ptr,
+                                                 uint32_t v)
+{
+    if ( system_uses_lse_atomics() )
+    {
+        uint32_t old;
+
+        asm volatile ( __LSE_PREAMBLE
+                       "ldaddal %w2, %w0, %1"
+                       : "=&r" (old), "+Q" (*ptr)
+                       : "r" (v)
+                       : "memory" );
+        return old;
+    }
+
+    return __sync_fetch_and_add(ptr, v);
+}
+
 #endif
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/system.h b/xen/arch/arm/include/asm/system.h
index 65d5c8e423..b988f79102 100644
--- a/xen/arch/arm/include/asm/system.h
+++ b/xen/arch/arm/include/asm/system.h
@@ -58,7 +58,9 @@ static inline int local_abort_is_enabled(void)
     return !(flags & PSR_ABT_MASK);
 }
 
+#ifdef CONFIG_ARM_32
 #define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
+#endif
 
 extern struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next);
 
-- 
2.47.3


