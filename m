Return-Path: <SRS0=fV0s=IG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1D5C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 09:22:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8D0A651EE
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 09:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8D0A651EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.94717.178286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJC64-000272-6A; Mon, 08 Mar 2021 09:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94717.178286; Mon, 08 Mar 2021 09:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJC64-00026v-23; Mon, 08 Mar 2021 09:22:40 +0000
Received: by outflank-mailman (input) for mailman id 94717;
 Mon, 08 Mar 2021 09:22:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJC63-00026T-59
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:22:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2c4c53a-2167-4c79-9e0d-fecd377e3814;
 Mon, 08 Mar 2021 09:22:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA7FFAC54;
 Mon,  8 Mar 2021 09:22:35 +0000 (UTC)
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
X-Inumbo-ID: e2c4c53a-2167-4c79-9e0d-fecd377e3814
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615195355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HM/JPFP9UxjelZCsGhQtKcxAk3Q+KDuvq+vWM6E/EQ0=;
	b=CC3I7zk/NMIE9et4xYaXnvRld+4D6MZJO+gcBp2/V7NgC7R4AD95+Bz5rWgPD0jbArUNWJ
	/aJmT2EHcGA/56qdo4JtJrU2BVDnetl0T58WsT9kZnrH6cnhJKrEpt8YHSKPJVVP9fGUtf
	YRv2mAHb8nfptZp65rfsd8v1R4vPR6g=
Subject: [PATCH 2/2] tools/x86: move arch-specific include/xen/ population
 into arch-specific rule
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d08ec3ba-dff1-cb1c-9103-949e15774fd5@suse.com>
Message-ID: <0702c375-4769-7246-ba47-613ed69330e1@suse.com>
Date: Mon, 8 Mar 2021 10:22:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d08ec3ba-dff1-cb1c-9103-949e15774fd5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no need for the common "xen-dir" rule to have an arch-specific
part when there already is a arch-specific rule where this can be taken
care of.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was tempted to also uniformly change the pattern from *autogen.h to
*-autogen.h right here - thoughts?

I was also tempted to move the "xen-dir" dependency from
all-$(CONFIG_X86) to the general all-y, but perhaps that's less related
and hence should really be a separate change (and there may also be
arguments against that).

--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -29,12 +29,6 @@ xen-dir: prep-y
 	ln -s ../xen-foreign xen/foreign
 	ln -s $(XEN_ROOT)/xen/include/acpi/platform acpi/
 	ln -s $(XEN_ROOT)/xen/include/acpi/ac*.h acpi/
-ifeq ($(CONFIG_X86),y)
-	ln -s $(XEN_ROOT)/xen/include/asm-x86 xen/asm
-	mkdir -p xen/lib/x86
-	ln -s $(filter-out %autogen.h,$(wildcard $(XEN_ROOT)/xen/include/xen/lib/x86/*.h)) xen/lib/x86/
-	ln -s $(XEN_ROOT)/xen/include/xen/lib/x86/Makefile xen/lib/x86/
-endif
 
 # Arrange for preserving of auto-generated headers (to avoid them getting
 # rebuilt every time): Move the entire xen/lib/x86/ to a temporary place.
@@ -43,6 +37,10 @@ prep-$(CONFIG_X86):
 	test ! -d xen/lib/x86 || mv xen/lib/x86 .xen-lib-x86
 
 all-$(CONFIG_X86): xen-dir
+	ln -s $(XEN_ROOT)/xen/include/asm-x86 xen/asm
+	mkdir -p xen/lib/x86
+	ln -s $(filter-out %autogen.h,$(wildcard $(XEN_ROOT)/xen/include/xen/lib/x86/*.h)) xen/lib/x86/
+	ln -s $(XEN_ROOT)/xen/include/xen/lib/x86/Makefile xen/lib/x86/
 	$(if $(wildcard .xen-lib-x86/*autogen.h),mv .xen-lib-x86/*autogen.h xen/lib/x86/)
 	rm -rf .xen-lib-x86
 	$(MAKE) -C xen/lib/x86 all XEN_ROOT=$(XEN_ROOT) PYTHON=$(PYTHON)


