Return-Path: <SRS0=ELVT=FT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1826C4361B
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 16:12:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A16B8206DB
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 16:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A16B8206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.54389.94465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCvv-0001Ip-Uh; Tue, 15 Dec 2020 16:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54389.94465; Tue, 15 Dec 2020 16:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCvv-0001Ii-Ri; Tue, 15 Dec 2020 16:12:15 +0000
Received: by outflank-mailman (input) for mailman id 54389;
 Tue, 15 Dec 2020 16:12:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vckb=FT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpCvu-0001IY-6p
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:12:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 183fe662-ed95-4b53-9f02-ba55a62b1f79;
 Tue, 15 Dec 2020 16:12:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83BCFACE0;
 Tue, 15 Dec 2020 16:12:12 +0000 (UTC)
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
X-Inumbo-ID: 183fe662-ed95-4b53-9f02-ba55a62b1f79
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608048732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QCkxWtPoeobzIyNZrsryM93YWFQL7VgqdQBp69ML/JE=;
	b=UF7p9dyaGJVVvin68EuQv9skV5oWLbzcUSJQKO9K3XEWO5JJnubpzx+vPteRou8RtWbW3V
	YQ2Kt29oiEKK4R/EYrID2kMWK/W2lRmOWZYjPWsKSmgHXXmraXfbTlR1CVYVJEsZomXuB+
	mYQkaDWNNPGHpM6zJ4O5F7JddTA15C8=
Subject: [PATCH v2 2/4] x86: clobber registers in switch_stack_and_jump() when
 !LIVEPATCH
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f4179ee3-56e4-ab18-7aae-55281c4d4412@suse.com>
Message-ID: <28db518c-da59-8e56-b8dc-ccc814f91131@suse.com>
Date: Tue, 15 Dec 2020 17:12:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <f4179ee3-56e4-ab18-7aae-55281c4d4412@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In order to have the same effect on registers as a call to
check_for_livepatch_work() may have, clobber all call-clobbered
registers in debug builds.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/include/asm-x86/current.h
+++ b/xen/include/asm-x86/current.h
@@ -120,6 +120,14 @@ unsigned long get_stack_dump_bottom (uns
 
 #ifdef CONFIG_LIVEPATCH
 # define CHECK_FOR_LIVEPATCH_WORK "call check_for_livepatch_work;"
+#elif defined(CONFIG_DEBUG)
+/* Mimic the clobbering effect a call has on registers. */
+# define CHECK_FOR_LIVEPATCH_WORK \
+    "mov $0x1234567890abcdef, %%rax\n\t" \
+    "mov %%rax, %%rcx; mov %%rax, %%rdx\n\t" \
+    "mov %%rax, %%rsi; mov %%rax, %%rdi\n\t" \
+    "mov %%rax, %%r8; mov %%rax, %%r9\n\t" \
+    "mov %%rax, %%r10; mov %%rax, %%r11\n\t"
 #else
 # define CHECK_FOR_LIVEPATCH_WORK ""
 #endif


