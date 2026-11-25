Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC66606A323
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=bPILghYY
Received: from list by lists.xenproject.org with outflank-mailman.1502672.1698676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWHEZ-0007fs-17; Wed, 25 Nov 2026 17:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502672.1698676; Wed, 25 Nov 2026 17:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWHEY-0007fi-SD; Wed, 25 Nov 2026 17:56:42 +0000
Received: by outflank-mailman (input) for mailman id 1502672;
 Wed, 25 Nov 2026 17:56:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xWHEX-0007aF-Jl
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 17:56:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWHEX-008bjM-05
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 18:56:41 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6b07214a-bab6-0a2a0a5309dd-0a2a4503c0fa-22
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 18:56:40 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6b072158-fae8-0a2a45030019-d1558032b945-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 18:56:40 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4bb6886d30aso58145685e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:56:40 -0800 (PST)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6baa3c4dsm29953505f8f.46.2026.11.25.09.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 09:56:40 -0800 (PST)
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
        d=edera.dev; s=google; t=1795629400; x=1796234200; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vLhUIRBt4y5uDDya8KhqZTo/KHVhlEiHBpLxjgCzjJI=;
        b=bPILghYYdA825fZ5lO+5pymfvP1y6ANVHS07+d+tqKqovFPdbHqbL77iPsvMeZ7VW0
         aaqqtqPfZegQvAtHyZF9J8UR45lwPi3ahuoElgBJHWB/bNq4u5/HG9roLXpXIzlt2wTh
         CoDL7DcAWARo098uJZtwr+KYiniZ5hWvwlDtRzmKDLn4N41pjbuHtI2FubQSCvBnzfEd
         yvQmL/oRhdxqvi0FxVEZCJ9lauAetVxdrTtcU+TaDCQCZbgx+DVq7wDV+QFNiaUszIPO
         DkpQwKhMuAAM/Pqc4GNwr2p8EC59ViUPMaA4aSeahhbz2u/gvvFy01cDPtRk1w8WBGN9
         FCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629400; x=1796234200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vLhUIRBt4y5uDDya8KhqZTo/KHVhlEiHBpLxjgCzjJI=;
        b=fLUj196jWUyYAmnoCZcP9iADe3+Tq0BLgWe3xtrvLEetMQhAu4k3yY9MW2JICHnmvt
         vv6vQjZB93HovDaCsuk8o5Oo93ZlgyFxWaPq9HaX57RoHeUrgXxgkYAkj44Vye8he67C
         6iEiPZxj1FRxMfD54tBd4o+J10nR8Z0aorQvII/fWOrL9Ki5ajcBmoG8fUTAELPC5tfg
         j08bmkts/PmwTEgm3YehPXKM8ykxoGNxpqZmTWMcf1lkWqdxuN07tcO0j3k69k0jzETs
         E8fPDZm5ESPJk7bGfVCg4YE3PrWMnfQJ4FTymSK8cnb17oihdorNYxOcILT2j1gfMmku
         go4w==
X-Gm-Message-State: APuU4Z/T5GTMVKWVv3HyurrF56rmbYsR0YG/7zINMGlpc1KWjXTwf0QO
	Rg2/dz4T8XLQAjlIlqt8caceo1Ufz26jz5tnh+BEwlR7V79QSLoS0o8AGc6j37wn28reMsFJlXq
	XxODDQFM=
X-Gm-Gg: AZFdTZembMkkrc8A+WiJvsqV9sRWxloKOJUh4LLhh70Ne6gPmql/LzMq78yJvjACNHc
	0xVoKxErWsQqw96vmpYEhhflTP0H48bRqjPpAFM8D6simyNI8cRhzWcbUS2SsauXAp46dOsGaKk
	EFNZ0WG783XwSyBbORLM/wwEdZR/zC4VijqrwXbagboZTKZIqkFrgrhxAllrZZ8Y16xBQHrY+4O
	7Z1EHb0WKtRJpxVzhWYnleAxUdhUf8iQLiawrF4VUYXWytlfGhZKLPBrbGouyN9BaP5Kk/N72W6
	KNwc5E5mfNkJtKBwjyc77u49WqYWtSfJvlhx839ytCzXGnu1DzjPWEzQhsZMeCUULqsU6kWHGq/
	m+qrOVgPwFc1x72cG6qixUoENN3VYowUUIv+LCrnypLte5ppvDLdrryfhc5+9wIL4e92vp7V6LG
	4pCORRCbZjJNJzYHj4dq59mTdyYfPBCgrHILJZpiXXXuCgq+Em7Mb0Nt0IW9i3rsZYuYg1Iio8k
	b9EGFg8Lfr/CH0Zsc8pe8mQbhQfqOnqje3azAr/rG42CKUnkjptjIgwHZXgbfl96r8sa4uY7Kte
	rFwu60NJW0kvgUegaJE+VYeGFw==
X-Received: by 2002:a05:600c:4e87:b0:4bb:534b:ada4 with SMTP id 5b1f17b1804b1-4bb8881e95dmr382781655e9.33.1795629400275;
        Wed, 25 Nov 2026 09:56:40 -0800 (PST)
