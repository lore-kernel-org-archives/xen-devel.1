Return-Path: <SRS0=UuSr=GI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23181C433DB
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 13:13:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBD62229EF
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 13:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBD62229EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61957.109338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm9d-0001LV-Vi; Tue, 05 Jan 2021 13:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61957.109338; Tue, 05 Jan 2021 13:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm9d-0001LN-SI; Tue, 05 Jan 2021 13:13:41 +0000
Received: by outflank-mailman (input) for mailman id 61957;
 Tue, 05 Jan 2021 13:13:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwm9c-0001L8-PG
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:13:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c49a128-2675-456b-b0b9-d76613176ff5;
 Tue, 05 Jan 2021 13:13:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 187A7AD0B;
 Tue,  5 Jan 2021 13:13:39 +0000 (UTC)
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
X-Inumbo-ID: 4c49a128-2675-456b-b0b9-d76613176ff5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609852419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i0iR9T+v1oRO5cV/yOQIxjLak6wuwlTEYG8DgBkHRfU=;
	b=U/NgrQmha+c6v2GjumcztMfuvr2RzgMPN9qvhrTD8ZQCI7CniP5hmEtwO/D2NX5J161Uys
	j/z4TuqGC1h+KAnivB/z7/UZnyWHW/7TzTFR+v+XqBrqIRDcszjtwPWEu3txiirjkahk9q
	8xPTI7MuW07X/xP/0YCNXY93SSn2ylY=
Subject: [PATCH v4 10/10] evtchn: drop acquiring of per-channel lock from
 send_guest_{global,vcpu}_virq()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
Message-ID: <a6691e97-611e-ac7a-5b1a-172aaae5e9ed@suse.com>
Date: Tue, 5 Jan 2021 14:13:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The per-vCPU virq_lock, which is being held anyway, together with there
not being any call to evtchn_port_set_pending() when v->virq_to_evtchn[]
is zero, provide sufficient guarantees. Undo the lock addition done for
XSA-343 (commit e045199c7c9c "evtchn: address races with
evtchn_reset()"). Update the description next to struct evtchn_port_ops
accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Move to end of series, for being the most controversial change.
v3: Re-base.
v2: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -863,7 +863,6 @@ void send_guest_vcpu_virq(struct vcpu *v
     unsigned long flags;
     int port;
     struct domain *d;
-    struct evtchn *chn;
 
     ASSERT(!virq_is_global(virq));
 
@@ -874,12 +873,7 @@ void send_guest_vcpu_virq(struct vcpu *v
         goto out;
 
     d = v->domain;
-    chn = evtchn_from_port(d, port);
-    if ( evtchn_read_trylock(chn) )
-    {
-        evtchn_port_set_pending(d, v->vcpu_id, chn);
-        evtchn_read_unlock(chn);
-    }
+    evtchn_port_set_pending(d, v->vcpu_id, evtchn_from_port(d, port));
 
  out:
     read_unlock_irqrestore(&v->virq_lock, flags);
@@ -908,11 +902,7 @@ void send_guest_global_virq(struct domai
         goto out;
 
     chn = evtchn_from_port(d, port);
-    if ( evtchn_read_trylock(chn) )
-    {
-        evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
-        evtchn_read_unlock(chn);
-    }
+    evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
 
  out:
     read_unlock_irqrestore(&v->virq_lock, flags);
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -193,9 +193,16 @@ int evtchn_reset(struct domain *d, bool
  * Low-level event channel port ops.
  *
  * All hooks have to be called with a lock held which prevents the channel
- * from changing state. This may be the domain event lock, the per-channel
- * lock, or in the case of sending interdomain events also the other side's
- * per-channel lock. Exceptions apply in certain cases for the PV shim.
+ * from changing state. This may be
+ * - the domain event lock,
+ * - the per-channel lock,
+ * - in the case of sending interdomain events the other side's per-channel
+ *   lock,
+ * - in the case of sending non-global vIRQ-s the per-vCPU virq_lock (in
+ *   combination with the ordering enforced through how the vCPU's
+ *   virq_to_evtchn[] gets updated),
+ * - in the case of sending global vIRQ-s vCPU 0's virq_lock.
+ * Exceptions apply in certain cases for the PV shim.
  */
 struct evtchn_port_ops {
     void (*init)(struct domain *d, struct evtchn *evtchn);


