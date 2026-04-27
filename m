Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABAFFF8860
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2026 16:11:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1295065.1571761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHOYW-0004VC-0j; Mon, 27 Apr 2026 16:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295065.1571761; Mon, 27 Apr 2026 16:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHOYV-0004UP-T0; Mon, 27 Apr 2026 16:11:31 +0000
Received: by outflank-mailman (input) for mailman id 1295065;
 Mon, 27 Apr 2026 16:11:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wHOYU-0004Ro-QP
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 16:11:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHOYT-002114-PU
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 18:11:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 69ef8ab0-e002-0a2a0a5209dd-0a2a450688dc-4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 18:11:29 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 69ef8ab0-7371-0a2a45060019-d561b338d974-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 18:11:28 +0200
Received: from 186-249-145-131.shared.desktop.com.br ([186.249.145.131]
 helo=[192.168.1.66]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wHOYA-00305I-Nh; Mon, 27 Apr 2026 18:11:10 +0200
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
	bh=n3ajKxuTrRUfsiVj5FBK8xcgDaSM+ZE9NLMVQk1nTrI=; b=QxsK4/f792XfNJZnw4R/py56Gm
	O+k4W/mihmFFVTUUZMfQ0nUdEg1WrfuqVZJxD3rPNqi2E+ytoTDyLexvIR3OCaQ/+pmWsRuUxFr4T
	aNisP+xzF1BD6JdDL1oaYcc+61KIfukuaFd0wFL+ZQnbvU0l5ugtrNZa/vAiOm1d6mVfMzqpTW9t0
	dbS1QpK4yuAJPUmhTrvHjpw4cV+9EBagVyLamVRWDWm4F/CzeGTpRN+hRtmtP3P9HtOvJuDOJSzwy
	XhFHlnU3CLZ91x/hLBoIYlN5b9n1z1U5lML0P7HUP4GuJZCIhoyhSma7jlgvvI9FjN0pCsM8yA3rF
	Lk1TaFVw==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Mon, 27 Apr 2026 13:10:57 -0300
Subject: [PATCH v2 1/3] x86/asm, x86/boot: Expose inline memcmp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-pvh-kasan-inline-v2-1-2c57b8dcff6a@igalia.com>
References: <20260427-pvh-kasan-inline-v2-0-2c57b8dcff6a@igalia.com>
In-Reply-To: <20260427-pvh-kasan-inline-v2-0-2c57b8dcff6a@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-16d1c6/1777306289-91587D75-83C6BB67/0/0
X-purgate-type: clean
X-purgate-size: 2327

Move the inline memcmp function, currently only available to boot code
(boot/string.c), into the header with similar inline string functions
(include/asm/string.h) so it may be reused.

Add a _SETUP guard in string.h so not to include the 32/64-bit specific
string headers in boot/ code (16-bit, real mode) and avoid build errors.

Note: this memcmp() only returns 0/1, not -1/0/1 as regular memcmp(),
as reported by David Laight. This should be addressed separately.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 arch/x86/boot/string.c        |  6 ++----
 arch/x86/include/asm/string.h | 12 ++++++++++++
 2 files changed, 14 insertions(+), 4 deletions(-)

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
index 9cb5aae7fba9ffcf0f5af8f939d30467750ccaa9..ae6c1f4fda858bd8370647557529d98c23305a53 100644
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
@@ -29,4 +31,14 @@ static __always_inline void *__inline_memset(void *s, int v, size_t n)
 	return ret;
 }
 
+/* Note: this memcmp() only returns 0/1, not -1/0/1 as regular memcmp(). */
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


