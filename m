Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7AA606A326
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 17:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=eX3S/Zjr
Received: from list by lists.xenproject.org with outflank-mailman.1502670.1698667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWHEW-0007QR-QK; Wed, 25 Nov 2026 17:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502670.1698667; Wed, 25 Nov 2026 17:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWHEW-0007QI-M1; Wed, 25 Nov 2026 17:56:40 +0000
Received: by outflank-mailman (input) for mailman id 1502670;
 Wed, 25 Nov 2026 17:56:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xWHEV-0007PC-Lb
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 17:56:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWHEV-00E17j-2C
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 18:56:39 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6b072154-2eae-0a2a0a5409dd-0a2a4506860c-6
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 18:56:39 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6b072156-195a-0a2a45060019-d155dd32d8dc-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 18:56:38 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-498f5fa5103so3632245f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:56:38 -0800 (PST)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6baa3c4dsm29953505f8f.46.2026.11.25.09.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 09:56:37 -0800 (PST)
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
        d=edera.dev; s=google; t=1795629398; x=1796234198; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJcdIHhdSiNNXiU33fth5GqRv/vVAuLtfjrSSizbOTk=;
        b=eX3S/Zjr6JSdcLQ/aqDOT/SuzGX/CgeJOL+g/U5H7pz72NhCl7qmoC0PDED1ls7sC0
         ZYUCCZQOVTpKKQM5k+y4IOHPIsSxKmdgmvuYVT94rJlapFuLoKtka84w7r304oNf6sZA
         ZE9eVDsvCe9o7RGZkU7GFgsU7DaXs7GjYidgnUuCtlw8yWdBAtqL6tFzBXZUfkQWVv2Z
         xUnAPfl/q28kydKNIztxJ76K7vGXaeBzaTdLvd2ovXBtFbrVOJ5FyodzqYYxnV+LfBbV
         NPmHYF68WSGUlxASMM1GaxxHTYuxTZ+JF56d5ttz2YuiGk3ltmi3+ybLB8JDt0qdAKqv
         UjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629398; x=1796234198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJcdIHhdSiNNXiU33fth5GqRv/vVAuLtfjrSSizbOTk=;
        b=qe1YZw6yQDBM9tHDUKFB4ESL4uy0rpvy+eeJhiqBoMZawBwFZLXJ1QDwKzNam4cfne
         /F0d6/k4d7YbBixtqLiZHeBaV+Q9a/ksCDy/oUgXbTc5FYZHW1qjsK6hUsMkHKvwtyZi
         TlOSjo+OzlfD80BS6xxUR3DHcD+03cifLcEyATan5+M+We+UmB87OUXK1ZXdx6LH/os3
         4HA+Wbb5D4RIJSVyqc2CuqgDu1ejKrzIcJx8Uocw/6yhJd9xhXBX8w28AgA4T4h8WejR
         LD18nPZtxGuhsZlteYH+88ALgVwf4IMgT5X6nu6hA8RpdACs/oHBITZxoxwHRGjNFr3X
         EwXg==
X-Gm-Message-State: APuU4Z8vuuLL1tob1GbbO1fBw0RpnaMi3rxWU4E9DAVrTnpw5ce2I8IH
	O/3y2Jk4LVL29SzQadl3fxaE1ruI6teZnQPRqi3T+bWb3mjHwvVLEyzBwB4fmLAHoIhpu9UyE+r
	RxUALivk=
X-Gm-Gg: AZFdTZenFXV70obCGOIiSE/z4eNJJv0dzKhTJEfUUFZ8rpmr1v7KnNi+ehfEycCBkMz
	XuaNQmp7CGuEKlL25URBGGsJLVXli2YFLy5N+smhpyOAT5wPDqgssOovW3UUOVX7qsfqdsSZlmQ
	Q2phlFOYS9vw5dRkoGC7zkSvXRXPION3PIzbc7phxEqxmphEn+roZvHwsJ2ZFNtC0+f1eFhSyVS
	QVgDa9xRKE3qoAcARGtEpSpEjr+2fahfEQHdF35wkYEiFYbQBqxqIubb89EGJUZ3ZL4j6YjX6hl
	hFfWv6Pt54y9GQhhnsklfCVhCR8EU2LaE1mWEKeMTWs39XoaVjq5303tPJWq8rH1b8BzhMSta+B
	JOF/O8h0eE7XWcxSDjhGjBicuM9D3iAlt147SHCDjyu6ruY7uMiQ0kmQJFj/lmK7Du4s/LEjODN
	L6gDYWIMgjiIlX390U3Vz0RvzGpWi3UKLbqx17a0CWdnrW8L7gPMIHIgROwtyo/GNpv4NxLWmz8
	3WiiZplOlF2gMy/AeTSLZo50Yu5F4zR4KbSM11CSuf3KjOrB1b74iHV/rp0TFQueVq1IUiQhWjX
	6mymRVyL9RyVFq7ZS1cAbmBRiA==
