Return-Path: <SRS0=FTcr=IH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458AFC433E6
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 13:48:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0FED64F85
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 13:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0FED64F85
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.95417.180132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJciu-00049p-5b; Tue, 09 Mar 2021 13:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95417.180132; Tue, 09 Mar 2021 13:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJciu-00049h-27; Tue, 09 Mar 2021 13:48:32 +0000
Received: by outflank-mailman (input) for mailman id 95417;
 Tue, 09 Mar 2021 13:48:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jEQk=IH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lJcis-0003yx-NH
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 13:48:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec89891a-0a5e-4e15-99c8-ae0ab6b17ee0;
 Tue, 09 Mar 2021 13:48:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0AF6AAD21;
 Tue,  9 Mar 2021 13:48:20 +0000 (UTC)
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
X-Inumbo-ID: ec89891a-0a5e-4e15-99c8-ae0ab6b17ee0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615297700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0e7+n4ARWdqAf9kOF5ZbkKtS2O6P/zi/dz62g/QYJCc=;
	b=V3TyEnEU5ipGNiTSmDgJ2rmIt6HRyJOTGDNIO5tZNNe7U09YbRbKoYZoHTEKiCVG6wcHj8
	henyZIRI98T0ylNBLVdW7651+EpwPKYUAile39ispgMx+AzU2cTWcMBlJYMKibDAkWvarA
	IgoKvO9csltNFGy3SNFQ/FVCNGIb2Ys=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v6 03/12] x86/alternative: drop feature parameter from ALTINSTR_REPLACEMENT()
Date: Tue,  9 Mar 2021 14:48:04 +0100
Message-Id: <20210309134813.23912-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309134813.23912-1-jgross@suse.com>
References: <20210309134813.23912-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro ALTINSTR_REPLACEMENT() doesn't make use of the feature
parameter, so drop it.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
V5:
- new patch
---
 arch/x86/include/asm/alternative.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 13adca37c99a..5753fb2ac489 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -150,7 +150,7 @@ static inline int alternatives_text_reserved(void *start, void *end)
 	" .byte " alt_rlen(num) "\n"			/* replacement len */ \
 	" .byte " alt_pad_len "\n"			/* pad len */
 
-#define ALTINSTR_REPLACEMENT(newinstr, feature, num)	/* replacement */	\
+#define ALTINSTR_REPLACEMENT(newinstr, num)		/* replacement */	\
 	"# ALT: replacement " #num "\n"						\
 	b_replacement(num)":\n\t" newinstr "\n" e_replacement(num) ":\n"
 
@@ -161,7 +161,7 @@ static inline int alternatives_text_reserved(void *start, void *end)
 	ALTINSTR_ENTRY(feature, 1)					\
 	".popsection\n"							\
 	".pushsection .altinstr_replacement, \"ax\"\n"			\
-	ALTINSTR_REPLACEMENT(newinstr, feature, 1)			\
+	ALTINSTR_REPLACEMENT(newinstr, 1)				\
 	".popsection\n"
 
 #define ALTERNATIVE_2(oldinstr, newinstr1, feature1, newinstr2, feature2)\
@@ -171,8 +171,8 @@ static inline int alternatives_text_reserved(void *start, void *end)
 	ALTINSTR_ENTRY(feature2, 2)					\
 	".popsection\n"							\
 	".pushsection .altinstr_replacement, \"ax\"\n"			\
-	ALTINSTR_REPLACEMENT(newinstr1, feature1, 1)			\
-	ALTINSTR_REPLACEMENT(newinstr2, feature2, 2)			\
+	ALTINSTR_REPLACEMENT(newinstr1, 1)				\
+	ALTINSTR_REPLACEMENT(newinstr2, 2)				\
 	".popsection\n"
 
 #define ALTERNATIVE_3(oldinsn, newinsn1, feat1, newinsn2, feat2, newinsn3, feat3) \
@@ -183,9 +183,9 @@ static inline int alternatives_text_reserved(void *start, void *end)
 	ALTINSTR_ENTRY(feat3, 3)						\
 	".popsection\n"								\
 	".pushsection .altinstr_replacement, \"ax\"\n"				\
-	ALTINSTR_REPLACEMENT(newinsn1, feat1, 1)				\
-	ALTINSTR_REPLACEMENT(newinsn2, feat2, 2)				\
-	ALTINSTR_REPLACEMENT(newinsn3, feat3, 3)				\
+	ALTINSTR_REPLACEMENT(newinsn1, 1)					\
+	ALTINSTR_REPLACEMENT(newinsn2, 2)					\
+	ALTINSTR_REPLACEMENT(newinsn3, 3)					\
 	".popsection\n"
 
 /*
-- 
2.26.2


