Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF76C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 23:14:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1351036.1608375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf486-0002f3-ER; Wed, 01 Jul 2026 23:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351036.1608375; Wed, 01 Jul 2026 23:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf486-0002ew-Bm; Wed, 01 Jul 2026 23:14:06 +0000
Received: by outflank-mailman (input) for mailman id 1351036;
 Wed, 01 Jul 2026 23:14:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wf483-0002PW-Ek
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 23:14:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf482-00ASh6-79
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 01:14:02 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a459ef1-e002-0a2a0a5209dd-0a2a450cd8fc-44
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 01:14:01 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a459f38-f399-0a2a450c0019-d561b3388c7a-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 01:14:00 +0200
Received: from 186-249-148-121.shared.desktop.com.br ([186.249.148.121]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wf47z-007mwb-7e; Thu, 02 Jul 2026 01:13:59 +0200
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
	bh=3Q8RixWFQd74HMuP5HaGOdYS+13SFKaeVy8ocqIumpg=; b=noPoX/XetgpOegc7HwgSefBTmJ
	KZDckcpZmFWNHlYHhVu5Xvnno3tKh4KgXwaHzQz+8rRdFUEXbaXEaNl79EufzCb/H8FIOPLShy6Ko
	5ovjkLAdPHWkkNTKgy9aGBTj95EWKkXF9z5XesfcwxtKvShvjMogxAHmKNgHRPSvEi1K3dRhqXZFc
	4ePE/HzL5Lrv9KcQP/01M4LZ/2w8TzYQVJ0Vgu7Ici7G6UE+JHrjC7vLHr/e/RdNllf2edC92wKER
	ownvwb2tgOvy/l2i9rEKEJEsTz1emPXlZTc/dp3bnvDazi5rEliXY5h6g1vJBCWAB/qMG2paFajNy
	AI19vuiA==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Wed, 01 Jul 2026 20:13:50 -0300
Subject: [PATCH v6 1/4] x86/asm, x86/boot: expose inline memcmp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-pvh-kasan-inline-v6-1-ba99045dfa9f@igalia.com>
References: <20260701-pvh-kasan-inline-v6-0-ba99045dfa9f@igalia.com>
In-Reply-To: <20260701-pvh-kasan-inline-v6-0-ba99045dfa9f@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-d25034/1782947641-0D128D51-30478BAA/0/0
X-purgate-type: clean
X-purgate-size: 2683

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
 arch/x86/include/asm/string.h        |  2 ++
 3 files changed, 24 insertions(+), 4 deletions(-)

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
diff --git a/arch/x86/include/asm/string.h b/arch/x86/include/asm/string.h
index 9cb5aae7fba9ffcf0f5af8f939d30467750ccaa9..8d271a451721d97f78a84009613381414f91f2a6 100644
--- a/arch/x86/include/asm/string.h
+++ b/arch/x86/include/asm/string.h
@@ -8,6 +8,8 @@
 # include <asm/string_64.h>
 #endif
 
+#include <asm/shared/string.h>
+
 static __always_inline void *__inline_memcpy(void *to, const void *from, size_t len)
 {
 	void *ret = to;

-- 
2.47.3


