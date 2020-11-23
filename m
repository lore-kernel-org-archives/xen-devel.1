Return-Path: <SRS0=yIb1=E5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191D2C2D0E4
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 13:30:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90143206E3
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 13:30:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="BG9k2RjR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90143206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.34300.65245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBvI-0000HT-Tm; Mon, 23 Nov 2020 13:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34300.65245; Mon, 23 Nov 2020 13:30:28 +0000
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
	id 1khBvI-0000HL-Qf; Mon, 23 Nov 2020 13:30:28 +0000
Received: by outflank-mailman (input) for mailman id 34300;
 Mon, 23 Nov 2020 13:30:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khBvI-0000HE-0F
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:30:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 287d2545-a77c-426f-8d65-7c70bb0fa7d7;
 Mon, 23 Nov 2020 13:30:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5CD23AF16;
 Mon, 23 Nov 2020 13:30:26 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khBvI-0000HE-0F
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:30:28 +0000
X-Inumbo-ID: 287d2545-a77c-426f-8d65-7c70bb0fa7d7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 287d2545-a77c-426f-8d65-7c70bb0fa7d7;
	Mon, 23 Nov 2020 13:30:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606138226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jt0BkRlKG8ZX6o9qxDhFaVFYDZdwpFBoupgoJURDZ8=;
	b=BG9k2RjRcZu8KM66M5gYSdqbg/ZJjaxOQBOZ1vp66TrSez4PyekKHZ4NKfM6EnVGUa1+kI
	8wZSo+8viK66yeY0eBzxSnMbVbwtVlJSdKHbPWURRT0cARKTGaq8IomDc3aB64DgbG9hoH
	JEoVOivGheiKmUT1htOCisPPxKpxh4s=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5CD23AF16;
	Mon, 23 Nov 2020 13:30:26 +0000 (UTC)
Subject: [PATCH v3 5/5] evtchn: don't call Xen consumer callback with
 per-channel lock held
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <lengyelt@ainfosec.com>,
 Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
Message-ID: <d821c715-966a-b48b-a877-c5dac36822f0@suse.com>
Date: Mon, 23 Nov 2020 14:30:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While there don't look to be any problems with this right now, the lock
order implications from holding the lock can be very difficult to follow
(and may be easy to violate unknowingly). The present callbacks don't
(and no such callback should) have any need for the lock to be held.

However, vm_event_disable() frees the structures used by respective
callbacks and isn't otherwise synchronized with invocations of these
callbacks, so maintain a count of in-progress calls, for evtchn_close()
to wait to drop to zero before freeing the port (and dropping the lock).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Should we make this accounting optional, to be requested through a new
parameter to alloc_unbound_xen_event_channel(), or derived from other
than the default callback being requested?
---
v3: Drain callbacks before proceeding with closing. Re-base.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -397,6 +397,7 @@ static long evtchn_bind_interdomain(evtc
     
     rchn->u.interdomain.remote_dom  = ld;
     rchn->u.interdomain.remote_port = lport;
+    atomic_set(&rchn->u.interdomain.active_calls, 0);
     rchn->state                     = ECS_INTERDOMAIN;
 
     /*
@@ -720,6 +721,10 @@ int evtchn_close(struct domain *d1, int
 
         double_evtchn_lock(chn1, chn2);
 
+        if ( consumer_is_xen(chn1) )
+            while ( atomic_read(&chn1->u.interdomain.active_calls) )
+                cpu_relax();
+
         evtchn_free(d1, chn1);
 
         chn2->state = ECS_UNBOUND;
@@ -781,9 +786,15 @@ int evtchn_send(struct domain *ld, unsig
         rport = lchn->u.interdomain.remote_port;
         rchn  = evtchn_from_port(rd, rport);
         if ( consumer_is_xen(rchn) )
+        {
+            /* Don't keep holding the lock for the call below. */
+            atomic_inc(&rchn->u.interdomain.active_calls);
+            evtchn_read_unlock(lchn);
             xen_notification_fn(rchn)(rd->vcpu[rchn->notify_vcpu_id], rport);
-        else
-            evtchn_port_set_pending(rd, rchn->notify_vcpu_id, rchn);
+            atomic_dec(&rchn->u.interdomain.active_calls);
+            return 0;
+        }
+        evtchn_port_set_pending(rd, rchn->notify_vcpu_id, rchn);
         break;
     case ECS_IPI:
         evtchn_port_set_pending(ld, lchn->notify_vcpu_id, lchn);
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -104,6 +104,7 @@ struct evtchn
         } unbound;     /* state == ECS_UNBOUND */
         struct {
             evtchn_port_t  remote_port;
+            atomic_t       active_calls;
             struct domain *remote_dom;
         } interdomain; /* state == ECS_INTERDOMAIN */
         struct {


