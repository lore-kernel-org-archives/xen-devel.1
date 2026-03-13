Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797CF105F799
	for <xen-devel@archiver.kernel.org>; Fri, 13 Mar 2026 10:50:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1253520.1549721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w105g-0006NB-TE; Fri, 13 Mar 2026 10:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253520.1549721; Fri, 13 Mar 2026 10:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w105g-0006N4-Pd; Fri, 13 Mar 2026 10:50:00 +0000
Received: by outflank-mailman (input) for mailman id 1253520;
 Fri, 13 Mar 2026 10:49:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RFGv=BN=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1w105e-0006Mw-RL
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 10:49:58 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60422c07-1eca-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 11:49:57 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4853f2826f7so19617025e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 03:49:57 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b7f255sm306357955e9.12.2026.03.13.03.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 03:49:56 -0700 (PDT)
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
X-Inumbo-ID: 60422c07-1eca-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1773398997; x=1774003797; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cCc6Rsu6njgY2i55JlN7uSjh8xb1A//upegbhHr/ukE=;
        b=nfPQYh3wQq/FCQ2gJ3ufnV940l5eBNezWNlPRQ5Et1Lhw+8lkaPp17ljjG4+uOuQy4
         4jMCt57/SiTlFQyVVrVR/FopPAvNoCIUm4QJiuqPKY+D4+43oZNEH0KxUeAmgSAeF1qg
         cXWsaXPNIIYNo54KW9lcZaT+xIYdyx8pGIlAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398997; x=1774003797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCc6Rsu6njgY2i55JlN7uSjh8xb1A//upegbhHr/ukE=;
        b=RFJFcTQ2VpDnak8nfVQkXJ7wmIdtQJxnUXvgXRaVCpJ0KbrGGw+xiy+VbE+G6Kr7GE
         8BCAXrHz1TfybmxPtAvqWgubfMbOTnE5OHIFp3wWT67x8q05C8bLE1rYUjkQ7dhB1ELT
         BiLebrSc1o2UxK+lVnvjyJlg3oiZG0d9AMScuyftodMTmkZSXuKaaxSGkQ0YmFjFyW8d
         rpXQTAhqsU17v169n241ksnlRTl7+RTpzbWdF613C/o5IvMDvZNdGfjI+UKiZ1kZRMP8
         l0YP96gaZAjKxieizrgk2CE13JKa0dET1zjVoSjqkGHFcJj7atlGh0AOvZZWovdwPDfW
         YMcA==
X-Gm-Message-State: AOJu0Yz6Lm9z+HsEk5eyGcsRpaWN0qBu7+WGdVWnYyBAdXSdCL1ImV2u
	Hzlc3VTDQUX+vDdWkhmwyPpiHfnI57zq3aB0u6diHx5bWPij+S1SamrlDNd710lVjKeNF5Ebk9y
	99kYG
X-Gm-Gg: ATEYQzwAY7EFKn15ffqpr+Ga/HXpzxfreRyRMWf+eYUV1xai07ZthVoMOJzf7FqvvBF
	leASEd7LCjOQxyg4900ixGdSOnP1Md7rVeb1EJMcouKPfyB3Y9tDh5HQ5EvqK8UekwejnZRARPT
	lFxRCk4xv/Rea6AjyGEz5d37pVaGfwWz40AWdEInVAR9UfEmSaQXtAfFGMjh488A2hljPd20r2p
	ztvWy5RMmrNOWT8Ho1DfSZibs9jGm4QlTNKaukglrb1/eJqxJIEskEl76ZGs0cl4zFvoDgZq6lG
	SG+1E+uz1uL1BhEA601buKOmJFhwMdsjVHyxEdIultkx4g3nt7aUUt8Yr7MwHvdQApJAdck8lR1
	q8pkCP7/P1b+8IpE04AnOkynoxGoqQPC4WyVPM3gnj4IMjQFpMJC+rXSsF74mSY+iZu7YBIU+KZ
	kMJPnB73lW/R9RGwno756dMccAs1U42wB0RNRjjIl23debQFRfrKwVCNo6OGDJKKZd3Si2M9c=
X-Received: by 2002:a05:600c:45d5:b0:485:4535:73d with SMTP id 5b1f17b1804b1-485566cfb8amr43531425e9.2.1773398996418;
        Fri, 13 Mar 2026 03:49:56 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/mce: Fix buggy error path in cpu_bank_alloc() leading to UAF
Date: Fri, 13 Mar 2026 10:49:54 +0000
Message-Id: <20260313104954.590855-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When cleaning up from a mcabanks_alloc() failure, the memory is freed but
stale pointers are left in the percpu variables.

Use cpu_bank_free() which is idempotent and behaves correctly.

Fixes: 2e6c8f182c9c ("x86: distinguish CPU offlining from CPU removal")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

2e6c8f182c9c updated the success path but missed the associated error path.

Prior to that, the paths were at least consistent since their introduction in
commit 78c579426fb5 ("x86/MCE: Implement clearbank callback for AMD").
---
 xen/arch/x86/cpu/mcheck/mce.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 9a91807cfb33..684871b216a4 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -694,8 +694,7 @@ static int cpu_bank_alloc(unsigned int cpu)
 
     if ( !poll || !clr )
     {
-        mcabanks_free(poll);
-        mcabanks_free(clr);
+        cpu_bank_free(cpu);
         return -ENOMEM;
     }
 
-- 
2.39.5


