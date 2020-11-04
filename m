Return-Path: <SRS0=nsPS=EK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CACC2D0A3
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2020 08:16:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3D3A22384
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2020 08:16:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="TA0qCEfg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3D3A22384
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.18838.43886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaDxd-0000Zs-KM; Wed, 04 Nov 2020 08:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18838.43886; Wed, 04 Nov 2020 08:16:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaDxd-0000Zk-Gl; Wed, 04 Nov 2020 08:16:05 +0000
Received: by outflank-mailman (input) for mailman id 18838;
 Wed, 04 Nov 2020 08:16:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Coh=EK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kaDxb-0000Pk-Vi
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 08:16:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9db5219b-9832-4dda-9a2e-46059e9e7c38;
 Wed, 04 Nov 2020 08:15:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA7DEACC6;
 Wed,  4 Nov 2020 08:15:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2Coh=EK=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kaDxb-0000Pk-Vi
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 08:16:04 +0000
X-Inumbo-ID: 9db5219b-9832-4dda-9a2e-46059e9e7c38
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 9db5219b-9832-4dda-9a2e-46059e9e7c38;
	Wed, 04 Nov 2020 08:15:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604477751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X4N92E0t7NY8cFsFrRFhreEx/aHGKkH4ttPqzLqhrP0=;
	b=TA0qCEfg66+8vkDgjK6jJWLh9gwYmrr0METgNIVpEsr55+7OnQ0pkhihTDXnPbynRX4C13
	MYySK5w1UrVlhhKfFpz3NLdoMCMDci8QlwUm1hvahwCzlpFT/yrj0xjnJMFgysPmoEvNHp
	lQ3TDSMNoyA+bl3Du3cjZ26C/fhxOWY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BA7DEACC6;
	Wed,  4 Nov 2020 08:15:51 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/3] xen/locking: harmonize spinlocks and rwlocks regarding preemption
Date: Wed,  4 Nov 2020 09:15:48 +0100
Message-Id: <20201104081549.3712-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201104081549.3712-1-jgross@suse.com>
References: <20201104081549.3712-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Spinlocks and rwlocks behave differently in the try variants regarding
preemption: rwlocks are switching preemption off before testing the
lock, while spinlocks do so only after the first check.

Modify _spin_trylock() to disable preemption before testing the lock
to be held in order to be preemption-ready.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 xen/common/spinlock.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index b4aaf6bce6..f4eb50f030 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -240,13 +240,16 @@ int _spin_trylock(spinlock_t *lock)
 {
     spinlock_tickets_t old, new;
 
+    preempt_disable();
     check_lock(&lock->debug, true);
     old = observe_lock(&lock->tickets);
     if ( old.head != old.tail )
+    {
+        preempt_enable();
         return 0;
+    }
     new = old;
     new.tail++;
-    preempt_disable();
     if ( cmpxchg(&lock->tickets.head_tail,
                  old.head_tail, new.head_tail) != old.head_tail )
     {
-- 
2.26.2


