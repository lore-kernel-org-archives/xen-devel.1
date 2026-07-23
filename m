Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ABAC531FA
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 23:14:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369673.1618246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn2cJ-0007oy-Me; Thu, 23 Jul 2026 23:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369673.1618246; Thu, 23 Jul 2026 23:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn2cJ-0007or-Jc; Thu, 23 Jul 2026 23:14:15 +0000
Received: by outflank-mailman (input) for mailman id 1369673;
 Thu, 23 Jul 2026 23:14:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wn2cI-0007oF-Sm
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 23:14:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wn2cI-0056f5-9c
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 01:14:14 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a62a043-2eae-0a2a0a5409dd-0a2a4506af92-10
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:14:14 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a62a045-195a-0a2a45060019-d561b338e49c-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:14:13 +0200
Received: from 186-249-149-197.shared.desktop.com.br ([186.249.149.197]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wn2cF-003dsJ-FF; Fri, 24 Jul 2026 01:14:11 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=dAdbZ5UO2RrbRs396cB08KKrdlvaGcoVOWOuItnYYv8=; b=Q/xb8EIrwpYG0LaYCItdOI88rL
	D4MMVT60hHLH0XHUO26e7/osQFpdzWbLaC9oprLcSJy9TTOnI+dEqZ7GJqOpfando4KtpCY0AMlDE
	2wNOfdnuyWSJn9gOd1ZmXLgGK8dJTBy3w2fP/+Nm5U7s3Ir7ij54dxlGoiudzr31LFJIVMfLOeBNC
	VivGQOWI0P8i4U3NyEG9GGdLx0sJ9roNrmb1+KDBIs6kQWQ/sMKT6dI6/v8NBT2eIjrLrWrTWbR/E
	gs6Xsd8t52SxhIMaJyWes0MFqBqz8hz4XzNrH82lNVart4cpNKAxN+Wa8s7NROFwEpqZc2B2R9pif
	sPnAQUdQ==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Thu, 23 Jul 2026 20:13:52 -0300
Subject: [PATCH v8 2/4] x86/asm: group inline string functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-pvh-kasan-inline-v8-2-c1f62c156f52@igalia.com>
References: <20260723-pvh-kasan-inline-v8-0-c1f62c156f52@igalia.com>
In-Reply-To: <20260723-pvh-kasan-inline-v8-0-c1f62c156f52@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-16d1c6/1784848454-F5C0F77B-012B5296/0/0
X-purgate-type: clean
X-purgate-size: 2271

Group the __inline string functions in the same header.

Use <asm/shared/string.h> since __inline_memcmp() must remain there for use
by arch/x86/boot/string.c.

No functional changes.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 arch/x86/include/asm/shared/string.h | 21 +++++++++++++++++++++
 arch/x86/include/asm/string.h        | 21 +--------------------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
index 66a446168fd1e9914b9e00540269f555abe4738d..68b4e5a509d9758271bf203382b62dd0943274c8 100644
--- a/arch/x86/include/asm/shared/string.h
+++ b/arch/x86/include/asm/shared/string.h
@@ -2,6 +2,27 @@
 #ifndef _ASM_X86_SHARED_STRING_H
 #define _ASM_X86_SHARED_STRING_H
 
+static __always_inline void *__inline_memcpy(void *to, const void *from, size_t len)
+{
+	void *ret = to;
+
+	asm volatile("rep movsb"
+		     : "+D" (to), "+S" (from), "+c" (len)
+		     : : "memory");
+	return ret;
+}
+
+static __always_inline void *__inline_memset(void *s, int v, size_t n)
+{
+	void *ret = s;
+
+	asm volatile("rep stosb"
+		     : "+D" (s), "+c" (n)
+		     : "a" ((uint8_t)v)
+		     : "memory");
+	return ret;
+}
+
 /*
  * This inline memcmp() returns 0 (equal) or 1 (not equal).
  * The regular memcmp() returns <0 (less than), 0 (equal), or >0 (greater than)
diff --git a/arch/x86/include/asm/string.h b/arch/x86/include/asm/string.h
index 9cb5aae7fba9ffcf0f5af8f939d30467750ccaa9..dbf59f0d4cca71e2ddce0d8764aeec8782236669 100644
--- a/arch/x86/include/asm/string.h
+++ b/arch/x86/include/asm/string.h
@@ -8,25 +8,6 @@
 # include <asm/string_64.h>
 #endif
 
-static __always_inline void *__inline_memcpy(void *to, const void *from, size_t len)
-{
-	void *ret = to;
-
-	asm volatile("rep movsb"
-		     : "+D" (to), "+S" (from), "+c" (len)
-		     : : "memory");
-	return ret;
-}
-
-static __always_inline void *__inline_memset(void *s, int v, size_t n)
-{
-	void *ret = s;
-
-	asm volatile("rep stosb"
-		     : "+D" (s), "+c" (n)
-		     : "a" ((uint8_t)v)
-		     : "memory");
-	return ret;
-}
+#include <asm/shared/string.h>
 
 #endif /* _ASM_X86_STRING_H */

-- 
2.47.3


