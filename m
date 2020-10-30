Return-Path: <SRS0=Brpk=EF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57674C4363A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 14:25:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCC0220825
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 14:25:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="d6qra57G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCC0220825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.15899.39139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYVL1-0000iM-6T; Fri, 30 Oct 2020 14:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15899.39139; Fri, 30 Oct 2020 14:25:07 +0000
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
	id 1kYVL1-0000iF-3O; Fri, 30 Oct 2020 14:25:07 +0000
Received: by outflank-mailman (input) for mailman id 15899;
 Fri, 30 Oct 2020 14:25:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y1I6=EF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kYVKz-0000i7-IQ
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 14:25:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48b2fdfd-684a-4f63-a173-17789522b443;
 Fri, 30 Oct 2020 14:25:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C2C50AE1A;
 Fri, 30 Oct 2020 14:25:02 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=y1I6=EF=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kYVKz-0000i7-IQ
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 14:25:05 +0000
X-Inumbo-ID: 48b2fdfd-684a-4f63-a173-17789522b443
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 48b2fdfd-684a-4f63-a173-17789522b443;
	Fri, 30 Oct 2020 14:25:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604067902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZRO626gkCC58/+xHp5IDaonkexTsr38HffOaqWn+6/w=;
	b=d6qra57GhXRqkpVwBrQobeF5Y0zM4Ap5B7NJ7WU3E02GRIpTPb1IuJwNvOim9rda2EYzhd
	VksYmMAgpp51M6dXHfdIZ5vQlPEjv56wkYUf4YsYMdcrAetywYWxe+qZ7R6wLWYgv1gB7M
	HljXnBlOoSrUKHQN1Ojc3PnUs9B8J7k=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C2C50AE1A;
	Fri, 30 Oct 2020 14:25:02 +0000 (UTC)
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
Subject: [PATCH 2/2] xen/rwlock: add check_lock() handling to rwlocks
Date: Fri, 30 Oct 2020 15:25:00 +0100
Message-Id: <20201030142500.5464-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201030142500.5464-1-jgross@suse.com>
References: <20201030142500.5464-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checking whether a lock is consistently used regarding interrupts on
or off is beneficial for rwlocks, too.

So add check_lock() calls to rwlock functions. For this purpose make
check_lock() globally accessible.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/spinlock.c      |  3 +--
 xen/include/xen/rwlock.h   | 14 ++++++++++++++
 xen/include/xen/spinlock.h |  2 ++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 54f0c55dc2..acb3f86339 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -13,7 +13,7 @@
 
 static atomic_t spin_debug __read_mostly = ATOMIC_INIT(0);
 
-static void check_lock(union lock_debug *debug, bool try)
+void check_lock(union lock_debug *debug, bool try)
 {
     bool irq_safe = !local_irq_is_enabled();
 
@@ -108,7 +108,6 @@ void spin_debug_disable(void)
 
 #else /* CONFIG_DEBUG_LOCKS */
 
-#define check_lock(l, t) ((void)0)
 #define check_barrier(l) ((void)0)
 #define got_lock(l) ((void)0)
 #define rel_lock(l) ((void)0)
diff --git a/xen/include/xen/rwlock.h b/xen/include/xen/rwlock.h
index 427664037a..c302644705 100644
--- a/xen/include/xen/rwlock.h
+++ b/xen/include/xen/rwlock.h
@@ -65,7 +65,11 @@ static inline int _read_trylock(rwlock_t *lock)
          * arch_lock_acquire_barrier().
          */
         if ( likely(_can_read_lock(cnts)) )
+        {
+            check_lock(&lock->lock.debug, true);
             return 1;
+        }
+
         atomic_sub(_QR_BIAS, &lock->cnts);
     }
     preempt_enable();
@@ -87,7 +91,10 @@ static inline void _read_lock(rwlock_t *lock)
      * arch_lock_acquire_barrier().
      */
     if ( likely(_can_read_lock(cnts)) )
+    {
+        check_lock(&lock->lock.debug, false);
         return;
+    }
 
     /* The slowpath will decrement the reader count, if necessary. */
     queue_read_lock_slowpath(lock);
@@ -162,7 +169,10 @@ static inline void _write_lock(rwlock_t *lock)
      * arch_lock_acquire_barrier().
      */
     if ( atomic_cmpxchg(&lock->cnts, 0, _write_lock_val()) == 0 )
+    {
+        check_lock(&lock->lock.debug, false);
         return;
+    }
 
     queue_write_lock_slowpath(lock);
     /*
@@ -205,6 +215,8 @@ static inline int _write_trylock(rwlock_t *lock)
         return 0;
     }
 
+    check_lock(&lock->lock.debug, true);
+
     /*
      * atomic_cmpxchg() is a full barrier so no need for an
      * arch_lock_acquire_barrier().
@@ -328,6 +340,8 @@ static inline void _percpu_read_lock(percpu_rwlock_t **per_cpudata,
         /* Drop the read lock because we don't need it anymore. */
         read_unlock(&percpu_rwlock->rwlock);
     }
+    else
+        check_lock(&percpu_rwlock->rwlock.lock.debug, false);
 }
 
 static inline void _percpu_read_unlock(percpu_rwlock_t **per_cpudata,
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index ca13b600a0..9fa4e600c1 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -21,11 +21,13 @@ union lock_debug {
     };
 };
 #define _LOCK_DEBUG { LOCK_DEBUG_INITVAL }
+void check_lock(union lock_debug *debug, bool try);
 void spin_debug_enable(void);
 void spin_debug_disable(void);
 #else
 union lock_debug { };
 #define _LOCK_DEBUG { }
+#define check_lock(l, t) ((void)0)
 #define spin_debug_enable() ((void)0)
 #define spin_debug_disable() ((void)0)
 #endif
-- 
2.26.2


