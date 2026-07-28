Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C5CC54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 15:49:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374914.1622261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok2m-0002A0-8x; Tue, 28 Jul 2026 15:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374914.1622261; Tue, 28 Jul 2026 15:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok2m-00029R-48; Tue, 28 Jul 2026 15:48:36 +0000
Received: by outflank-mailman (input) for mailman id 1374914;
 Tue, 28 Jul 2026 15:48:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wok2l-00025b-7a
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:48:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wok2k-003IVm-KU
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 17:48:34 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a68cf2b-e002-0a2a0a5209dd-0a2a4507d9ae-38
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:48:34 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a68cf52-b4ea-0a2a45070019-d1558035b1b1-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:48:34 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49545ba3d4eso23147245e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:48:34 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c44b6b93sm88807765e9.4.2026.07.28.08.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 08:48:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1785253714; x=1785858514; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xsDN+AQLbvmNAQEIOp0aFB4rB8Yl6TO3U84KiiThsS0=;
        b=Ahs2fdKDBIiVhqEyfjCQB+lFttZXWNx8y+15JuuzxUAGvEb3OqTzs/bzi1Yb2pqFJy
         0J9L5vBdCAgWiRg3RyjOwzaGhnZHKoZKEYC+e8bHNpyFhCub+eCJSRI9AT9ZllHktwt4
         k7R2I2oAERYge5jlhnCqj5jmeQhYlKvFU79vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253714; x=1785858514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xsDN+AQLbvmNAQEIOp0aFB4rB8Yl6TO3U84KiiThsS0=;
        b=rC6ZAACnaWamP++2QCXV4k4pcFDIMbWydc+GEPgDHtjm8d3xnAroJWiPCj8uWbfQZ+
         gN1Jy4rQ84tPmk7wp8Q7EJusGnSTWayj/1qdsu/4Clew2uv889Q0TFYOm8fy1n0lw+WN
         qocZWtA0On/yi+K4VyKfCc0uq7iBAvaQr8R/cCpFqFjrVKd5RYCiYaBm+ZAoUDV89/69
         EizcBShpFb+r2UJD4QhruD9SX+Nc6JuJbcrgfB/6bJ6m8VEi7a7lieeFStp7rwc1Ybf/
         QixXjr+jfewzi1MaaixLUwMTuYMpKutBkcXo21lMoEv+KBQ29Abq74Dv0zKqWE/BQ6rm
         6/Lg==
X-Gm-Message-State: AOJu0Yw2dyfFGVBcRk1Lguq44y7sgNgC2SJhQsW9VHk7klSHybC2+Dw8
	x/hv5p10ExzTNKABnQoXjEEjxD5/ywnJcYw0MJ9tuB/X1SwaY/+nrqVkCDpPp5vSbR0Yoss2rQW
	h3qE8JZU=
X-Gm-Gg: AR+sD10MR4hLfN2O7oA9OB9KQrz9ZTyocUTj3/VfmR/lklpuOCJqp7Nn+Orq2JREK2g
	q4tEytwg6AKonoNeecFobCTCKCW4AIJd0uWXRjWVl4TU/2SV7x4Ganym+8QAHGDb4F7eKXU/RwQ
	O3ynbLNn8LDC+4CceH20/03LRUu07fU3uF+suqfphbNBtyaXHQRDbLMnBK5vJbHlcJDM9BO5oZs
	TXBpKziYTGHgh2jXMJv5N7uROYOQ3O8V95EOaapT5jlrErfi3VCq48pdjUflME0kb4Lcdc6o3wG
	hEaFQ4b3QFxxG7Xi+IkUHwiEW7j7ywshmq4ho/w9ZIwa/PrOrokOpwD6Ge++plh74PwHFPONZc8
	fBkSnFa3bQXXaU0+ACBEF0PS+AEhYBJ9ga8PkSwkuqsDGXP1MVyLfbTPbSZWPRAz5S0oQW+S6OI
	VRBoNilssC2A14qwugW5V8tES0MmpDQTXHviNVeLVlcrMqaYwuKvrg
X-Received: by 2002:a05:600c:46d0:b0:495:4a34:16e1 with SMTP id 5b1f17b1804b1-496c656e064mr32504195e9.23.1785253713623;
        Tue, 28 Jul 2026 08:48:33 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/2] tools/ocaml: Fix crash in Xenctrl.domain_getinfo{,list} on ARM
Date: Tue, 28 Jul 2026 16:48:29 +0100
Message-Id: <20260728154830.67734-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260728154830.67734-1-andrew.cooper3@citrix.com>
References: <20260728154830.67734-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1785253714-376D2AE4-CD27929D/10/73395122804
X-purgate-type: spam
X-purgate-size: 2904

The Store_field(result, 16, arch_config) sits inside an ifdef x86, meaning
that on other archtiectures the pointer is not filled in.  The Ocaml runtime
then falls over a NULL pointer (really the Val_unit used to initialise
'result') when the layout in the heap doesn't match the type system.

Rearrange alloc_domaininfo() to avoid this.  Similarly to
physinfo_arch_caps(), raise an exception if the architecture code hasn't
filled in an appropriate tag.  Move the setup of arch_domainconfig to be
common logic.

In order to simplify the addition of other architectures, remove the
arch_config variable (resuing tmp as it's touched exactly once), and rename
x86_arch_config to be arch_config so each architecture can fill in a suitable
one without needing more local variables.

Reported-by: Julian Vetter <julian.vetter@vates.tech>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Andrii Sultanov <andriy.sultanov@vates.tech>
CC: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 7f6381cdd2fe..441e1d83cfec 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -414,7 +414,8 @@ CAMLprim value stub_xc_domain_shutdown(value xch_val, value domid, value reason)
 static value alloc_domaininfo(xc_domaininfo_t * info)
 {
 	CAMLparam0();
-	CAMLlocal5(result, tmp, arch_config, x86_arch_config, emul_list);
+	CAMLlocal4(result, tmp, arch_config, emul_list);
+	int tag = -1;
 	int i;
 
 	result = caml_alloc_tuple(17);
@@ -444,6 +445,9 @@ static value alloc_domaininfo(xc_domaininfo_t * info)
 	Store_field(result, 15, tmp);
 
 #if defined(__i386__) || defined(__x86_64__)
+
+	tag = 1; /* tag x86 */
+
 	/*
 	 * emulation_flags: x86_arch_emulation_flags list;
 	 */
@@ -452,16 +456,17 @@ static value alloc_domaininfo(xc_domaininfo_t * info)
 		(info->arch_config.emulation_flags);
 
 	/* xen_x86_arch_domainconfig */
-	x86_arch_config = caml_alloc_tuple(1);
-	Store_field(x86_arch_config, 0, emul_list);
+	arch_config = caml_alloc_tuple(1);
+	Field(arch_config, 0) = emul_list;
 
-	/* arch_config: arch_domainconfig */
-	arch_config = caml_alloc_small(1, 1);
-
-	Store_field(arch_config, 0, x86_arch_config);
-
-	Store_field(result, 16, arch_config);
 #endif
+	if (tag < 0)
+		caml_failwith("Unimplemented architecutre in alloc_domaininfo()");
+
+	/* arch_config: arch_domainconfig */
+	tmp = caml_alloc_small(1, tag);
+	Field(tmp, 0) = arch_config;
+	Field(result, 16) = tmp;
 
 	CAMLreturn(result);
 }
-- 
2.39.5


