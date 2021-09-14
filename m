Return-Path: <SRS0=GvD8=OE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B600C433EF
	for <xen-devel@archiver.kernel.org>; Tue, 14 Sep 2021 12:36:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4445F6103B
	for <xen-devel@archiver.kernel.org>; Tue, 14 Sep 2021 12:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4445F6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.186544.335307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7fc-0007yo-4x; Tue, 14 Sep 2021 12:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186544.335307; Tue, 14 Sep 2021 12:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7fc-0007yc-1U; Tue, 14 Sep 2021 12:36:16 +0000
Received: by outflank-mailman (input) for mailman id 186544;
 Tue, 14 Sep 2021 12:36:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8exS=OE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mQ7fa-00070M-Gg
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 12:36:14 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0816215a-03ed-47af-b250-f3bce5de19ac;
 Tue, 14 Sep 2021 12:36:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7F8F9220E7;
 Tue, 14 Sep 2021 12:36:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3637413342;
 Tue, 14 Sep 2021 12:36:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EHaWCzOXQGE7MAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Sep 2021 12:36:03 +0000
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
X-Inumbo-ID: 0816215a-03ed-47af-b250-f3bce5de19ac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631622963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gmpX0RV1KtNAd1QGZZ8I7TEoSv8qu+7eNCb6tbvk9tE=;
	b=h3Z9wwfBYUyrkUqm9vPejr3MHUGnNFISxmcAAQEWYJ+PVYI2Kgz35r4YNLWCzXkrGniN+M
	xSYPhZUr/BRnzTiRUxqfDi1GGHoTGCwpwyzQTb1P66bZQGIcwDB4/YBC1SDQN7S9G0MmVH
	6uoW9xA8LX7E/2V1Lfu1AiSvVSalaLs=
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
Subject: [PATCH RFC 2/4] xen: add bitmap to indicate per-domain state changes
Date: Tue, 14 Sep 2021 14:35:58 +0200
Message-Id: <20210914123600.1626-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210914123600.1626-1-jgross@suse.com>
References: <20210914123600.1626-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a bitmap with one bit per possible domid indicating the respective
domain has changed its state (created, deleted, dying, crashed,
shutdown).

Registering the VIRQ_DOM_EXC event will result in setting the bits for
all existing domains and resetting all other bits.

Resetting a bit will be done in a future patch.

This information is needed for Xenstore to keep track of all domains.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/domain.c        | 22 ++++++++++++++++++++++
 xen/common/event_channel.c |  2 ++
 xen/include/xen/sched.h    |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 755349b93f..14a427e2ef 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -87,6 +87,22 @@ bool __read_mostly vmtrace_available;
 /* Unique domain identifier, protected by domctl lock. */
 static uint64_t unique_id;
 
+static DECLARE_BITMAP(dom_state_changed, DOMID_MASK + 1);
+
+void domain_reset_states(void)
+{
+    struct domain *d;
+
+    bitmap_zero(dom_state_changed, DOMID_MASK + 1);
+
+    rcu_read_lock(&domlist_read_lock);
+
+    for_each_domain ( d )
+        set_bit(d->domain_id, dom_state_changed);
+
+    rcu_read_unlock(&domlist_read_lock);
+}
+
 static void __domain_finalise_shutdown(struct domain *d)
 {
     struct vcpu *v;
@@ -101,6 +117,7 @@ static void __domain_finalise_shutdown(struct domain *d)
             return;
 
     d->is_shut_down = 1;
+    set_bit(d->domain_id, dom_state_changed);
     if ( (d->shutdown_code == SHUTDOWN_suspend) && d->suspend_evtchn )
         evtchn_send(d, d->suspend_evtchn);
     else
@@ -720,6 +737,8 @@ struct domain *domain_create(domid_t domid,
         rcu_assign_pointer(domain_hash[DOMAIN_HASH(domid)], d);
         spin_unlock(&domlist_update_lock);
 
+        set_bit(d->domain_id, dom_state_changed);
+
         memcpy(d->handle, config->handle, sizeof(d->handle));
     }
 
@@ -954,6 +973,7 @@ int domain_kill(struct domain *d)
         /* Mem event cleanup has to go here because the rings 
          * have to be put before we call put_domain. */
         vm_event_cleanup(d);
+        set_bit(d->domain_id, dom_state_changed);
         put_domain(d);
         send_global_virq(VIRQ_DOM_EXC);
         /* fallthrough */
@@ -1141,6 +1161,8 @@ static void complete_domain_destroy(struct rcu_head *head)
 
     xfree(d->vcpu);
 
+    set_bit(d->domain_id, dom_state_changed);
+
     _domain_destroy(d);
 
     send_global_virq(VIRQ_DOM_EXC);
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index da88ad141a..e2a416052b 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1218,6 +1218,8 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = evtchn_bind_virq(&bind_virq, 0);
         if ( !rc && __copy_to_guest(arg, &bind_virq, 1) )
             rc = -EFAULT; /* Cleaning up here would be a mess! */
+        if ( !rc && bind_virq.virq == VIRQ_DOM_EXC )
+            domain_reset_states();
         break;
     }
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index b827c5af8d..2ae26bc50e 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -730,6 +730,8 @@ void domain_resume(struct domain *d);
 
 int domain_soft_reset(struct domain *d, bool resuming);
 
+void domain_reset_states(void);
+
 int vcpu_start_shutdown_deferral(struct vcpu *v);
 void vcpu_end_shutdown_deferral(struct vcpu *v);
 
-- 
2.26.2


