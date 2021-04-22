Return-Path: <SRS0=VIWx=JT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05918C433B4
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 14:44:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CFB66141C
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 14:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CFB66141C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115462.220295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZaZK-0003BS-UU; Thu, 22 Apr 2021 14:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115462.220295; Thu, 22 Apr 2021 14:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZaZK-0003BL-RQ; Thu, 22 Apr 2021 14:44:38 +0000
Received: by outflank-mailman (input) for mailman id 115462;
 Thu, 22 Apr 2021 14:44:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZaZJ-0003BD-Nb
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:44:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22b32c30-555e-4039-b98a-5e5c24665c90;
 Thu, 22 Apr 2021 14:44:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28625B16A;
 Thu, 22 Apr 2021 14:44:36 +0000 (UTC)
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
X-Inumbo-ID: 22b32c30-555e-4039-b98a-5e5c24665c90
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619102676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CX7ycSIbHLxk9/beplw9uWXkdYfiG5DPYy83G5AM4JE=;
	b=rcA4yehWdnrNhng0HkIHI17UjFEXc9hI6PbENa4vqnKqE19m4FAG505qY7Ew/dLNlHe4U7
	QkXQ9lUHaPKlMkgQNillDAcGZpSVslNfoJ4a8iq/d0RVENOHruxQw3LSTAmfKWCUCweDXk
	ooZFonzxWH73Oce3Z+oJqmFsXL9nlzY=
Subject: [PATCH v3 02/22] x86/xstate: use xvzalloc() for save area allocation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <1fec148f-a5b2-5102-a790-e908d6f040c9@suse.com>
Date: Thu, 22 Apr 2021 16:44:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is in preparation for the area size exceeding a page's worth of
space, as will happen with AMX as well as Architectural LBR.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -8,6 +8,7 @@
 #include <xen/param.h>
 #include <xen/percpu.h>
 #include <xen/sched.h>
+#include <xen/xvmalloc.h>
 #include <asm/current.h>
 #include <asm/processor.h>
 #include <asm/hvm/support.h>
@@ -522,7 +523,7 @@ int xstate_alloc_save_area(struct vcpu *
 
     /* XSAVE/XRSTOR requires the save area be 64-byte-boundary aligned. */
     BUILD_BUG_ON(__alignof(*save_area) < 64);
-    save_area = _xzalloc(size, __alignof(*save_area));
+    save_area = _xvzalloc(size, __alignof(*save_area));
     if ( save_area == NULL )
         return -ENOMEM;
 
@@ -543,8 +544,7 @@ int xstate_alloc_save_area(struct vcpu *
 
 void xstate_free_save_area(struct vcpu *v)
 {
-    xfree(v->arch.xsave_area);
-    v->arch.xsave_area = NULL;
+    XVFREE(v->arch.xsave_area);
 }
 
 static unsigned int _xstate_ctxt_size(u64 xcr0)


