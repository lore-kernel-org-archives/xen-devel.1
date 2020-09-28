Return-Path: <SRS0=Jb4W=DF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0E3C2D0A8
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 11:00:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F0D32074F
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 11:00:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="hXL/yJOo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F0D32074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMqt3-0005A5-7i; Mon, 28 Sep 2020 11:00:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMqt2-00051E-7k
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 11:00:04 +0000
X-Inumbo-ID: 16044122-9a3f-4be3-aa42-7528e02c1c0d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16044122-9a3f-4be3-aa42-7528e02c1c0d;
 Mon, 28 Sep 2020 11:00:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601290802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A+5Stl0rmqhXhbs7D3G+1NwS1Mh9/voMzMez3S4+mu8=;
 b=hXL/yJOotVbgPrTfvoOP41zdArxO4ahxUVJiXDAFvF6dSbVcUSlLFapdUBGSTIAXxHnEYl
 Qn9ThH3rsV0VdHgXMuVma4oTsBAMrJ+ObPSPMsMIAwG5wPadZbQ0ItQjZVr63bBdoabIjZ
 H7Xms+O9Uk2++29LErYL9G7Z+KrHCeo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D813B012;
 Mon, 28 Sep 2020 11:00:02 +0000 (UTC)
Subject: [PATCH 07/12] evtchn: cut short evtchn_reset()'s loop in the common
 case
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Message-ID: <0577c62d-b349-6a60-d8bc-5b23a74342e0@suse.com>
Date: Mon, 28 Sep 2020 13:00:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The general expectation is that there are only a few open ports left
when a domain asks its event channel configuration to be reset.
Similarly on average half a bucket worth of event channels can be
expected to be inactive. Try to avoid iterating over all channels, by
utilizing usage data we're maintaining anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -232,7 +232,11 @@ void evtchn_free(struct domain *d, struc
     evtchn_port_clear_pending(d, chn);
 
     if ( consumer_is_xen(chn) )
+    {
         write_atomic(&d->xen_evtchns, d->xen_evtchns - 1);
+        /* Decrement ->xen_evtchns /before/ ->active_evtchns. */
+        smp_wmb();
+    }
     write_atomic(&d->active_evtchns, d->active_evtchns - 1);
 
     /* Reset binding to vcpu0 when the channel is freed. */
@@ -1073,6 +1077,19 @@ int evtchn_unmask(unsigned int port)
     return 0;
 }
 
+static bool has_active_evtchns(const struct domain *d)
+{
+    unsigned int xen = read_atomic(&d->xen_evtchns);
+
+    /*
+     * Read ->xen_evtchns /before/ active_evtchns, to prevent
+     * evtchn_reset() exiting its loop early.
+     */
+    smp_rmb();
+
+    return read_atomic(&d->active_evtchns) > xen;
+}
+
 int evtchn_reset(struct domain *d, bool resuming)
 {
     unsigned int i;
@@ -1097,7 +1114,7 @@ int evtchn_reset(struct domain *d, bool
     if ( !i )
         return -EBUSY;
 
-    for ( ; port_is_valid(d, i); i++ )
+    for ( ; port_is_valid(d, i) && has_active_evtchns(d); i++ )
     {
         evtchn_close(d, i, 1);
 
@@ -1340,6 +1357,10 @@ int alloc_unbound_xen_event_channel(
 
     spin_unlock_irqrestore(&chn->lock, flags);
 
+    /*
+     * Increment ->xen_evtchns /after/ ->active_evtchns. No explicit
+     * barrier needed due to spin-locked region just above.
+     */
     write_atomic(&ld->xen_evtchns, ld->xen_evtchns + 1);
 
  out:


