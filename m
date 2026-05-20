Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D34CD4F3D
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2026 21:13:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1314394.1584349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPoDl-00045F-Ps; Wed, 20 May 2026 21:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314394.1584349; Wed, 20 May 2026 21:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPoDl-000458-N3; Wed, 20 May 2026 21:12:53 +0000
Received: by outflank-mailman (input) for mailman id 1314394;
 Wed, 20 May 2026 21:12:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wPoDk-00044Z-4c
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 21:12:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPoDj-00EDfE-H6
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 23:12:51 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a0e23cc-e002-0a2a0a5209dd-0a2a4502d6f0-10
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 23:12:51 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 6a0e23d2-af86-0a2a45020019-d561b338a816-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 23:12:51 +0200
Received: from 186-249-145-161.shared.desktop.com.br ([186.249.145.161]
 helo=[192.168.1.68]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wPoDS-0041Tq-O9; Wed, 20 May 2026 23:12:35 +0200
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
	bh=QWDJ2OzZaJom0a60jnwGYvvAozNLoOMpVxRWdTCYrLY=; b=k0wISdlG2PRGKql4/MXlPi0po4
	EfelhhvuoBBZAUZY1KGzV8lbvG53iTgc3x9kKP66naKIZNo7xHGstbidJ6sMr0YL4w3vMBC/hnTwv
	0GdgVAjRGCRlGhMoW+ofgtEzcU6REh6OX0BSJVUP00+BD7qD5i1Us2ijJlI3NbLqyG3FyoZ2zCXps
	N2ETl/O8vHJyASsxVO2zCNbjpA/m9aYC+q1GAqVJufiNSgYUQJCEq5+Uo8aK1A0GdukhrAs/TosIB
	xdFYNv7CSitO+KF2Rwm1wI8dc8b99jTvpIBDZtbZjWMclDN64XwsDUXbzEnJXMsZnImd8KZkl+F7P
	1HCZg+bQ==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Wed, 20 May 2026 18:12:05 -0300
Subject: [PATCH v3 1/4] x86/asm: move inline string functions to
 <asm/string_inline.h>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-pvh-kasan-inline-v3-1-bede769c6ec7@igalia.com>
References: <20260520-pvh-kasan-inline-v3-0-bede769c6ec7@igalia.com>
In-Reply-To: <20260520-pvh-kasan-inline-v3-0-bede769c6ec7@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-720697/1779311571-B0979161-D1A88A3B/0/0
X-purgate-type: clean
X-purgate-size: 4424

In next patch, inline string functions are included from 'boot/string.c'.

Using the header <asm/string.h> is problematic for a couple of reasons (*)
(i.e., build errors), which can be addressed, but introduce unnecessary
complexity and regression risk (beyond these _found_ couple of reasons).

Using a new header <asm/string_inline.h> is simpler and transparent to
existing users of <asm/string.h>, with less changes to 'boot/string.c'
and its users (eg 'boot/compressed/string.c' and 'purgatory/purgatory.ro'),
which minimize regression risk.

No functional change intended.

(*) Reasons not to include <asm/string.h> in 'boot/string.c':

1) 'boot/string.c' is built for 16-bit/real mode thus some type and word
size errors happen when <asm/string.h> include, e.g., <asm/string_64.h>.

This can be addressed with '#ifndef _SETUP' (defined by 'boot/Makefile').

2) 'boot/string.c' is included by 'boot/compressed/string.c' which is
the source of 'purgatory/string.o', linked by 'purgatory/purgatory.ro'
(CONFIG_KEXEC_FILE).

In 64BIT, <asm/string.h> includes <asm/string_64.h>, which references
__memset() and __memmove() with KCFI_REFERENCE(), ie, __ADDRESSABLE();
however, 'purgatory/purgatory.ro' is not linked with implementations.

So, CONFIG_KEXEC_FILE and CONFIG_CFI without CONFIG_KASAN hit errors:

  >> ld.lld: error: undefined symbol: __memset
     >>> referenced by string.c
     >>>               arch/x86/purgatory/purgatory.ro:\
                       (__UNIQUE_ID_addressable___memset_0)
  --
  >> ld.lld: error: undefined symbol: __memmove
     >>> referenced by string.c
     >>>               arch/x86/purgatory/purgatory.ro:\
                       (__UNIQUE_ID_addressable___memmove_1)

(Note: this is not hit with CONFIG_KASAN because 'boot/compressed/string.c'
adds aliases __memset()/__memmove() to memset()/memmove() in that case.)

This can be addressed with 'CFLAGS_string.o := -D__DISABLE_EXPORTS' so to
disable KCFI_REFERENCE() in 'purgatory/Makefile' (it removes CC_FLAGS_CFI
anyway).

...

However, since a change in this series would need more changes to address
errors it causes, it is reasonable to change the series not to cause them,
by using a separate header with _just_ inline string functions.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605140922.q7IlUv7o-lkp@intel.com/
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 arch/x86/include/asm/string.h        | 21 +--------------------
 arch/x86/include/asm/string_inline.h | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/string.h b/arch/x86/include/asm/string.h
index 9cb5aae7fba9ffcf0f5af8f939d30467750ccaa9..8a849bb5d0c7100a2a1820ec0af9fc9f850727fd 100644
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
+#include <asm/string_inline.h>
 
 #endif /* _ASM_X86_STRING_H */
diff --git a/arch/x86/include/asm/string_inline.h b/arch/x86/include/asm/string_inline.h
new file mode 100644
index 0000000000000000000000000000000000000000..ffcfa6583d2bc7b91d078888518d0e80248af940
--- /dev/null
+++ b/arch/x86/include/asm/string_inline.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_STRING_INLINE_H
+#define _ASM_X86_STRING_INLINE_H
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
+#endif /* _ASM_X86_STRING_INLINE_H */

-- 
2.51.0