X-Received: by 2002:a05:6000:29c6:b0:4a9:b2f1:aac4 with SMTP id ffacd0b85a97d-4abb42ea141mr24674542f8f.22.1795629397984;
        Wed, 25 Nov 2026 09:56:37 -0800 (PST)
From: Luca Di Maio <luca@edera.dev>
To: xen-devel@lists.xenproject.org
Cc: Luca Di Maio <luca@edera.dev>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/5] xen/arm64: use LSE in xchg() and cmpxchg()
Date: Wed, 25 Nov 2026 18:55:50 +0100
Message-ID: <20261125175555.2110163-4-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125175555.2110163-1-luca@edera.dev>
References: <20261125175555.2110163-1-luca@edera.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1795629398-FE87577B-10A78834/0/0
X-purgate-type: clean
X-purgate-size: 3029
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As for the atomic_t operations, use SWPAL and CAS when the CPU has LSE,
with the same barriers. A CAS cannot fail spuriously, so the _timeout
variants used by guest atomics succeed on their first try.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Luca Di Maio <luca@edera.dev>
---
 xen/arch/arm/include/asm/arm64/cmpxchg.h | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/cmpxchg.h b/xen/arch/arm/include/asm/arm64/cmpxchg.h
index f160e8e7bc..442b6e1698 100644
--- a/xen/arch/arm/include/asm/arm64/cmpxchg.h
+++ b/xen/arch/arm/include/asm/arm64/cmpxchg.h
@@ -2,6 +2,7 @@
 #define __ASM_ARM64_CMPXCHG_H
 
 #include <xen/bug.h>
+#include <asm/arm64/lse.h>
 
 extern void __bad_xchg(volatile void *ptr, int size);
 
@@ -11,6 +12,14 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
 
 	switch (size) {
 	case 1:
+		if (system_uses_lse_atomics()) {
+			asm volatile(__LSE_PREAMBLE
+			"	swpalb	%w2, %w0, %1"
+				: "=&r" (ret), "+Q" (*(volatile u8 *)ptr)
+				: "r" (x)
+				: "memory");
+			break;
+		}
 		asm volatile("//	__xchg1\n"
 		"1:	ldxrb	%w0, %2\n"
 		"	stlxrb	%w1, %w3, %2\n"
@@ -20,6 +29,14 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
 			: "memory");
 		break;
 	case 2:
+		if (system_uses_lse_atomics()) {
+			asm volatile(__LSE_PREAMBLE
+			"	swpalh	%w2, %w0, %1"
+				: "=&r" (ret), "+Q" (*(volatile u16 *)ptr)
+				: "r" (x)
+				: "memory");
+			break;
+		}
 		asm volatile("//	__xchg2\n"
 		"1:	ldxrh	%w0, %2\n"
 		"	stlxrh	%w1, %w3, %2\n"
@@ -29,6 +46,14 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
 			: "memory");
 		break;
 	case 4:
+		if (system_uses_lse_atomics()) {
+			asm volatile(__LSE_PREAMBLE
+			"	swpal	%w2, %w0, %1"
+				: "=&r" (ret), "+Q" (*(volatile u32 *)ptr)
+				: "r" (x)
+				: "memory");
+			break;
+		}
 		asm volatile("//	__xchg4\n"
 		"1:	ldxr	%w0, %2\n"
 		"	stlxr	%w1, %w3, %2\n"
@@ -38,6 +63,14 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
 			: "memory");
 		break;
 	case 8:
+		if (system_uses_lse_atomics()) {
+			asm volatile(__LSE_PREAMBLE
+			"	swpal	%2, %0, %1"
+				: "=&r" (ret), "+Q" (*(volatile u64 *)ptr)
+				: "r" (x)
+				: "memory");
+			break;
+		}
 		asm volatile("//	__xchg8\n"
 		"1:	ldxr	%0, %2\n"
 		"	stlxr	%w1, %3, %2\n"
@@ -75,6 +108,14 @@ static inline bool __cmpxchg_case_##name(volatile void *ptr,		\
 	unsigned long oldval;						\
 	unsigned long res;						\
 									\
+	if (system_uses_lse_atomics()) {				\
+		asm volatile(__LSE_PREAMBLE				\
+		"	cas" #sz "	%" #w "0, %" #w "2, %1"		\
+		: "+r" (*old), "+Q" (*(volatile unsigned long *)ptr)	\
+		: "r" (new));						\
+		return true;						\
+	}								\
+									\
 	do {								\
 		asm volatile("// __cmpxchg_case_" #name "\n"		\
 		"	ldxr" #sz "	%" #w "1, %2\n"			\
-- 
2.47.3


