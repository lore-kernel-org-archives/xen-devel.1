Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F08CA5FC4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 11:20:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439054.1657562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCbJL-0004JO-4z; Fri, 02 Oct 2026 11:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439054.1657562; Fri, 02 Oct 2026 11:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCbJL-0004JH-2P; Fri, 02 Oct 2026 11:20:19 +0000
Received: by outflank-mailman (input) for mailman id 1439054;
 Fri, 02 Oct 2026 11:20:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xCbJJ-0004JB-GL
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 11:20:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xCbJI-00B6IU-1Z;
 Fri, 02 Oct 2026 11:20:16 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xCbJI-00AxNy-1E;
 Fri, 02 Oct 2026 11:20:16 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From;
	bh=UqlocLvpi/8FAA19/MNga9Pe2S0YGE5N86Jze2jUass=; b=Mw4YDfa2tDDstgIiVzMpa0MrDj
	+Ox629DkH69V9Ms/AGPLAIlA/yJAlCgt6j7Heq7EaFdhm6jU3IoYy4qv+OJh9dOfisugBZ3qgR1JZ
	6+mAjKFsBhKf0sF/h+IQ2KPE+7Nx92nb6dBI9q2ghiVQZHC4NooM7SAT7jj/3AKpCoX0=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2] x86/domain: restrict context switch hooks for the idle domain
Date: Fri,  2 Oct 2026 13:20:05 +0200
Message-ID: <20261002112005.20656-1-roger@xenproject.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Grygorii Strashko <grygorii_strashko@epam.com>

The arch_init_idle_domain() initializes struct arch_csw idle_csw as:

    static const struct arch_csw idle_csw = {
        .from = paravirt_ctxt_switch_from,
        .to   = paravirt_ctxt_switch_to,
        .tail = idle_loop,
    };

but only place where d->arch.ctxt_switch->{to,from}() are used is
__context_switch() where they are both guarded by !is_idle_domain(pd)
which makes the callbacks in idle_csw unreachable.

Introduce a new poison value to be used in unreachable function hooks, and
set the from/to fields of idle_csw to it.  Use a different value from the
currently defined ones for easy differentiation.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
Changes since v1:
 - Introduce and use a poison value instead of the implicit NULL.
---
 xen/arch/x86/domain.c             | 4 ++--
 xen/arch/x86/include/asm/config.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 996b50af7a17..6ebe6c5052b3 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -813,8 +813,8 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
 void __init arch_init_idle_domain(struct domain *d)
 {
     static const struct arch_csw idle_csw = {
-        .from = paravirt_ctxt_switch_from,
-        .to   = paravirt_ctxt_switch_to,
+        .from = FUNCTION_POISON,
+        .to   = FUNCTION_POISON,
         .tail = idle_loop,
     };
 
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index 1b28349a427b..bf82cd082a59 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -56,6 +56,9 @@
 #define LIST_POISON1  ((void *)0x0100100100100100UL)
 #define LIST_POISON2  ((void *)0x0200200200200200UL)
 
+/* Poison unreachable function hooks with a non-canonical value. */
+#define FUNCTION_POISON ((void *)0xDEAD0000DEAD0000UL)
+
 #include <xen/const.h>
 
 #define PML4_ENTRY_BITS  39
-- 
2.55.0


