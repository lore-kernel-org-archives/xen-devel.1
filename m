Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA76C44532
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 15:57:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367905.1617558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmCq8-0003YO-0t; Tue, 21 Jul 2026 15:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367905.1617558; Tue, 21 Jul 2026 15:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmCq7-0003YH-U0; Tue, 21 Jul 2026 15:57:03 +0000
Received: by outflank-mailman (input) for mailman id 1367905;
 Tue, 21 Jul 2026 15:57:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wmCq6-0003Y4-7h
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 15:57:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmCq5-00542f-9u
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 17:57:01 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a5f96c5-e002-0a2a0a5209dd-0a2a4503c112-6
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:57:00 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a5f96cb-fae8-0a2a45030019-d561b338a856-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:57:00 +0200
Received: from 186-249-149-197.shared.desktop.com.br ([186.249.149.197]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wmCpt-001fqi-Eb; Tue, 21 Jul 2026 17:56:49 +0200
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
	bh=Uipb51QFeEvi5TG6B4ZY+2g5b0lo7cvCdn79s0YKKcE=; b=hGk+yJ88jGjqL7iOLL1yEV/47c
	HP8E2r3TKSIVWPEtx/UpbVazkMudv3S1AqfGBfQ5FpwKcX7TdtVodfJV8fESYAsG3S6qGTfP5arV8
	hhbfhE4Jgab6WOru3Q2bd0RKHFvYf7DoWPJZXVHDbeTEoSpBY/nZy3XHYtdPGuif0SetsmW8XdnCM
	PXA8IkSEtKcouxoOjI5Ba7iALVBJuDRPIf1wDSF8gyNSkGx5RUkywpY7p1uB22OCq+LTPe252oniN
	olsqR2fqsgPtmekvmu3dOW57RqCs1s421QtgCdRETkkYIxzg8b3Z3LazmDyn53TK5S/oY+btreQgK
	poR6RwOA==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Tue, 21 Jul 2026 12:56:42 -0300
Subject: [PATCH v7 1/5] x86/asm, x86/boot: expose inline memcmp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-pvh-kasan-inline-v7-1-38979a50cef0@igalia.com>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
In-Reply-To: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-33051d/1784649420-756834E9-562BC017/0/0
X-purgate-type: clean
X-purgate-size: 2184

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
 arch/x86/boot/string.c               |  6 ++----
 arch/x86/include/asm/shared/string.h | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index ac0f900ebc47efa81c92e1bb2010ea41677899c4..be454a6864225f3a972c3e81826b77ed4e8a57fe 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/limits.h>
 #include <asm/asm.h>
+#include <asm/shared/string.h>
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
diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
new file mode 100644
index 0000000000000000000000000000000000000000..02b92927553f7b8e1c87e6122bbaa70439e57ea7
--- /dev/null
+++ b/arch/x86/include/asm/shared/string.h
@@ -0,0 +1,20 @@
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
+	asm("repe cmpsb"
+	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
+
+	return diff;
+}
+
+#endif /* _ASM_X86_SHARED_STRING_H */

-- 
2.47.3


