Return-Path: <SRS0=XA5Y=BR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59701C433E0
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2020 08:38:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3829D22CAE
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2020 08:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3829D22CAE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3xtp-00071Y-IG; Fri, 07 Aug 2020 08:38:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQGK=BR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k3xto-0006sR-Au
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 08:38:48 +0000
X-Inumbo-ID: 331e9460-27c0-4fb0-8f24-18b1601f04f5
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 331e9460-27c0-4fb0-8f24-18b1601f04f5;
 Fri, 07 Aug 2020 08:38:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FC3DB644;
 Fri,  7 Aug 2020 08:38:50 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] x86/paravirt: use CONFIG_PARAVIRT_XXL instead of
 CONFIG_PARAVIRT
Date: Fri,  7 Aug 2020 10:38:25 +0200
Message-Id: <20200807083826.16794-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200807083826.16794-1-jgross@suse.com>
References: <20200807083826.16794-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There are some code parts using CONFIG_PARAVIRT for Xen pvops related
issues instead of the more stringent CONFIG_PARAVIRT_XXL.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/entry/entry_64.S                | 4 ++--
 arch/x86/include/asm/fixmap.h            | 2 +-
 arch/x86/include/asm/required-features.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 70dea9337816..26fc9b42fadc 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -46,13 +46,13 @@
 .code64
 .section .entry.text, "ax"
 
-#ifdef CONFIG_PARAVIRT
+#ifdef CONFIG_PARAVIRT_XXL
 SYM_CODE_START(native_usergs_sysret64)
 	UNWIND_HINT_EMPTY
 	swapgs
 	sysretq
 SYM_CODE_END(native_usergs_sysret64)
-#endif /* CONFIG_PARAVIRT */
+#endif /* CONFIG_PARAVIRT_XXL */
 
 /*
  * 64-bit SYSCALL instruction entry. Up to 6 arguments in registers.
diff --git a/arch/x86/include/asm/fixmap.h b/arch/x86/include/asm/fixmap.h
index b9527a54db99..f1422ada4ffe 100644
--- a/arch/x86/include/asm/fixmap.h
+++ b/arch/x86/include/asm/fixmap.h
@@ -99,7 +99,7 @@ enum fixed_addresses {
 	FIX_PCIE_MCFG,
 #endif
 #endif
-#ifdef CONFIG_PARAVIRT
+#ifdef CONFIG_PARAVIRT_XXL
 	FIX_PARAVIRT_BOOTMAP,
 #endif
 #ifdef	CONFIG_X86_INTEL_MID
diff --git a/arch/x86/include/asm/required-features.h b/arch/x86/include/asm/required-features.h
index 6847d85400a8..3ff0d48469f2 100644
--- a/arch/x86/include/asm/required-features.h
+++ b/arch/x86/include/asm/required-features.h
@@ -54,7 +54,7 @@
 #endif
 
 #ifdef CONFIG_X86_64
-#ifdef CONFIG_PARAVIRT
+#ifdef CONFIG_PARAVIRT_XXL
 /* Paravirtualized systems may not have PSE or PGE available */
 #define NEED_PSE	0
 #define NEED_PGE	0
-- 
2.26.2


