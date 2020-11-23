Return-Path: <SRS0=yIb1=E5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43A1C2D0E4
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 14:28:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 626B22075A
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 14:28:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="MKmQG8/A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 626B22075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.34443.65496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCoi-00078y-Uc; Mon, 23 Nov 2020 14:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34443.65496; Mon, 23 Nov 2020 14:27:44 +0000
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
	id 1khCoi-00078r-RL; Mon, 23 Nov 2020 14:27:44 +0000
Received: by outflank-mailman (input) for mailman id 34443;
 Mon, 23 Nov 2020 14:27:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCoh-00078m-Ge
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:27:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f5b63af-c3c9-47a2-9db1-b01128e29233;
 Mon, 23 Nov 2020 14:27:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 01043AC23;
 Mon, 23 Nov 2020 14:27:42 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCoh-00078m-Ge
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:27:43 +0000
X-Inumbo-ID: 2f5b63af-c3c9-47a2-9db1-b01128e29233
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2f5b63af-c3c9-47a2-9db1-b01128e29233;
	Mon, 23 Nov 2020 14:27:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606141662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CX7ycSIbHLxk9/beplw9uWXkdYfiG5DPYy83G5AM4JE=;
	b=MKmQG8/AN3wFaxoMGrWE/Cw/M/LHuRlZbDGfLe55vl/6C2/05eiid8YJZx0rWMW5m9aQZF
	TWKdupSzEbgOJ45dAeCZRiCRaSJUNsMp8gkBHnZC23L1YJqd2LAco3j/8OcaRSJNivTpUp
	6R9f2qGeWbJaY8jDbT9XTY7oln1wh44=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 01043AC23;
	Mon, 23 Nov 2020 14:27:42 +0000 (UTC)
Subject: [PATCH v2 03/17] x86/xstate: use xvzalloc() for save area allocation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Message-ID: <2f79bfd4-779f-de9f-2a6c-a393ce3cdfc8@suse.com>
Date: Mon, 23 Nov 2020 15:27:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
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


