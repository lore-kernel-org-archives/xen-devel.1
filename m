Return-Path: <SRS0=TJt3=KC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E677C433ED
	for <xen-devel@archiver.kernel.org>; Fri,  7 May 2021 09:20:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3B84613C0
	for <xen-devel@archiver.kernel.org>; Fri,  7 May 2021 09:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3B84613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.123893.233756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leweU-0005BG-KA; Fri, 07 May 2021 09:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123893.233756; Fri, 07 May 2021 09:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leweU-0005B9-Gt; Fri, 07 May 2021 09:20:06 +0000
Received: by outflank-mailman (input) for mailman id 123893;
 Fri, 07 May 2021 09:20:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rJTn=KC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leweT-000575-HB
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 09:20:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4fdd598-9783-4bc4-90bf-7f8ed22ed8f9;
 Fri, 07 May 2021 09:20:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0B59FAF26;
 Fri,  7 May 2021 09:20:04 +0000 (UTC)
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
X-Inumbo-ID: a4fdd598-9783-4bc4-90bf-7f8ed22ed8f9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620379204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zvDMYiChOJui9Rp1r0kGRrMB0y61WeFkYTxR3fddviI=;
	b=k/JzqFRq6lFQ++Q4xBvyTvtHpA6GxiUlR25CXW8VHYwwtfXAfaYXNUePqqbiFJ+1Aqjh+I
	PZH/CspRRB29n8jpO8GeViTlURxWxT3C/AjCNvlVkcLFrWjTTt/HLV7+qHe284L3tEjsDn
	KQk3kcRZ8/IdPHZ39NJrmZz5HQ0wewE=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Argo/XSM: add SILO hooks
Message-ID: <f47a6aa0-3624-5819-2e3a-43c5e492ae1b@suse.com>
Date: Fri, 7 May 2021 11:20:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In SILO mode restrictions for inter-domain communication should apply
here along the lines of those for evtchn and gnttab.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Really I was first thinking about the shim: Shouldn't that proxy argo
requests just like it does for gnttab ones? It only then occurred to me
that there's also an implication for SILO mode.

--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -81,12 +81,35 @@ static int silo_grant_copy(struct domain
     return -EPERM;
 }
 
+#ifdef CONFIG_ARGO
+
+static int silo_argo_register_single_source(const struct domain *d1,
+                                            const struct domain *d2)
+{
+    if ( silo_mode_dom_check(d1, d2) )
+        return xsm_argo_register_single_source(d1, d2);
+    return -EPERM;
+}
+
+static int silo_argo_send(const struct domain *d1, const struct domain *d2)
+{
+    if ( silo_mode_dom_check(d1, d2) )
+        return xsm_argo_send(d1, d2);
+    return -EPERM;
+}
+
+#endif
+
 static struct xsm_operations silo_xsm_ops = {
     .evtchn_unbound = silo_evtchn_unbound,
     .evtchn_interdomain = silo_evtchn_interdomain,
     .grant_mapref = silo_grant_mapref,
     .grant_transfer = silo_grant_transfer,
     .grant_copy = silo_grant_copy,
+#ifdef CONFIG_ARGO
+    .argo_register_single_source = silo_argo_register_single_source,
+    .argo_send = silo_argo_send,
+#endif
 };
 
 void __init silo_init(void)

