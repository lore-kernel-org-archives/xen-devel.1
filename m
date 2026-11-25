Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A01606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 17:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=WTp8ELaO
Received: from list by lists.xenproject.org with outflank-mailman.1502669.1698658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWHET-0007At-LD; Wed, 25 Nov 2026 17:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502669.1698658; Wed, 25 Nov 2026 17:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWHET-0007Al-Fa; Wed, 25 Nov 2026 17:56:37 +0000
Received: by outflank-mailman (input) for mailman id 1502669;
 Wed, 25 Nov 2026 17:56:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xWHET-0007AN-44
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 17:56:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWHES-00CXYo-Gg
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 18:56:36 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6b072142-e002-0a2a0a5209dd-0a2a450cb242-14
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 18:56:36 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6b072154-f479-0a2a450c0019-d155dd31b504-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 18:56:36 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-49465892f7bso4432757f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:56:36 -0800 (PST)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6baa3c4dsm29953505f8f.46.2026.11.25.09.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 09:56:35 -0800 (PST)
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
        d=edera.dev; s=google; t=1795629396; x=1796234196; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQmam26Z0NxPqNcPquNGmkiZ0H6EmzLUijMNDdY8/Gw=;
        b=WTp8ELaO2hcLLvgoLrDzKm+5xRuUkRE6qJGYVRSGQSdtA2NuSW4ZyfgG+zucRX1Qne
         YIaE1EaiKw0ddHBNH3FUOMl4CuYUiZaqxf/DL7mRvxnCKRQ10+vUD1eAr0iWrDdVOrCl
         VY/Yxy3phYNQ/v0KUk4mcQvD+nlL2lqps5pBNXsJv5HpiiSIRjYnx+30FW4EWjv14Tfq
         zbr+z9pV+VQT+zAftTcH5I2ylRoQHO2hGf2P8+myQoxelu+s8+cA2Ckjj2Av/7wGAnDu
         wOIBdLDbKieLrJaOv5v/GC+8z3o7i7lKltHDZmK8JqGtM/wHrDUwSUUJpTbpur7eAbQO
         23Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629396; x=1796234196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PQmam26Z0NxPqNcPquNGmkiZ0H6EmzLUijMNDdY8/Gw=;
        b=r7YPv+xZ/sodT9I2RUjh4rP1gFc1jpRRvaY4KYh6wIk/EtNmj/UN4cilLuhYRRCLkU
         5BDj1/+7aZTU43hCiqVXwVPk0Xd6WVi6l5ZHJioP9IEAQMoJdQz/yjRKCPPb3z047eoI
         8OvWJGNn5HKMA+dWOkoRPHdPniwYwo9aA8iDAG8WkUq5OqdjR8bF7KhYbtlp6yFADW/J
         5RlSitEzYOC4Nlv90Lo4FvDWzFoFAtyuAAdnwONaH1o9qF69MzsrcBSpaPtOdoQXbkbd
         B0ei1yVlRBUyb9jERfSjJAgYG4cUjyJVx5IvyFmYSLBUHSDHrDypMIt4u9NEev4Cx1Jl
         CGsQ==
X-Gm-Message-State: APuU4Z/cVHdOPKoNgfVrQjafDlgozU6OPcYB8j4U6XAQymLyHfF0bDs0
	/lHQ38Px+ilXE07ar6Iq7aUta6i0zEWUQDMPxzNKxo4oLkyW4n3Hz3L5TaFoZluZ5m799f8qpx4
	MSKUx7+s=
X-Gm-Gg: AZFdTZcrRiTfieHxbxusntFXRNgvTZv8kQsR6+oWl7zbILSTyn7JJH2NlEQVPN81zQG
	9r/0knPshJlhRqL7971GPnmFQujZlSYMVSWcU/tsnLZVTmPvsHa/e9Xc/bqwaiz+V2kJsxQB9nB
	tGrbfT6EkxxiW5Kyae5oksFt3mEm8QBNsIbR6vnK1NAnUDfnZFcU9bPJXneU2TuEZYyIEgj+HO+
	I6DYbhskKoGP8Xw2jV5jEBoL+xVvlHrApP6unHZyyz2Vha/x43QHrqZn5vn707GT7dSlVcCcHan
	cN1MhSXmn1NK1J81jS1wDvdokgIe7/IC5/gDvIv1GgixCM/RdUfkoWZTtgKE0+27a0rtv7ld8VP
	ix4ETY7FidU4CagZFEzswDmufaXawB1LGbl5b+l7lvQmOHECq6tN834UrxlFkl/sVCNI6ru5RUO
	3lEDbmnEbcuAiKanqWQpWnXIq//6mb/60fjY2HtuY3SLuWv+Adssv/qT6lbR4AAyy6humaWluMk
	YR3YWcIoHC93foc9GMWtYKoEgxWD+jLARrOrsLGItr9KZYGd7AW2u1p+7EkBBecXakj54SSD5Fk
	zuCozAWaWR+B7177yMW5397DYw==
X-Received: by 2002:a05:6000:2893:b0:493:f3f2:2241 with SMTP id ffacd0b85a97d-4abb272746fmr36740510f8f.23.1795629395632;
        Wed, 25 Nov 2026 09:56:35 -0800 (PST)
