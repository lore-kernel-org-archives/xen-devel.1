Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2A8CD6E41
	for <xen-devel@archiver.kernel.org>; Tue, 26 May 2026 14:53:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1319971.1587402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRt9P-0003Mh-FW; Tue, 26 May 2026 14:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319971.1587402; Tue, 26 May 2026 14:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRt9P-0003MX-Bf; Tue, 26 May 2026 14:52:59 +0000
Received: by outflank-mailman (input) for mailman id 1319971;
 Tue, 26 May 2026 14:52:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wRt9N-0003Ll-Nc
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 14:52:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRt9N-009wiG-3Y
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 16:52:57 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a15b3bc-2eae-0a2a0a5409dd-0a2a4502d2a2-24
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 16:52:56 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 6a15b3c7-af86-0a2a45020019-d561b338cd9a-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 16:52:55 +0200
Received: from 186-249-145-161.shared.desktop.com.br ([186.249.145.161]
 helo=[192.168.1.68]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wRt9K-008TwX-OV; Tue, 26 May 2026 16:52:55 +0200
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
	bh=UTOmAuiPQ1w9q3gPb2qsdx9jiBuxtzvoq44hIQ1/dkQ=; b=RJTHWlKG1FeZ9gjM4LsjQuc4z9
	+EQtwpdyMJpAtgaD4rOIVqx8Z99YlVI9XB6jBHb6uJYJoPyHJixkVQMqzdi7qdxja69KdeeFeGMhz
	3yxL2rVgY6JiUVCUZyeK+kgW5Df5TQ1MvN8IcIOJJ4RLddvuoncNls7UDgyWAfAyBSJ9riQS3MjgK
	y4/bYCWT6uTLVwUq+vX0ms9ijYzHwBU6gudxf6Zwt4E0sGM/pwigpWIuDzfkvy6TpvLfQD6O+eGsE
	C7csYOpMgdpyVA2bjrhy1dclhRahumZC3ivC8LdLf9uYdd8dnf2DGxYTnK1Sc5gn/crvTQStqiMu/
	7qXv9MQw==;
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Tue, 26 May 2026 11:52:34 -0300
Subject: [PATCH v4 2/4] x86/asm, x86/boot: expose inline memcmp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-pvh-kasan-inline-v4-2-a310e6a25ecd@igalia.com>
References: <20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com>
In-Reply-To: <20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-720697/1779807176-8117D161-4AE29E21/0/0
X-purgate-type: clean
X-purgate-size: 2102

Move the inline memcmp function currently only available in 'boot/string.c'
and its users (eg, 'boot/compressed/string.c' and 'purgatory/purgatory.ro')
into the inline string functions header <asm/string_inline.h> to be reused.

Note that the inline memcmp() returns 0/1, not -1/0/1 as regular memcmp()
(reported by David Laight <david.laight.linux@gmail.com>), which is not
caused or changed by this commit; this will be addressed separately.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/boot/string.c               |  6 ++----
 arch/x86/include/asm/string_inline.h | 11 +++++++++++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index ac0f900ebc47efa81c92e1bb2010ea41677899c4..544681d046c3f87101309ffaca0c90512a244856 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/limits.h>
 #include <asm/asm.h>
+#include <asm/string_inline.h>
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
diff --git a/arch/x86/include/asm/string_inline.h b/arch/x86/include/asm/string_inline.h
index ffcfa6583d2bc7b91d078888518d0e80248af940..91ed89bfdfa9b148002441e94f48039b17f70391 100644
--- a/arch/x86/include/asm/string_inline.h
+++ b/arch/x86/include/asm/string_inline.h
@@ -23,4 +23,15 @@ static __always_inline void *__inline_memset(void *s, int v, size_t n)
 	return ret;
 }
 
+/* Note: this memcmp() returns 0/1, not -1/0/1 as regular memcmp(). */
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
 #endif /* _ASM_X86_STRING_INLINE_H */

-- 
2.51.0


