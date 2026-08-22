Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A81C5DF97
	for <xen-devel@archiver.kernel.org>; Sat, 22 Aug 2026 18:33:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398247.1634686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxqWn-00061f-VM; Sat, 22 Aug 2026 18:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398247.1634686; Sat, 22 Aug 2026 18:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxqWn-00061W-RP; Sat, 22 Aug 2026 18:33:13 +0000
Received: by outflank-mailman (input) for mailman id 1398247;
 Sat, 22 Aug 2026 18:33:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wxqWm-0005mL-7w
 for xen-devel@lists.xenproject.org; Sat, 22 Aug 2026 18:33:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wxqWl-00A7NX-L6
 for xen-devel@lists.xenproject.org; Sat, 22 Aug 2026 20:33:11 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a89eb36-e002-0a2a0a5209dd-0a2a4505d466-28
 for <xen-devel@lists.xenproject.org>; Sat, 22 Aug 2026 20:33:11 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a89eb66-4cb1-0a2a45050019-d561b33894d8-3
 for <xen-devel@lists.xenproject.org>; Sat, 22 Aug 2026 20:33:11 +0200
Received: from 186-249-148-4.shared.desktop.com.br ([186.249.148.4]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wxqWc-007bWT-5S; Sat, 22 Aug 2026 20:33:02 +0200
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
	bh=MfLC1dIVusQxZmyyohtK3IB4hBpAg/kOqSLp9mxwz1M=; b=o1Z+vuNGqvlMK/ozeR0ZPZbzr1
	gAQJqvr5CTnKAOkG9FSljuSrO7FBTDKKyyxvLqRc0XQYtRff6BhHSr6b2JpR8m8aqc3MYeM8fhc7u
	C5rwoS4DgpDkFS2xMIqzIMu4VHDgWluOs6s236Wx+O6j7O0z0FoMWlIt5GbxY6MwBRs5xNFuKz7ut
	GOU0x8Sho2S8rnKR2SZzqU1YpjnhxkZSMunIiVO9M2TZzt25+FiG0ysrCy8nBQihnZLZD8RUWVwUu
	0iig+O6Dt7z1KJcrkzHM27AKSg+JjS/hcQZek133GV2/n+ZY6sEroD+a4QyRaV8CJZa8AIfcZn9/A
	7oo4Zviw==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Sat, 22 Aug 2026 15:33:18 -0300
Subject: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
In-Reply-To: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-c201ff/1787423591-72AB72A1-1E083120/0/0
X-purgate-type: clean
X-purgate-size: 2617

Move the inline memcmp function currently only available in 'boot/string.c'
into the shared string function header <asm/shared/string.h> to be reused.

This is not done through <asm/string.h> to avoid pulling unnecessary code
in 'boot/string.c' that causes build errors in 'boot/compressed/string.c'
and 'purgatory/purgatory.ro'.

No functional changes.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>

---

Thanks to David Laight for noticing the return value difference between
inline and regular memcmp().
---
 arch/x86/boot/string.c               | 13 ++-----------
 arch/x86/include/asm/shared/string.h | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index 03278b4393887cb71cb063818d3378c4f52b06f8..be454a6864225f3a972c3e81826b77ed4e8a57fe 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/limits.h>
 #include <asm/asm.h>
+#include <asm/shared/string.h>
 #include "ctype.h"
 #include "string.h"
 
@@ -31,17 +32,7 @@
 
 int memcmp(const void *s1, const void *s2, size_t len)
 {
-	bool diff;
-
-	/*
-	 * Make sure ZF is properly set in the len==0 case because in it,
-	 * RCX==0 and the REPE; CMPSB won't get executed.
-	 */
-	asm volatile("test %3, %3\n\t"
-		     "repe cmpsb"
-		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
-		     : : "memory");
-	return diff;
+	return __inline_memcmp(s1, s2, len);
 }
 
 /*
diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
new file mode 100644
index 0000000000000000000000000000000000000000..06c1d5e5013e4d59cfb49866d10e164362d2c4cc
--- /dev/null
+++ b/arch/x86/include/asm/shared/string.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_SHARED_STRING_H
+#define _ASM_X86_SHARED_STRING_H
+
+/*
+ * This inline memcmp() returns 0 (equal) or 1 (not equal).
+ * The regular memcmp() returns <0 (less than), 0 (equal), or >0 (greater than)
+ * to indicate ordering as well.
+ */
+static __always_inline int __inline_memcmp(const void *s1, const void *s2, size_t len)
+{
+	bool diff;
+
+	/*
+	 * Make sure ZF is properly set in the len==0 case because in it,
+	 * RCX==0 and the REPE; CMPSB won't get executed.
+	 */
+	asm volatile("test %3, %3\n\t"
+		     "repe cmpsb"
+		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
+		     : : "memory");
+
+	return diff;
+}
+
+#endif /* _ASM_X86_SHARED_STRING_H */

-- 
2.47.3


