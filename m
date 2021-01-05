Return-Path: <SRS0=UuSr=GI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9261BC433E0
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 13:12:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F43122AAB
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 13:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F43122AAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61938.109277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm7j-0000lH-AG; Tue, 05 Jan 2021 13:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61938.109277; Tue, 05 Jan 2021 13:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm7j-0000lA-7I; Tue, 05 Jan 2021 13:11:43 +0000
Received: by outflank-mailman (input) for mailman id 61938;
 Tue, 05 Jan 2021 13:11:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwm7h-0000l1-Th
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:11:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ce02c72-6601-4dca-b9ec-dd518f66e3cc;
 Tue, 05 Jan 2021 13:11:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48480AD0B;
 Tue,  5 Jan 2021 13:11:40 +0000 (UTC)
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
X-Inumbo-ID: 7ce02c72-6601-4dca-b9ec-dd518f66e3cc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609852300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jpDPxfUXwQJobIQUxX1fnLD15/1oKgv3k1efx+tAnAE=;
	b=GekgU3LU5vpUV6FglutXN4q5kx/j3iIBoLIiRKy0WPCU/DN/M00r38NLNQFCarKGUuLOAY
	c3qpjgIPdtIxIYeeLB0SNIBkiP9XMVjX57ayphoT83ZHWqfSCtY8xt+IShoDE6t8LDNu4c
	wXVyJE+iJ2cVaVeR+Kahb1ng3O+S3nM=
Subject: [PATCH v4 06/10] evtchn: slightly defer lock acquire where possible
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
Message-ID: <50d76d71-7e76-8c4d-0546-bf690085036b@suse.com>
Date: Tue, 5 Jan 2021 14:11:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

port_is_valid() and evtchn_from_port() are fine to use without holding
any locks. Accordingly acquire the per-domain lock slightly later in
evtchn_close() and evtchn_bind_vcpu().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -604,17 +604,14 @@ int evtchn_close(struct domain *d1, int
     int            port2;
     long           rc = 0;
 
- again:
-    write_lock(&d1->event_lock);
-
     if ( !port_is_valid(d1, port1) )
-    {
-        rc = -EINVAL;
-        goto out;
-    }
+        return -EINVAL;
 
     chn1 = evtchn_from_port(d1, port1);
 
+ again:
+    write_lock(&d1->event_lock);
+
     /* Guest cannot close a Xen-attached event channel. */
     if ( unlikely(consumer_is_xen(chn1)) && guest )
     {
@@ -1039,16 +1036,13 @@ long evtchn_bind_vcpu(unsigned int port,
     if ( (v = domain_vcpu(d, vcpu_id)) == NULL )
         return -ENOENT;
 
-    write_lock(&d->event_lock);
-
     if ( !port_is_valid(d, port) )
-    {
-        rc = -EINVAL;
-        goto out;
-    }
+        return -EINVAL;
 
     chn = evtchn_from_port(d, port);
 
+    write_lock(&d->event_lock);
+
     /* Guest cannot re-bind a Xen-attached event channel. */
     if ( unlikely(consumer_is_xen(chn)) )
     {


