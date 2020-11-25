Return-Path: <SRS0=CtBx=E7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19904C6379D
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 10:51:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B74220678
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 10:51:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="nSnC7kr6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B74220678
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.37538.69977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khsOf-0007Hf-BP; Wed, 25 Nov 2020 10:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37538.69977; Wed, 25 Nov 2020 10:51:37 +0000
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
	id 1khsOf-0007HU-86; Wed, 25 Nov 2020 10:51:37 +0000
Received: by outflank-mailman (input) for mailman id 37538;
 Wed, 25 Nov 2020 10:51:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X3kr=E7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1khsOd-00078P-O7
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 10:51:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ca0cb6e-32be-44dd-8153-fbc6d1ce5e33;
 Wed, 25 Nov 2020 10:51:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EE96EADAA;
 Wed, 25 Nov 2020 10:51:24 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X3kr=E7=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1khsOd-00078P-O7
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 10:51:35 +0000
X-Inumbo-ID: 5ca0cb6e-32be-44dd-8153-fbc6d1ce5e33
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5ca0cb6e-32be-44dd-8153-fbc6d1ce5e33;
	Wed, 25 Nov 2020 10:51:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606301485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PpgH835OJv8kLqZm+CjGqtlbK0CvTiSkCJEinT/4/4A=;
	b=nSnC7kr60X/sBbqFE000ZLKQyFQTvBtUKu2x/AGj7aChXmOIUTrpitVGUMYf+LK5+wx4LX
	PmYEtXQxYijVS4vIGSlBoqa/nQGy0EI+2OCUUxpMCU8eRv16ribc9X/UynAbwbPvyHblkR
	ypynLSaQOuv7STlzVZTQP9pDEY5w7r8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EE96EADAA;
	Wed, 25 Nov 2020 10:51:24 +0000 (UTC)
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
Subject: [PATCH v8 3/3] xen/events: do some cleanups in evtchn_fifo_set_pending()
Date: Wed, 25 Nov 2020 11:51:22 +0100
Message-Id: <20201125105122.3650-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201125105122.3650-1-jgross@suse.com>
References: <20201125105122.3650-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

evtchn_fifo_set_pending() can be simplified a little bit.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V8:
- new patch
---
 xen/common/event_fifo.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index 443593c3b3..77609539b1 100644
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -175,6 +175,18 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
         return;
     }
 
+    /*
+     * Control block not mapped.  The guest must not unmask an
+     * event until the control block is initialized, so we can
+     * just drop the event.
+     */
+    if ( unlikely(!v->evtchn_fifo->control_block) )
+    {
+        printk(XENLOG_G_WARNING
+               "%pv has no FIFO event channel control block\n", v);
+        return;
+    }
+
     /*
      * Lock all queues related to the event channel (in case of a queue change
      * this might be two).
@@ -233,25 +245,8 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
      * Link the event if it unmasked and not already linked.
      */
     if ( !guest_test_bit(d, EVTCHN_FIFO_MASKED, word) &&
-         !guest_test_bit(d, EVTCHN_FIFO_LINKED, word) )
+         !guest_test_and_set_bit(d, EVTCHN_FIFO_LINKED, word) )
     {
-        event_word_t *tail_word;
-
-        /*
-         * Control block not mapped.  The guest must not unmask an
-         * event until the control block is initialized, so we can
-         * just drop the event.
-         */
-        if ( unlikely(!v->evtchn_fifo->control_block) )
-        {
-            printk(XENLOG_G_WARNING
-                   "%pv has no FIFO event channel control block\n", v);
-            goto unlock;
-        }
-
-        if ( guest_test_and_set_bit(d, EVTCHN_FIFO_LINKED, word) )
-            goto unlock;
-
         /*
          * If this event was a tail, the old queue is now empty and
          * its tail must be invalidated to prevent adding an event to
@@ -286,6 +281,8 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
         linked = false;
         if ( q->tail )
         {
+            event_word_t *tail_word;
+
             tail_word = evtchn_fifo_word_from_port(d, q->tail);
             linked = evtchn_fifo_set_link(d, tail_word, port);
         }
@@ -294,7 +291,6 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
         q->tail = port;
     }
 
- unlock:
     if ( q != old_q )
         spin_unlock(&old_q->lock);
     spin_unlock_irqrestore(&q->lock, flags);
-- 
2.26.2


