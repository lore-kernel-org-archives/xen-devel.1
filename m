Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A182DC55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 07:53:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382922.1626190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrWR6-0005ai-Hg; Wed, 05 Aug 2026 07:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382922.1626190; Wed, 05 Aug 2026 07:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrWR6-0005ab-DY; Wed, 05 Aug 2026 07:53:12 +0000
Received: by outflank-mailman (input) for mailman id 1382922;
 Wed, 05 Aug 2026 07:53:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wrWR5-0005aV-EF
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 07:53:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrWR4-00E4m8-HD
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 09:53:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a72ebe5-bab6-0a2a0a5309dd-0a2a450c84a8-6
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 09:53:10 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a72ebe6-f479-0a2a450c0019-d1558031eda4-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 09:53:10 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49553515a8bso9179445e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 00:53:10 -0700 (PDT)
Received: from andrew-laptop.. ([157.231.70.114])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994a0f7b86sm160254105e9.10.2026.08.05.00.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 00:53:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1785916390; x=1786521190; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1VYSxA8qmfZtawmM+q3vCQMEETV4GCOYeujyXp2mk/o=;
        b=qKnCDFfwitDtmsHf4P3URc2QzB2KPb+oV57PtaehctpY1MsxpgY6SKCyPRiFYqgZMY
         jsJHO/WHFC2wUnRX9XTHzDwS61jS2pvV5zPM3mkOKqbqRkpLkvehmSM9f5eCYlM99/Eq
         r7BabXbs2ZhnqLvIft+Bd8BWlpHi3gnjiI9r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785916390; x=1786521190;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1VYSxA8qmfZtawmM+q3vCQMEETV4GCOYeujyXp2mk/o=;
        b=Txf7mRBgGzPN7V8aujsne9pgTEnLbu3yXgeCM6/Vy2WSDxQK5V7FVYEj3MWPAfifbp
         toqr4Ff87jmjAuPTu0Lt6+mE3yNRmWZPVEjAGzINJEbBgmLxMShsagipS3pzfWfy8b/z
         xTOPWDyqiVtpBbNpyhFztvVWSrBKJiSauKJ9N7eYHT5F9ZJjUEgUXq1vuS22UhtUBRSa
         hK37AXFaoy+BjeCTXAZvvfde5uSgvwD0e7S5cDOUBu8bHkwpzI/n9QwJ/EYkJ/RqlA8s
         SrF/UDyFlsLrVNSXeWkUo9l1jmh6p0dL5N1YOlX+IHu81NRx/5sVByQD+lYZ3xr6dCLl
         iSmQ==
X-Gm-Message-State: AOJu0Yx5YTz3dPFZ4x3WAcZP6bn+7Dd25ie5Qm/5pJCjXTpm8uLpoxnU
	X7R5EelatuvKGGxrqF6xP90RSrU7S2SYbR7hVbNORDVckvzvcUvwaJKaaYn2y2wFD54+dLDkFS6
	hiawKxz8=
X-Gm-Gg: AR+sD11YCVhhoKIz+84m2sIXX4tX8gco1nxvvj/mbjE9G+9LCljTYTwhZwrkrpQ3Ixh
	4PY4Y6J49adpOSOM8f8U80ToD3bqwUr/qa77e1qCbZHXjUGg0TeAdGnHhQmELbLNHp8YiwE1MyP
	wXrbLYlqDQcWYlmVnEA4xhqRxJVcDJtlvaXGPoLz+cczXoKKIJvniBNzE43gzdSY+t+TplQruOb
	PpKcS3glSVOu0vci1pxyyH3RHrIF3a01oug1/g54HrOntvUvbt3diW81cVl0Kn8otthVTVPANmB
	MKIJDZ+U9O3SNlhwAKFaA5Tpw2nFhrvW1kntbzKwRHygjJK8rGbENuClMLR7P9eiU8CXfx/hW31
	pfGIwpddCBgFU3BTEukIF1bG0jRf0Seu2wfX3rPDfksT6gtyMt1sZIYAcC4mOhDPBSxse8ZO+88
	quy2fzQ7LoC4wGV5vUiRGm/En0VlOMYMGPofumTxyOE3R06YQx8TjEbvCMz5LpZqA7u8MElAXQ
X-Received: by 2002:a05:600c:3150:b0:496:ca1f:a428 with SMTP id 5b1f17b1804b1-4994e7f3562mr41132765e9.19.1785916389368;
        Wed, 05 Aug 2026 00:53:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH v2 2/3] x86/alternatives: Rework get_ideal_nops()
