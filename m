Return-Path: <SRS0=dPyG=IK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430E5C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 16:50:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2D536500F
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 16:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2D536500F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.97243.184652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkzL-0001Ai-V0; Fri, 12 Mar 2021 16:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97243.184652; Fri, 12 Mar 2021 16:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkzL-0001Ab-Rs; Fri, 12 Mar 2021 16:50:11 +0000
Received: by outflank-mailman (input) for mailman id 97243;
 Fri, 12 Mar 2021 16:50:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKkzK-0001AW-Aa
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 16:50:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfdeb2b2-ce53-4633-b7a2-758ae8234b04;
 Fri, 12 Mar 2021 16:50:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5311EAF6C;
 Fri, 12 Mar 2021 16:50:08 +0000 (UTC)
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
X-Inumbo-ID: cfdeb2b2-ce53-4633-b7a2-758ae8234b04
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615567808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MmGPfV8DwHMB3Z9ZDZqRR5s22asV4IuA5dkHojkwLiI=;
	b=ssjRyOHivjERsl5WB/JR1yXJAQ7r4nj/wbnRmqAhz4bZ+mgNqLF/oLhDvza9Kx0jLVokhq
	EFCwujMf6zFyotBXQfwh560Fl9kJQFQCm/mvqNYLiWYTj79WihrsL5GIA5DVjvVoOsbGWt
	DY83wqVWWOwMkDjBGPvG8V286FZBuCk=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3][4.15] tools/x86: don't rebuild cpuid-autogen.h every time
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
Message-ID: <96ad6d6e-84f0-89dd-f7b1-1e1ddc2183fd@suse.com>
Date: Fri, 12 Mar 2021 17:50:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The first thing the "xen-dir" rule does is delete the entire xen/
subtree. Obviously this includes deleting xen/lib/x86/*autogen.h. As a
result there's no original version for $(move-if-changed ...) to compare
against, and hence the file and all its consumers would get rebuilt
every time. Instead only find and delete all the symlinks.

Fixes: eddf9559c977 ("libx86: generate cpuid-autogen.h in the libx86 include dir")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Don't use xargs. Don't hide errors.
v2: Different approach.

--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -19,8 +19,8 @@ xen-foreign:
 	$(MAKE) -C xen-foreign
 
 xen-dir:
-	@rm -rf xen acpi
 	mkdir -p xen/libelf acpi
+	find xen/ acpi/ -type l -exec rm '{}' +
 	ln -s $(XEN_ROOT)/xen/include/public/COPYING xen/
 	ln -s $(XEN_ROOT)/xen/include/public/*.h xen/
 	ln -s $(XEN_ROOT)/xen/include/public/*/ xen/

