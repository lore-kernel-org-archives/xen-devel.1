Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08A5C5DF8C
	for <xen-devel@archiver.kernel.org>; Sat, 22 Aug 2026 18:33:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398248.1634699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxqWr-0006Ow-6l; Sat, 22 Aug 2026 18:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398248.1634699; Sat, 22 Aug 2026 18:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxqWr-0006Ol-3L; Sat, 22 Aug 2026 18:33:17 +0000
Received: by outflank-mailman (input) for mailman id 1398248;
 Sat, 22 Aug 2026 18:33:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wxqWp-0006O9-OM
 for xen-devel@lists.xenproject.org; Sat, 22 Aug 2026 18:33:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wxqWp-006G9Z-5I
 for xen-devel@lists.xenproject.org; Sat, 22 Aug 2026 20:33:15 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a89eb5f-bab6-0a2a0a5309dd-0a2a450ce090-8
 for <xen-devel@lists.xenproject.org>; Sat, 22 Aug 2026 20:33:15 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a89eb6a-f479-0a2a450c0019-d561b338cafe-3
 for <xen-devel@lists.xenproject.org>; Sat, 22 Aug 2026 20:33:15 +0200
Received: from 186-249-148-4.shared.desktop.com.br ([186.249.148.4]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wxqWg-007bWT-2k; Sat, 22 Aug 2026 20:33:06 +0200
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
	bh=KORz1Q6LN2S1qss23Rp2FxzHVmjdGy5eAsOyJ8LP8DE=; b=eWq9lcDUFjq4cazwokKPFifDbT
	10Qazbh7iMb0SIeZZDywA9Z1h60qVk/3mVGCzACps0digm7EUwGtjA0aHvzQiPXETbzZCCmtr0xYL
	r1MAPHj4L+UIQ7YEBxTQjww8uFjqaLZoqRi/vYBTHnRqM8oyCHsBHCWOwAUzN3EX/NyQzjAmvHfBL
	kmS8lgeXag4ewv8uLXYmd7f3QB6k484nBy9bGeXRZg6Efy8PRY8i8KdeSIvf51Pqyh21DvzHm+QUb
	xEqNRsvJdmM5BL+xvw8bHVhDN2VpedmJ25G1C2ejk94gFIW1iJpacz1YLYRXUtt9i+3A099GIk+eC
	a0Dhcd3A==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Sat, 22 Aug 2026 15:33:19 -0300
Subject: [PATCH v9 3/5] x86/asm: group inline string functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-pvh-kasan-inline-v9-3-e70ef3b75b6a@igalia.com>
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
X-purgate-ID: tlsNG-d25034/1787423595-012C8A5B-00D7687C/0/0
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
index 06c1d5e5013e4d59cfb49866d10e164362d2c4cc..ab033d27c581e44ba3f5a494ca29e31776be51f2 100644
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


