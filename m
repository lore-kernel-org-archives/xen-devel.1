Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F95C531FA
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 23:14:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369668.1618237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn2cE-0007WM-Fl; Thu, 23 Jul 2026 23:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369668.1618237; Thu, 23 Jul 2026 23:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn2cE-0007WF-CU; Thu, 23 Jul 2026 23:14:10 +0000
Received: by outflank-mailman (input) for mailman id 1369668;
 Thu, 23 Jul 2026 23:14:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wn2cC-0007HT-OT
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 23:14:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wn2cC-00A9gi-5N
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 01:14:08 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a629fc2-e002-0a2a0a5209dd-0a2a4502ebd2-38
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:14:08 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a62a03f-6ca4-0a2a45020019-d561b338b144-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:14:08 +0200
Received: from 186-249-149-197.shared.desktop.com.br ([186.249.149.197]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wn2cA-003dsJ-8L; Fri, 24 Jul 2026 01:14:06 +0200
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
	bh=+Q2m+yozez2bdzT3Nq6OWg4kVQdgVnIRf7/C3OSAOVU=; b=lJASM5Ju6yF8L/0l8SfXkn0RQ+
	wNDcr8pEsU7VeTmV6+5Qu5HqMwyJFJi5MMj4O6RfC4gu8FdYieG8ie2ehWHrAspRtcLvQwYvGGHGw
	SrHbVJVyN/bVHCIer3pr/V6UzDihAPWkdU1wBT6NRdTmCpals98/WsC2OYIh1NqbXyOXeh1RbXZF4
	eEY0ZD1cqhk6SK4N5pW2g18ApStw1oUMh13D6h+kH0/sRtGloIhfmCuSE+LOKUOs8uAfI894zizlG
	8Ze0MKxcIheW85wpxeLqU4xxOpGMMiCLNnZarpbUFRyuyFsJ2z8de7DirX93lTRMJi14XXnDZnfuv
	PkDWYvmg==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Thu, 23 Jul 2026 20:13:51 -0300
Subject: [PATCH v8 1/4] x86/asm, x86/boot: expose inline memcmp()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-pvh-kasan-inline-v8-1-c1f62c156f52@igalia.com>
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
X-purgate-ID: tlsNG-720697/1784848448-670B02AC-7673CAE7/0/0
X-purgate-type: clean
X-purgate-size: 2320

Move the inline memcmp function currently only available in 'boot/string.c'
into the shared string function header <asm/shared/string.h> to be reused.

This is not done through <asm/string.h> to avoid pulling unnecessary code
in 'boot/string.c' that causes build errors in 'boot/compressed/string.c'
and 'purgatory/purgatory.ro'.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>

---

Thanks to David Laight for noticing the return value difference between
inline and regular memcmp().
---
 arch/x86/boot/string.c               |  8 ++------
 arch/x86/include/asm/shared/string.h | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index 6827551720dd9b96afe8c55a051401d6cdc6f05e..be454a6864225f3a972c3e81826b77ed4e8a57fe 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/limits.h>
 #include <asm/asm.h>
+#include <asm/shared/string.h>
 #include "ctype.h"
 #include "string.h"
 
@@ -31,12 +32,7 @@
 
 int memcmp(const void *s1, const void *s2, size_t len)
 {
-	bool diff;
-	asm volatile("test %3, %3\n\t"
-		     "repe cmpsb"
-		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
-		     : : "cc", "memory");
-	return diff;
+	return __inline_memcmp(s1, s2, len);
 }
 
 /*
diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
new file mode 100644
index 0000000000000000000000000000000000000000..66a446168fd1e9914b9e00540269f555abe4738d
--- /dev/null
+++ b/arch/x86/include/asm/shared/string.h
@@ -0,0 +1,22 @@
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
+	asm volatile("test %3, %3\n\t"
+		     "repe cmpsb"
+		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
+		     : : "cc", "memory");
+
+	return diff;
+}
+
+#endif /* _ASM_X86_SHARED_STRING_H */

-- 
2.47.3


