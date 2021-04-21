Return-Path: <SRS0=soTB=JS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504BDC433ED
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 14:58:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 047F56144B
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 14:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 047F56144B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.114799.218845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEIw-0008Ju-7u; Wed, 21 Apr 2021 14:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114799.218845; Wed, 21 Apr 2021 14:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEIw-0008Jn-4G; Wed, 21 Apr 2021 14:58:14 +0000
Received: by outflank-mailman (input) for mailman id 114799;
 Wed, 21 Apr 2021 14:58:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZEIv-0008Jg-8h
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:58:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd55a24a-ca85-42bd-bf69-2fd0fdeb40ff;
 Wed, 21 Apr 2021 14:58:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91783B4F5;
 Wed, 21 Apr 2021 14:58:11 +0000 (UTC)
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
X-Inumbo-ID: fd55a24a-ca85-42bd-bf69-2fd0fdeb40ff
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619017091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PW+XxMcrclQ3Woj7YTyYCjraRWb4WLw8fXwPv9OBWoI=;
	b=C5iUJDEKmDytH3E/JE6ybsGGTSClh2t7iobc0KwmwvYv+5WL05v1VfGIUSQAMmz/6WqY9B
	uiXjCRaTDs+8sxk1K1Y9KBK+9lm3Iz2ezOGyOjR/0OTHEwcqz6br8qb8VyD6xI4If6Dlr3
	U/A1gnd2nudemy02NM7BHM6W0ArZmPM=
Subject: [PATCH v2 5/8] EFI/runtime: avoid effectively open-coding
 x{m,z}alloc_array()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
Message-ID: <b4539118-929e-621e-17e2-68e6e2eaa47a@suse.com>
Date: Wed, 21 Apr 2021 16:58:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There is a difference in generated code: x{m,z}alloc_bytes() forces
SMP_CACHE_BYTES alignment. But if code really cared about such higher
than default alignment, it should request so explicitly rather than
using a type-unsafe interface. And if e.g. cache line sharing was a
concern, the allocator itself should arrange to avoid such.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -486,7 +486,7 @@ int efi_runtime_call(struct xenpf_efi_ru
         size = op->u.get_variable.size;
         if ( size )
         {
-            data = xmalloc_bytes(size);
+            data = xmalloc_array(unsigned char, size);
             if ( !data )
             {
                 xfree(name);
@@ -536,7 +536,7 @@ int efi_runtime_call(struct xenpf_efi_ru
             return -EIO;
         }
 
-        data = xmalloc_bytes(op->u.set_variable.size);
+        data = xmalloc_array(unsigned char, op->u.set_variable.size);
         if ( !data )
             rc = -ENOMEM;
         else if ( copy_from_guest(data, op->u.set_variable.data,
@@ -571,7 +571,7 @@ int efi_runtime_call(struct xenpf_efi_ru
             return -EINVAL;
 
         size = op->u.get_next_variable_name.size;
-        name.raw = xzalloc_bytes(size);
+        name.raw = xzalloc_array(unsigned char, size);
         if ( !name.raw )
             return -ENOMEM;
         if ( copy_from_guest(name.raw, op->u.get_next_variable_name.name,


