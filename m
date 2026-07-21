Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE1CC44532
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 15:57:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367908.1617586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmCqA-0004BA-PE; Tue, 21 Jul 2026 15:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367908.1617586; Tue, 21 Jul 2026 15:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmCqA-0004B2-MF; Tue, 21 Jul 2026 15:57:06 +0000
Received: by outflank-mailman (input) for mailman id 1367908;
 Tue, 21 Jul 2026 15:57:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wmCqA-00047F-BQ
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 15:57:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmCq9-00A8Sg-NB
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 17:57:05 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a5f96ce-5cb7-0a2a0a5109dd-0a2a4508a69c-6
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:57:05 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a5f96d0-f659-0a2a45080019-d561b338cf6a-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:57:05 +0200
Received: from 186-249-149-197.shared.desktop.com.br ([186.249.149.197]
 helo=[127.0.1.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wmCq1-001fqi-Km; Tue, 21 Jul 2026 17:56:57 +0200
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
	bh=6ydr4gjm8knb3/GExgHyDpALgw8COsdA2yPnrgwuQDA=; b=SsVENWohVjwIJtHkP79GoUi3hF
	+s/IaQPs1ixDPA84dNDdk3hqoealnVkF9L+JuQ3VilOhMV9uL1FD2XCjblhCOpxtBYbPTl/0NiBm7
	jQgAE8MHz5Il/Z5zV01CgHGkdMnzWZZo9dFbUoWfHOaSDsfr1dVfSSx/qU0GJp+vl+UGICUYcwonC
	w8ae0iNXNB3xiCvHssfIoZARP98r8fRiz/61TJqoJRnG1KnLUQQB87yhDUoyDJW9EbKbQUbOhE55v
	w5YUN/lFGE7ay7QUoOWiZvrrmFPXvKYADlNjZ75dnFKwyA7u0HXxYi4XifbOyE/BS4JUIuOY/4ABf
	3Zzayl8A==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Tue, 21 Jul 2026 12:56:44 -0300
Subject: [PATCH v7 3/5] x86/asm: group inline string functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-pvh-kasan-inline-v7-3-38979a50cef0@igalia.com>
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
X-purgate-ID: tlsNG-c1860d/1784649425-D6B4187B-CF0F6831/0/0
X-purgate-type: clean
X-purgate-size: 2425

Group the __inline string functions in the same header.

Use <asm/shared/string.h> since __inline_memcmp() must remain there for use
by arch/x86/boot/string.c.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 arch/x86/include/asm/shared/string.h | 26 ++++++++++++++++++++++++++
 arch/x86/include/asm/string.h        | 21 +--------------------
 2 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
index 166274e44f3cb49e3dccab3cdac281d67aef5d44..9714fbda8b734e20686bfb88a6ca857bfee59e1a 100644
--- a/arch/x86/include/asm/shared/string.h
+++ b/arch/x86/include/asm/shared/string.h
@@ -2,6 +2,32 @@
 #ifndef _ASM_X86_SHARED_STRING_H
 #define _ASM_X86_SHARED_STRING_H
 
+/*
+ * The __inline string functions are grouped in this file for consistency and
+ * for use by arch/x86/boot code due to limitations on including asm/string.h.
+ */
+
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


