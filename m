Return-Path: <SRS0=UuSr=GI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D086FC433E0
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 12:45:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 822F7229C5
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 12:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 822F7229C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61899.109173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlib-0005bf-23; Tue, 05 Jan 2021 12:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61899.109173; Tue, 05 Jan 2021 12:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlia-0005bY-UP; Tue, 05 Jan 2021 12:45:44 +0000
Received: by outflank-mailman (input) for mailman id 61899;
 Tue, 05 Jan 2021 12:45:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwliZ-0005bT-1y
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 12:45:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fb48502-f697-4ea3-bf74-64e000de6207;
 Tue, 05 Jan 2021 12:45:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77196AA35;
 Tue,  5 Jan 2021 12:45:41 +0000 (UTC)
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
X-Inumbo-ID: 8fb48502-f697-4ea3-bf74-64e000de6207
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609850741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WQp8E8n51xhk9C5vJA3kZBzGJQtMkROCpNb1W2Ggqcc=;
	b=ReoZbKhX/UdzuMcJpNgZ4B5LDXSxsM8pR7y6yU99yBJZqs6ICaZ8S6usx72KyrprT76yba
	vDMsI1lMUGIyim2OQ7bj0T6kYplTZd2LLcFmlIdBoth1/GhqThlXyzzyd2vpfcV9Gpehkh
	zBydR+fcUyGwg0EJdNQDPJrboh6FPNo=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] lib: extend ASSERT()
Message-ID: <8afb661c-a2eb-3188-8351-01de16ff1b22@suse.com>
Date: Tue, 5 Jan 2021 13:45:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The increasing amount of constructs along the lines of

    if ( !condition )
    {
        ASSERT_UNREACHABLE();
        return;
    }

is not only longer than necessary, but also doesn't produce incident
specific console output (except for file name and line number). Allow
the intended effect to be achieved with ASSERT(), by giving it a second
parameter allowing specification of the action to take in release builds
in case an assertion would have triggered in a debug one. The example
above then becomes

    ASSERT(condition, return);

Make sure the condition will continue to not get evaluated when just a
single argument gets passed to ASSERT().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: The use of a control flow construct as a macro argument may be
     controversial.

--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -818,11 +818,7 @@ int xenmem_add_to_physmap(struct domain
     union add_to_physmap_extra extra = {};
     struct page_info *pages[16];
 
-    if ( !paging_mode_translate(d) )
-    {
-        ASSERT_UNREACHABLE();
-        return -EACCES;
-    }
+    ASSERT(paging_mode_translate(d), return -EACCES);
 
     if ( xatp->space == XENMAPSPACE_gmfn_foreign )
         extra.foreign_domid = DOMID_INVALID;
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -55,12 +55,14 @@
 #endif
 
 #ifndef NDEBUG
-#define ASSERT(p) \
+#define ASSERT(p, ...) \
     do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
 #define ASSERT_UNREACHABLE() assert_failed("unreachable")
 #define debug_build() 1
 #else
-#define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
+#define ASSERT(p, alt...) do { \
+        if ( !count_args(alt) || unlikely(!(p)) ) { alt; } \
+    } while ( 0 )
 #define ASSERT_UNREACHABLE() do { } while (0)
 #define debug_build() 0
 #endif

