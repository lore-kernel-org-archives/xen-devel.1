Return-Path: <SRS0=Sbf7=AM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D7CC433E2
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2020 11:07:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2F4C20780
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2020 11:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2F4C20780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqaaE-0006o8-Tr; Wed, 01 Jul 2020 11:07:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T2yc=AM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jqaaD-0006nx-CV
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 11:07:17 +0000
X-Inumbo-ID: 05977038-bb8b-11ea-86ef-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05977038-bb8b-11ea-86ef-12813bfff9fa;
 Wed, 01 Jul 2020 11:07:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 699ECAD71;
 Wed,  1 Jul 2020 11:07:15 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] x86/paravirt: cleanup paravirt macros
Date: Wed,  1 Jul 2020 13:06:49 +0200
Message-Id: <20200701110650.16172-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701110650.16172-1-jgross@suse.com>
References: <20200701110650.16172-1-jgross@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, Deep Shah <sdeep@vmware.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Some paravirt macros are no longer used, delete them.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/paravirt.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index cfe9f6e472b5..cff2fbd1edd5 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -609,16 +609,9 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
 #endif /* SMP && PARAVIRT_SPINLOCKS */
 
 #ifdef CONFIG_X86_32
-#define PV_SAVE_REGS "pushl %ecx; pushl %edx;"
-#define PV_RESTORE_REGS "popl %edx; popl %ecx;"
-
 /* save and restore all caller-save registers, except return value */
 #define PV_SAVE_ALL_CALLER_REGS		"pushl %ecx;"
 #define PV_RESTORE_ALL_CALLER_REGS	"popl  %ecx;"
-
-#define PV_FLAGS_ARG "0"
-#define PV_EXTRA_CLOBBERS
-#define PV_VEXTRA_CLOBBERS
 #else
 /* save and restore all caller-save registers, except return value */
 #define PV_SAVE_ALL_CALLER_REGS						\
@@ -639,14 +632,6 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
 	"pop %rsi;"							\
 	"pop %rdx;"							\
 	"pop %rcx;"
-
-/* We save some registers, but all of them, that's too much. We clobber all
- * caller saved registers but the argument parameter */
-#define PV_SAVE_REGS "pushq %%rdi;"
-#define PV_RESTORE_REGS "popq %%rdi;"
-#define PV_EXTRA_CLOBBERS EXTRA_CLOBBERS, "rcx" , "rdx", "rsi"
-#define PV_VEXTRA_CLOBBERS EXTRA_CLOBBERS, "rdi", "rcx" , "rdx", "rsi"
-#define PV_FLAGS_ARG "D"
 #endif
 
 /*
-- 
2.26.2


