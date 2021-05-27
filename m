Return-Path: <SRS0=cWgu=KW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DD1C47089
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 12:31:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5513613C3
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 12:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5513613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.133087.248151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFAN-0002aF-73; Thu, 27 May 2021 12:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133087.248151; Thu, 27 May 2021 12:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFAN-0002a8-3R; Thu, 27 May 2021 12:31:11 +0000
Received: by outflank-mailman (input) for mailman id 133087;
 Thu, 27 May 2021 12:31:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmFAM-0002a0-7c
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 12:31:10 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0de3975c-099d-42a7-9c1f-15a18aaeef7d;
 Thu, 27 May 2021 12:31:09 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6EDFC218DD;
 Thu, 27 May 2021 12:31:08 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 4435511A98;
 Thu, 27 May 2021 12:31:08 +0000 (UTC)
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
X-Inumbo-ID: 0de3975c-099d-42a7-9c1f-15a18aaeef7d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622118668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0I4gNzPs7QkUzQaZgNM9qNeznBTvZe1/bKfap9B3u8w=;
	b=j6t6sDTyYXBiRPX9kFPTiT8c3JUIc5bsqpm1+JIVm53FA0U71KrhORmXGelcmk0EqVwdYp
	nXTtw0qpBqQQLM9Jc3pOPA4F8HKPuJPAiEGiTf2rOJY5wk/JTwP5t90qCucd0YtiMOKLfV
	bCg7y+ALsbYh4O4yh8IgCiIcty//0Lo=
Subject: [PATCH v2 02/12] x86: re-work memset()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Message-ID: <e43a7b27-db34-303a-6483-6d90781c6978@suse.com>
Date: Thu, 27 May 2021 14:31:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Move the function to its own assembly file. Having it in C just for the
entire body to be an asm() isn't really helpful. Then have two flavors:
A "basic" version using qword steps for the bulk of the operation, and an
ERMS version for modern hardware, to be substituted in via alternatives
patching.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
We may want to consider branching over the REP STOSQ as well, if the
number of qwords turns out to be zero.
We may also want to consider using non-REP STOS{L,W,B} for the tail.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_INDIRECT_THUNK) += indirect
 obj-y += ioport_emulate.o
 obj-y += irq.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
+obj-y += memset.o
 obj-y += mm.o x86_64/mm.o
 obj-$(CONFIG_HVM) += monitor.o
 obj-y += mpparse.o
--- /dev/null
+++ b/xen/arch/x86/memset.S
@@ -0,0 +1,31 @@
+#include <asm/asm_defns.h>
+
+.macro memset
+        and     $7, %edx
+        shr     $3, %rcx
+        movzbl  %sil, %esi
+        mov     $0x0101010101010101, %rax
+        imul    %rsi, %rax
+        mov     %rdi, %rsi
+        rep stosq
+        or      %edx, %ecx
+        jz      0f
+        rep stosb
+0:
+        mov     %rsi, %rax
+        ret
+.endm
+
+.macro memset_erms
+        mov     %esi, %eax
+        mov     %rdi, %rsi
+        rep stosb
+        mov     %rsi, %rax
+        ret
+.endm
+
+ENTRY(memset)
+        mov     %rdx, %rcx
+        ALTERNATIVE memset, memset_erms, X86_FEATURE_ERMS
+        .type memset, @function
+        .size memset, . - memset
--- a/xen/arch/x86/string.c
+++ b/xen/arch/x86/string.c
@@ -22,19 +22,6 @@ void *(memcpy)(void *dest, const void *s
     return dest;
 }
 
-void *(memset)(void *s, int c, size_t n)
-{
-    long d0, d1;
-
-    asm volatile (
-        "rep stosb"
-        : "=&c" (d0), "=&D" (d1)
-        : "a" (c), "1" (s), "0" (n)
-        : "memory");
-
-    return s;
-}
-
 void *(memmove)(void *dest, const void *src, size_t n)
 {
     long d0, d1, d2;