From: Luca Di Maio <luca@edera.dev>
To: xen-devel@lists.xenproject.org
Cc: Luca Di Maio <luca@edera.dev>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 4/5] xen/arm64: use LSE in the bitops
Date: Wed, 25 Nov 2026 18:55:51 +0100
Message-ID: <20261125175555.2110163-5-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125175555.2110163-1-luca@edera.dev>
References: <20261125175555.2110163-1-luca@edera.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1795629400-6E6CE4E9-1BB91BB8/0/0
X-purgate-type: clean
X-purgate-size: 5755
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As for the atomic_t operations, use ST{SET,CLR,EOR} and
LD{SET,CLR,EOR}AL when the CPU has LSE, with the same barriers; the
macros take the LSE operation as a new argument. The _timeout variants
now succeed on their first try.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Luca Di Maio <luca@edera.dev>
---
 xen/arch/arm/arm64/lib/bitops.c | 47 +++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/arm64/lib/bitops.c b/xen/arch/arm/arm64/lib/bitops.c
index 275a780329..0153e4f68b 100644
--- a/xen/arch/arm/arm64/lib/bitops.c
+++ b/xen/arch/arm/arm64/lib/bitops.c
@@ -15,6 +15,7 @@
  */
 
 #include <xen/bitops.h>
+#include <asm/arm64/lse.h>
 #include <asm/system.h>
 
 /*
@@ -28,7 +29,7 @@
  * XXX: Rework the interface to use unsigned int.
  */
 
-#define bitop(name, instr)                                                  \
+#define bitop(name, instr, lse_op)                                          \
 static always_inline bool int_##name(int nr, volatile void *p, bool timeout,\
                                      unsigned int max_try)                  \
 {                                                                           \
@@ -37,6 +38,15 @@ static always_inline bool int_##name(int nr, volatile void *p, bool timeout,\
     const uint32_t mask = BITOP_MASK((unsigned int)nr);                     \
     unsigned long res, tmp;                                                 \
                                                                             \
+    if ( system_uses_lse_atomics() )                                        \
+    {                                                                       \
+        asm volatile ( __LSE_PREAMBLE                                       \
+                       "   st" #lse_op "   %w1, %0\n"                       \
+                       : "+Q" (*ptr)                                        \
+                       : "r" (mask) );                                      \
+        return true;                                                        \
+    }                                                                       \
+                                                                            \
     do                                                                      \
     {                                                                       \
         asm volatile ("// " __stringify(name) "\n"                          \
@@ -64,7 +74,7 @@ bool name##_timeout(int nr, volatile void *p, unsigned int max_try)         \
     return int_##name(nr, p, true, max_try);                                \
 }
 
-#define testop(name, instr)                                                 \
+#define testop(name, instr, lse_op)                                         \
 static always_inline bool int_##name(int nr, volatile void *p, int *oldbit, \
                                      bool timeout, unsigned int max_try)    \
 {                                                                           \
@@ -74,6 +84,18 @@ static always_inline bool int_##name(int nr, volatile void *p, int *oldbit, \
     const uint32_t mask = BITOP_MASK(bit);                                  \
     unsigned long res, tmp;                                                 \
                                                                             \
+    if ( system_uses_lse_atomics() )                                        \
+    {                                                                       \
+        asm volatile ( __LSE_PREAMBLE                                       \
+                       "   ld" #lse_op "al %w2, %w0, %1\n"                  \
+                       : "=&r" (tmp), "+Q" (*ptr)                           \
+                       : "r" (mask)                                         \
+                       : "memory" );                                        \
+        dmb(ish);                                                           \
+        *oldbit = (tmp >> bit) & 1;                                         \
+        return true;                                                        \
+    }                                                                       \
+                                                                            \
     do                                                                      \
     {                                                                       \
         asm volatile ("// " __stringify(name) "\n"                          \
@@ -112,19 +134,28 @@ bool name##_timeout(int nr, volatile void *p,                               \
     return int_##name(nr, p, oldbit, true, max_try);                        \
 }
 
-bitop(change_bit, eor)
-bitop(clear_bit, bic)
-bitop(set_bit, orr)
+bitop(change_bit, eor, eor)
+bitop(clear_bit, bic, clr)
+bitop(set_bit, orr, set)
 
-testop(test_and_change_bit, eor)
-testop(test_and_clear_bit, bic)
-testop(test_and_set_bit, orr)
+testop(test_and_change_bit, eor, eor)
+testop(test_and_clear_bit, bic, clr)
+testop(test_and_set_bit, orr, set)
 
 static always_inline bool int_clear_mask16(uint16_t mask, volatile uint16_t *p,
                                            bool timeout, unsigned int max_try)
 {
     unsigned long res, tmp;
 
+    if ( system_uses_lse_atomics() )
+    {
+        asm volatile ( __LSE_PREAMBLE
+                       "   stclrh  %w1, %0\n"
+                       : "+Q" (*p)
+                       : "r" (mask) );
+        return true;
+    }
+
     do
     {
         asm volatile ("//  int_clear_mask16\n"
-- 
2.47.3


