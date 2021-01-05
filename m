Return-Path: <SRS0=UuSr=GI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8BBC433DB
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 13:24:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9165522AAC
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 13:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9165522AAC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61977.109389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmKR-0002kd-0l; Tue, 05 Jan 2021 13:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61977.109389; Tue, 05 Jan 2021 13:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmKQ-0002kW-T9; Tue, 05 Jan 2021 13:24:50 +0000
Received: by outflank-mailman (input) for mailman id 61977;
 Tue, 05 Jan 2021 13:24:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwmKP-0002kP-Vr
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:24:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0704df83-847e-42cb-abba-053eae35ca80;
 Tue, 05 Jan 2021 13:24:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D721AD0B;
 Tue,  5 Jan 2021 13:24:48 +0000 (UTC)
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
X-Inumbo-ID: 0704df83-847e-42cb-abba-053eae35ca80
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609853088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xzf3n34RjXIRdOX5kcsS30euTM1Kzp9AmLREhagMPnY=;
	b=UC4DE6r/L66Umi5ReNzfi3OZwxzn9cC5AyVQtiySy7glCynG7ryWXmOcMKbq08s5hLeLRb
	g29rNB7s0BdxSbDQxkug35FIghUax9lImMkKVIH/naZAKup5+F1gk5S6NoUcbubHVXdDoU
	LC7Paj4qDF1/UX9v2MHCDktMlvBWR00=
Subject: [PATCH 2/5] evtchn: don't pointlessly use get_domain()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com>
Message-ID: <1f9448ac-7889-3cfb-e136-d8c37f63279c@suse.com>
Date: Tue, 5 Jan 2021 14:24:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

For short-lived references rcu_lock_domain() is the better (slightly
cheaper) alternative.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -642,7 +642,7 @@ int evtchn_close(struct domain *d1, int
              */
             write_unlock(&chn1->lock);
             write_unlock(&chn2->lock);
-            put_domain(d2);
+            rcu_unlock_domain(d2);
             chn2 = NULL;
         }
 
@@ -677,7 +677,7 @@ int evtchn_close(struct domain *d1, int
              */
             write_unlock(&chn1->lock);
             write_unlock(&chn2->lock);
-            put_domain(d2);
+            rcu_unlock_domain(d2);
             chn2 = NULL;
         }
 
@@ -725,9 +725,8 @@ int evtchn_close(struct domain *d1, int
 
         if ( !chn2 )
         {
-            /* If we unlock chn1 then we could lose d2. Must get a reference. */
-            if ( unlikely(!get_domain(d2)) )
-                BUG();
+            /* If we unlock chn1 then we could lose d2. */
+            rcu_lock_domain(d2);
 
             chn2 = _evtchn_from_port(d2, chn1->u.interdomain.remote_port);
             BUG_ON(!chn2);
@@ -778,7 +777,7 @@ int evtchn_close(struct domain *d1, int
          */
         write_unlock(&chn1->lock);
         write_unlock(&chn2->lock);
-        put_domain(d2);
+        rcu_unlock_domain(d2);
     }
 
     write_unlock(&d1->event_lock);


