Return-Path: <SRS0=yIb1=E5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1F2C388F9
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 13:46:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78647206F1
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 13:46:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="vVX4omis"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78647206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.34351.65346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCAJ-0002CI-Bc; Mon, 23 Nov 2020 13:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34351.65346; Mon, 23 Nov 2020 13:45:59 +0000
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
	id 1khCAJ-0002CB-6u; Mon, 23 Nov 2020 13:45:59 +0000
Received: by outflank-mailman (input) for mailman id 34351;
 Mon, 23 Nov 2020 13:45:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCAI-0002C4-R3
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:45:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcb645b7-d493-414d-8ed5-da826e2edc67;
 Mon, 23 Nov 2020 13:45:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6277DAD19;
 Mon, 23 Nov 2020 13:45:57 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCAI-0002C4-R3
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:45:58 +0000
X-Inumbo-ID: fcb645b7-d493-414d-8ed5-da826e2edc67
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fcb645b7-d493-414d-8ed5-da826e2edc67;
	Mon, 23 Nov 2020 13:45:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606139157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w7uDOn4N0IoJ51us1LkK9OZYghwqQsMbEk0Oi9fZxmc=;
	b=vVX4omisYEgIILBK7CbJImhtB56Q0TRg2zdFwOd5W9a35SD3MCmc8tUfmQHZCCX6gHZVw8
	1BRDnqx24cDcwiNY2Dn44KlU9EZc00YAKS2vyeFVjjmhrxvtsyH/t5X0Qsi/+vRbLF3Iul
	HKGyOPtTmLW6CgpA3rze81SEmbGnoM8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6277DAD19;
	Mon, 23 Nov 2020 13:45:57 +0000 (UTC)
Subject: [PATCH v3 6/7] x86: make guarding against straight-line speculation
 optional
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8e7d1472-dd37-8ed3-ec2f-ce954ea61dfd@suse.com>
Message-ID: <f05d9ee9-2cf0-f2e5-b6e2-7846b9dfec12@suse.com>
Date: Mon, 23 Nov 2020 14:45:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <8e7d1472-dd37-8ed3-ec2f-ce954ea61dfd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Put insertion of INT3 behind CONFIG_SPECULATIVE_HARDEN_BRANCH
conditionals.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/arch/x86/indirect-thunk.S
+++ b/xen/arch/x86/indirect-thunk.S
@@ -11,8 +11,10 @@
 
 #include <asm/asm_defns.h>
 
+#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
 /* Don't transform the "ret" further down. */
 .purgem ret
+#endif
 
 .macro IND_THUNK_RETPOLINE reg:req
         call 2f
@@ -45,7 +47,9 @@ ENTRY(__x86_indirect_thunk_\reg)
         __stringify(IND_THUNK_LFENCE \reg), X86_FEATURE_IND_THUNK_LFENCE, \
         __stringify(IND_THUNK_JMP \reg),    X86_FEATURE_IND_THUNK_JMP
 
+#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
         int3 /* Halt straight-line speculation */
+#endif
 
         .size __x86_indirect_thunk_\reg, . - __x86_indirect_thunk_\reg
         .type __x86_indirect_thunk_\reg, @function
--- a/xen/include/asm-x86/asm-defns.h
+++ b/xen/include/asm-x86/asm-defns.h
@@ -45,6 +45,8 @@
     INDIRECT_BRANCH jmp \arg
 .endm
 
+#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
+
 /*
  * To guard against speculation past RET, insert a breakpoint insn
  * immediately after them.
@@ -60,3 +62,5 @@
     .word \operand
     .endif
 .endm
+
+#endif


