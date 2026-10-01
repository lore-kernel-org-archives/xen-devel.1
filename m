Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B77CA5FCB
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 14:28:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438411.1657249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCHla-0003vA-Of; Thu, 01 Oct 2026 14:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438411.1657249; Thu, 01 Oct 2026 14:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCHla-0003v3-M1; Thu, 01 Oct 2026 14:28:10 +0000
Received: by outflank-mailman (input) for mailman id 1438411;
 Thu, 01 Oct 2026 14:28:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xCHlZ-0003uw-I3
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 14:28:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xCHlY-009ShJ-24;
 Thu, 01 Oct 2026 14:28:09 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xCHlY-003pfC-1q;
 Thu, 01 Oct 2026 14:28:09 +0000
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
	bh=1QxjtvUklegWRfBANHigZ/YREbPg51Bp8Po4VD0WCg0=; b=WbTKhTcywiEDiH2oNhMrI/XtQ1
	Gr0QQQDY1OYw+Y5Otd66+i+7pO7SyDck3684YanG6x7CL4oOLLk0/5lmnsQisLIswvu5J6PLGcR8W
	uI/zEPHR41Yof3WhsaSG9n9kpeFH7KKgyN0Y8Pqsh0a728wc2759gcchPeQxpMHbzwgo=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/domain: restrict context switch hooks for the idle domain
Date: Thu,  1 Oct 2026 16:27:57 +0200
Message-ID: <20261001142757.98255-1-roger@xenproject.org>
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

Drop to/from() callbacks initialization in idle_csw.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
I don't think there's a suitable Fixes candidate here.  The idle domain
hooks used to piggyback on the PV ones, and commit ab914e04a6272 split
those out into it's own structure.  At that point the to/from hooks could
have been left zeroed, but that wasn't the point of that commit anyway.
---
 xen/arch/x86/domain.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 996b50af7a17..464ca6f39026 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -813,8 +813,6 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
 void __init arch_init_idle_domain(struct domain *d)
 {
     static const struct arch_csw idle_csw = {
-        .from = paravirt_ctxt_switch_from,
-        .to   = paravirt_ctxt_switch_to,
         .tail = idle_loop,
     };
 
-- 
2.55.0