Date: Wed,  5 Aug 2026 08:53:03 +0100
Message-Id: <20260805075303.23105-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522150015.555492-3-andrew.cooper3@citrix.com>
References: <20250522150015.555492-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1785916390-01EC2A5B-6928294C/0/0
X-purgate-type: clean
X-purgate-size: 3469

The {k8,p6}_nops[] arrays are both 80-byte structures indexing 45-byte
structures.  Furthermore, perhaps unusually for C, the source layout is an
obvious hint about the triangular nature of the structure.

Therefore, we can replace the pointer chase with some simple arithmetic.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>

v2:
 * Add build assertion.
---
 xen/arch/x86/alternative.c | 48 ++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index f0644055d3d3..30c5ccaa8b16 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -20,7 +20,7 @@
 #define MAX_PATCH_LEN (255-1)
 
 #ifdef K8_NOP1
-static const unsigned char k8nops[] init_or_livepatch_const = {
+static const unsigned char k8_nops[] init_or_livepatch_const = {
     K8_NOP1,
     K8_NOP2,
     K8_NOP3,
@@ -31,22 +31,10 @@ static const unsigned char k8nops[] init_or_livepatch_const = {
     K8_NOP8,
     K8_NOP9,
 };
-static const unsigned char * const k8_nops[ASM_NOP_MAX+1] init_or_livepatch_constrel = {
-    NULL,
-    k8nops,
-    k8nops + 1,
-    k8nops + 1 + 2,
-    k8nops + 1 + 2 + 3,
-    k8nops + 1 + 2 + 3 + 4,
-    k8nops + 1 + 2 + 3 + 4 + 5,
-    k8nops + 1 + 2 + 3 + 4 + 5 + 6,
-    k8nops + 1 + 2 + 3 + 4 + 5 + 6 + 7,
-    k8nops + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8,
-};
 #endif
 
 #ifdef P6_NOP1
-static const unsigned char p6nops[] init_or_livepatch_const = {
+static const unsigned char p6_nops[] init_or_livepatch_const = {
     P6_NOP1,
     P6_NOP2,
     P6_NOP3,
@@ -57,21 +45,9 @@ static const unsigned char p6nops[] init_or_livepatch_const = {
     P6_NOP8,
     P6_NOP9,
 };
-static const unsigned char * const p6_nops[ASM_NOP_MAX+1] init_or_livepatch_constrel = {
-    NULL,
-    p6nops,
-    p6nops + 1,
-    p6nops + 1 + 2,
-    p6nops + 1 + 2 + 3,
-    p6nops + 1 + 2 + 3 + 4,
-    p6nops + 1 + 2 + 3 + 4 + 5,
-    p6nops + 1 + 2 + 3 + 4 + 5 + 6,
-    p6nops + 1 + 2 + 3 + 4 + 5 + 6 + 7,
-    p6nops + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8,
-};
 #endif
 
-static const unsigned char * const *ideal_nops init_or_livepatch_data = p6_nops;
+static const unsigned char *ideal_nops init_or_livepatch_data = p6_nops;
 
 #ifdef HAVE_AS_NOPS_DIRECTIVE
 
@@ -86,9 +62,19 @@ static bool init_or_livepatch_read_mostly toolchain_nops_are_ideal;
 # define toolchain_nops_are_ideal false
 #endif
 
+#define TRIANGLE(x) (((x) * ((x) + 1)) / 2)
+
+/*
+ * Both k8_nops[] and p6_nops[] are flattened triangular data structures,
+ * making the offsets easy to calculate.
+ *
+ * To get the start of NOP $N, we want to calculate TRIANGLE($N - 1)
+ */
 static const unsigned char *init_or_livepatch get_ideal_nops(unsigned int noplen)
 {
-    return ideal_nops[noplen];
+    unsigned int offset = TRIANGLE(noplen - 1);
+
+    return &ideal_nops[offset];
 }
 
 static void __init arch_init_ideal_nops(void)
@@ -601,3 +587,9 @@ void __init boot_apply_alt_calls(void)
     _alternative_instructions(ALT_CALLS);
     local_irq_enable();
 }
+
+static void __init __maybe_unused build_assertions(void)
+{
+    BUILD_BUG_ON(ARRAY_SIZE(k8_nops) != TRIANGLE(ASM_NOP_MAX));
+    BUILD_BUG_ON(ARRAY_SIZE(p6_nops) != TRIANGLE(ASM_NOP_MAX));
+}
-- 
2.34.1


