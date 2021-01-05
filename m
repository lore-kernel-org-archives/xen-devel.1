Return-Path: <SRS0=UuSr=GI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA85AC433DB
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 13:11:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B15D322AAB
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 13:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B15D322AAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61933.109266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm72-0000cj-0f; Tue, 05 Jan 2021 13:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61933.109266; Tue, 05 Jan 2021 13:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm71-0000cb-TB; Tue, 05 Jan 2021 13:10:59 +0000
Received: by outflank-mailman (input) for mailman id 61933;
 Tue, 05 Jan 2021 13:10:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwm70-0000cN-E7
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:10:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5190937a-7794-4f92-9f35-f5c64e46d221;
 Tue, 05 Jan 2021 13:10:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CB268AD19;
 Tue,  5 Jan 2021 13:10:56 +0000 (UTC)
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
X-Inumbo-ID: 5190937a-7794-4f92-9f35-f5c64e46d221
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609852256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WYw+EB7EgwhVs6MDF2yGE+1uRpPa0Jl4jtg0PCVk0Do=;
	b=qZwC+VpA5/LtIGrkqgxsYzczsILaiK6KVG2tDa5YKpVEgrmgSOdiwvC5/jP6nJKIVEEmV9
	R4lpelj88dUAzzrxR4d8EnyyiSItNGpoPFQbtkPhjU1aEgVbU8fP0YSBCGga3RfoyPUauc
	08SBXYCDcejVUJNDEX8BTkvkg4Uwi+Q=
Subject: [PATCH v4 05/10] evtchn: closing of vIRQ-s doesn't require looping
 over all vCPU-s
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
Message-ID: <ec877ae4-508e-6734-eae6-f3590021b712@suse.com>
Date: Tue, 5 Jan 2021 14:10:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Global vIRQ-s have their event channel association tracked on vCPU 0.
Per-vCPU vIRQ-s can't have their notify_vcpu_id changed. Hence it is
well-known which vCPU's virq_to_evtchn[] needs updating.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -600,7 +600,6 @@ static long evtchn_bind_pirq(evtchn_bind
 int evtchn_close(struct domain *d1, int port1, bool guest)
 {
     struct domain *d2 = NULL;
-    struct vcpu   *v;
     struct evtchn *chn1, *chn2;
     int            port2;
     long           rc = 0;
@@ -651,17 +650,19 @@ int evtchn_close(struct domain *d1, int
         break;
     }
 
-    case ECS_VIRQ:
-        for_each_vcpu ( d1, v )
-        {
-            unsigned long flags;
+    case ECS_VIRQ: {
+        struct vcpu *v;
+        unsigned long flags;
+
+        v = d1->vcpu[virq_is_global(chn1->u.virq) ? 0 : chn1->notify_vcpu_id];
+
+        write_lock_irqsave(&v->virq_lock, flags);
+        ASSERT(read_atomic(&v->virq_to_evtchn[chn1->u.virq]) == port1);
+        write_atomic(&v->virq_to_evtchn[chn1->u.virq], 0);
+        write_unlock_irqrestore(&v->virq_lock, flags);
 
-            write_lock_irqsave(&v->virq_lock, flags);
-            if ( read_atomic(&v->virq_to_evtchn[chn1->u.virq]) == port1 )
-                write_atomic(&v->virq_to_evtchn[chn1->u.virq], 0);
-            write_unlock_irqrestore(&v->virq_lock, flags);
-        }
         break;
+    }
 
     case ECS_IPI:
         break;