From: Luca Di Maio <luca@edera.dev>
To: xen-devel@lists.xenproject.org
Cc: Luca Di Maio <luca@edera.dev>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/5] xen/arm64: use LSE in the atomic_t operations
Date: Wed, 25 Nov 2026 18:55:49 +0100
Message-ID: <20261125175555.2110163-3-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125175555.2110163-1-luca@edera.dev>
References: <20261125175555.2110163-1-luca@edera.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1795629396-034D7A5B-F65B4915/0/0
X-purgate-type: clean
X-purgate-size: 3267
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On a two-socket Graviton4 every pCPU of a socket spun in the exclusive
loop of atomic_add_return() on dom0's p2m rwlock, and dom0 hung at boot.
Use the LSE instruction for each operation when the CPU has it, with the
same barriers; CPUs without LSE keep the exclusive loops.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Luca Di Maio <luca@edera.dev>
---
 xen/arch/arm/include/asm/arm64/atomic.h | 55 +++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/atomic.h b/xen/arch/arm/include/asm/arm64/atomic.h
index 4460165295..a113401db6 100644
--- a/xen/arch/arm/include/asm/arm64/atomic.h
+++ b/xen/arch/arm/include/asm/arm64/atomic.h
@@ -22,6 +22,8 @@
 #ifndef __ARCH_ARM_ARM64_ATOMIC
 #define __ARCH_ARM_ARM64_ATOMIC
 
+#include <asm/arm64/lse.h>
+
 /*
  * AArch64 UP and SMP safe atomic ops.  We use load exclusive and
  * store exclusive to ensure that these are atomic.  We may loop
@@ -32,6 +34,14 @@ static inline void atomic_add(int i, atomic_t *v)
 	unsigned long tmp;
 	int result;
 
+	if (system_uses_lse_atomics()) {
+		asm volatile(__LSE_PREAMBLE
+"	stadd	%w1, %0"
+		: "+Q" (v->counter)
+		: "r" (i));
+		return;
+	}
+
 	asm volatile("// atomic_add\n"
 "1:	ldxr	%w0, %2\n"
 "	add	%w0, %w0, %w3\n"
@@ -46,6 +56,16 @@ static inline int atomic_add_return(int i, atomic_t *v)
 	unsigned long tmp;
 	int result;
 
+	if (system_uses_lse_atomics()) {
+		asm volatile(__LSE_PREAMBLE
+"	ldaddal	%w2, %w0, %1"
+		: "=&r" (result), "+Q" (v->counter)
+		: "r" (i)
+		: "memory");
+		smp_mb();
+		return (int)((unsigned int)result + i);
+	}
+
 	asm volatile("// atomic_add_return\n"
 "1:	ldxr	%w0, %2\n"
 "	add	%w0, %w0, %w3\n"
@@ -64,6 +84,14 @@ static inline void atomic_sub(int i, atomic_t *v)
 	unsigned long tmp;
 	int result;
 
+	if (system_uses_lse_atomics()) {
+		asm volatile(__LSE_PREAMBLE
+"	stadd	%w1, %0"
+		: "+Q" (v->counter)
+		: "r" (-(unsigned int)i));
+		return;
+	}
+
 	asm volatile("// atomic_sub\n"
 "1:	ldxr	%w0, %2\n"
 "	sub	%w0, %w0, %w3\n"
@@ -78,6 +106,16 @@ static inline int atomic_sub_return(int i, atomic_t *v)
 	unsigned long tmp;
 	int result;
 
+	if (system_uses_lse_atomics()) {
+		asm volatile(__LSE_PREAMBLE
+"	ldaddal	%w2, %w0, %1"
+		: "=&r" (result), "+Q" (v->counter)
+		: "r" (-(unsigned int)i)
+		: "memory");
+		smp_mb();
+		return (int)((unsigned int)result - i);
+	}
+
 	asm volatile("// atomic_sub_return\n"
 "1:	ldxr	%w0, %2\n"
 "	sub	%w0, %w0, %w3\n"
@@ -96,6 +134,14 @@ static inline void atomic_and(int m, atomic_t *v)
 	unsigned long tmp;
 	int result;
 
+	if (system_uses_lse_atomics()) {
+		asm volatile(__LSE_PREAMBLE
+"	stclr	%w1, %0"
+		: "+Q" (v->counter)
+		: "r" (~m));
+		return;
+	}
+
 	asm volatile("// atomic_and\n"
 "1:	ldxr	%w0, %2\n"
 "	and	%w0, %w0, %w3\n"
@@ -112,6 +158,15 @@ static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
 
 	smp_mb();
 
+	if (system_uses_lse_atomics()) {
+		asm volatile(__LSE_PREAMBLE
+"	cas	%w0, %w2, %1"
+		: "+r" (old), "+Q" (v->counter)
+		: "r" (new));
+		smp_mb();
+		return old;
+	}
+
 	asm volatile("// atomic_cmpxchg\n"
 "1:	ldxr	%w1, %2\n"
 "	cmp	%w1, %w3\n"
-- 
2.47.3


