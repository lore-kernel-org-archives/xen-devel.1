Return-Path: <SRS0=M+rI=D3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE945C388F7
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 14:09:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FDB222251
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 14:09:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ABtTjs/u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FDB222251
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.9656.25393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUsKe-00011A-1X; Tue, 20 Oct 2020 14:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9656.25393; Tue, 20 Oct 2020 14:09:44 +0000
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
	id 1kUsKd-000113-UX; Tue, 20 Oct 2020 14:09:43 +0000
Received: by outflank-mailman (input) for mailman id 9656;
 Tue, 20 Oct 2020 14:09:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUsKc-00010e-Sl
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:09:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4aa5e11a-d135-4517-803f-299d1505e455;
 Tue, 20 Oct 2020 14:09:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B998AE09;
 Tue, 20 Oct 2020 14:09:41 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUsKc-00010e-Sl
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:09:42 +0000
X-Inumbo-ID: 4aa5e11a-d135-4517-803f-299d1505e455
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4aa5e11a-d135-4517-803f-299d1505e455;
	Tue, 20 Oct 2020 14:09:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603202981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d1Xj/MOkNyuR81WgrEVOpCecqLMBcdoOGGhlDIYqrtI=;
	b=ABtTjs/uCyAQcnAUmVNC3t0s5n+GxoseUj44OjY9cG1LrB4T8wd1kCjlfyoY6KOM0+ts/z
	V7SUIXkHo86kMmmkMMhP4YDd8XNUwFVGnNf78ebRU3qfdv4U3jlUTOUdOtEddiOxb+RJhX
	+UExkW06BSjjDafAZyTEXLp/MNHtRD0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6B998AE09;
	Tue, 20 Oct 2020 14:09:41 +0000 (UTC)
Subject: [PATCH v2 4/8] evtchn: let evtchn_set_priority() acquire the
 per-channel lock
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
Message-ID: <266c9178-700b-5663-4b5f-69f160a165ab@suse.com>
Date: Tue, 20 Oct 2020 16:09:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Some lock wants to be held to make sure the port doesn't change state,
but there's no point holding the per-domain event lock here. Switch to
using the finer grained per-channel lock instead.

FAOD this doesn't guarantee anything towards in particular
evtchn_fifo_set_pending(), as for interdomain channels that function
would be called with the remote side's per-channel lock held.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Drop acquiring of event lock. Re-write title and description.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1154,20 +1154,17 @@ static long evtchn_set_priority(const st
 {
     struct domain *d = current->domain;
     unsigned int port = set_priority->port;
+    struct evtchn *chn;
     long ret;
-
-    spin_lock(&d->event_lock);
+    unsigned long flags;
 
     if ( !port_is_valid(d, port) )
-    {
-        spin_unlock(&d->event_lock);
         return -EINVAL;
-    }
-
-    ret = evtchn_port_set_priority(d, evtchn_from_port(d, port),
-                                   set_priority->priority);
 
-    spin_unlock(&d->event_lock);
+    chn = evtchn_from_port(d, port);
+    spin_lock_irqsave(&chn->lock, flags);
+    ret = evtchn_port_set_priority(d, chn, set_priority->priority);
+    spin_unlock_irqrestore(&chn->lock, flags);
 
     return ret;
 }


