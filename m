Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53241F94CBC
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2026 06:21:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1291093.1570446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFnRI-00048N-0r; Thu, 23 Apr 2026 06:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291093.1570446; Thu, 23 Apr 2026 06:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFnRH-00048G-Tm; Thu, 23 Apr 2026 06:21:27 +0000
Received: by outflank-mailman (input) for mailman id 1291093;
 Wed, 22 Apr 2026 20:08:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wFdsA-0007sU-TR
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 20:08:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFdsA-001TrF-6p
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 22:08:34 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 69e92aa5-bab6-0a2a0a5309dd-0a2a450ca2b4-20
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 22:08:34 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 69e92ac0-62f1-0a2a450c0019-d561b338b1ee-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 22:08:33 +0200
Received: from 186-249-145-131.shared.desktop.com.br ([186.249.145.131]
 helo=[192.168.1.66]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wFdro-000QN6-2I; Wed, 22 Apr 2026 22:08:11 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CG+f99gT7Cze+FGPfBLcF87S5O/36isH7njf38xR63Q=; b=OKwd6A5xLH1bJcdBLDOnv8XZ2i
	lWl1UWUVu3h86BrLtoFeWCBfpU2bihQEf8FeBcOQ56n6T2kTO/ZzQUVxOh60BnBY8zmH4WsOo9sj2
	pj1egl1mFkGBZBpZjIrH6aFWFOXTkaJNPiNANr8YsKfqigBdRd3T9/vUw8gN8237zaR//pMRs3Aaw
	VocJZgfgNK8hun7DHMiw8Y1CSA9E1pK4stZ9xNZkDaLwX+fuBeO+TdkzZwpK5qP8ojYf4hbMqpRir
	CmX0EGP6b5coLgijMwibBWxbpOAG/HMpmCvfk0rdAWbiuJqQjaebumMcZrYfQB7G1OFqOqKt1X4HB
	i0BgXmbA==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Wed, 22 Apr 2026 17:07:45 -0300
Subject: [PATCH 1/3] x86/asm, x86/boot: Expose inline memcmp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-pvh-kasan-inline-v1-1-7e6194344c92@igalia.com>
References: <20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com>
In-Reply-To: <20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-d25034/1776888514-6E776CF5-316B6DE4/0/0
X-purgate-type: clean
X-purgate-size: 2108

Move the inline memcmp function, currently only available to boot code
(boot/string.c), into the header with similar inline string functions
(include/asm/string.h) so it may be reused.

Add a _SETUP guard in string.h so not to include the 32/64-bit specific
string headers in boot/ code (16-bit, real mode) and avoid build errors.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 arch/x86/boot/string.c        |  6 ++----
 arch/x86/include/asm/string.h | 11 +++++++++++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index b25c6a9303b7314d5caf5c9306239811705294fe..bbee78637b349e42e9281d8df50d89d48f4490b9 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/limits.h>
 #include <asm/asm.h>
+#include <asm/string.h>
 #include "ctype.h"
 #include "string.h"
 
@@ -31,10 +32,7 @@
 
 int memcmp(const void *s1, const void *s2, size_t len)
 {
-	bool diff;
-	asm("repe cmpsb"
-	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
-	return diff;
+	return __inline_memcmp(s1, s2, len);
 }
 
 /*
diff --git a/arch/x86/include/asm/string.h b/arch/x86/include/asm/string.h
index 9cb5aae7fba9ffcf0f5af8f939d30467750ccaa9..736a6f6a31f0a68281b4f17415aba0fcd95dc228 100644
--- a/arch/x86/include/asm/string.h
+++ b/arch/x86/include/asm/string.h
@@ -2,11 +2,13 @@
 #ifndef _ASM_X86_STRING_H
 #define _ASM_X86_STRING_H
 
+#ifndef _SETUP
 #ifdef CONFIG_X86_32
 # include <asm/string_32.h>
 #else
 # include <asm/string_64.h>
 #endif
+#endif
 
 static __always_inline void *__inline_memcpy(void *to, const void *from, size_t len)
 {
@@ -29,4 +31,13 @@ static __always_inline void *__inline_memset(void *s, int v, size_t n)
 	return ret;
 }
 
+static __always_inline int __inline_memcmp(const void *s1, const void *s2, size_t len)
+{
+	bool diff;
+
+	asm("repe cmpsb"
+	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
+	return diff;
+}
+
 #endif /* _ASM_X86_STRING_H */

-- 
2.51.0


