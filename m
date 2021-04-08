Return-Path: <SRS0=xlmN=JF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AC7C433B4
	for <xen-devel@archiver.kernel.org>; Thu,  8 Apr 2021 12:23:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59C3761130
	for <xen-devel@archiver.kernel.org>; Thu,  8 Apr 2021 12:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59C3761130
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.107281.205096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTgt-0005Qi-EX; Thu, 08 Apr 2021 12:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107281.205096; Thu, 08 Apr 2021 12:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTgt-0005Qb-BU; Thu, 08 Apr 2021 12:23:19 +0000
Received: by outflank-mailman (input) for mailman id 107281;
 Thu, 08 Apr 2021 12:23:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUTgs-0005QT-3c
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:23:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66e728ea-9180-45a9-85a9-512230029e86;
 Thu, 08 Apr 2021 12:23:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7EAB4B090;
 Thu,  8 Apr 2021 12:23:16 +0000 (UTC)
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
X-Inumbo-ID: 66e728ea-9180-45a9-85a9-512230029e86
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617884596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JP7NYsf4fopqSVgYCDwHxKC3KJzvwiy4UDKP6yZkCFM=;
	b=laMkxHER7aSZu5M4s+gxNOdm+jcWdCLLVomCWwYt1NdHxvK6yRNallue1mMBvk3ePmgZ/s
	R4bV6pdtiW9iWN8d44dqOpx1L2HNAvdRV6EfXVopbCy3BUw2Qt3nprT3UEV2kf6R5cBt2x
	Orhi2dsrZGsJUITGPFWVzSE726abFvU=
Subject: [PATCH 11/11] Arm/optee: don't open-code xzalloc_flex_struct()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Message-ID: <aad23304-c727-2921-59fe-ab3763f5da03@suse.com>
Date: Thu, 8 Apr 2021 14:23:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There is a difference in generated code: xzalloc_bytes() forces
SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
actually don't want it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -529,8 +529,7 @@ static struct optee_shm_buf *allocate_op
     while ( unlikely(old != atomic_cmpxchg(&ctx->optee_shm_buf_pages,
                                            old, new)) );
 
-    optee_shm_buf = xzalloc_bytes(sizeof(struct optee_shm_buf) +
-                                  pages_cnt * sizeof(struct page *));
+    optee_shm_buf = xzalloc_flex_struct(struct optee_shm_buf, pages, pages_cnt);
     if ( !optee_shm_buf )
     {
         err_code = -ENOMEM;


