Return-Path: <SRS0=iyTO=JM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065B7C433ED
	for <xen-devel@archiver.kernel.org>; Thu, 15 Apr 2021 14:04:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C47EE6137D
	for <xen-devel@archiver.kernel.org>; Thu, 15 Apr 2021 14:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C47EE6137D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.111206.212665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2be-00057w-Df; Thu, 15 Apr 2021 14:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111206.212665; Thu, 15 Apr 2021 14:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2be-00057p-AY; Thu, 15 Apr 2021 14:04:30 +0000
Received: by outflank-mailman (input) for mailman id 111206;
 Thu, 15 Apr 2021 14:04:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lX2bd-00056O-2b
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:04:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fda751b7-4037-4823-b745-c1355004c85d;
 Thu, 15 Apr 2021 14:04:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB181AEF8;
 Thu, 15 Apr 2021 14:04:25 +0000 (UTC)
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
X-Inumbo-ID: fda751b7-4037-4823-b745-c1355004c85d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618495466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4PGmQw7SMQXUd5UEs/Lx5oZG1BOnRE2MPqMYkj4vGQ=;
	b=oZF/wvhcdRwWKkWAlEQi9+O4eSjPBl21ih38KKzMC7++bZbHNF4xMtGQZYxESGv8jjLRuq
	JAzZE5kJNj5P522c892V8habuK+cCrqpdU4KLFqtjS/Qi7tEFS1kNr+rxkMeRu8x/Bz1RD
	30gXTkrxmm1OC9fwqWQOxPlAZJy/avE=
Subject: Re: [PATCH] x86/pv: Rename hypercall_table_t to pv_hypercall_table_t
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210415132138.29007-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d553a6f2-157c-a4ab-02ef-fdd1ad6b9638@suse.com>
Date: Thu, 15 Apr 2021 16:04:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210415132138.29007-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.04.2021 15:21, Andrew Cooper wrote:
> The type is no longer appropriate for anything other than PV, and therefore
> should not retain its generic name.
> 
> Fixes: 527922008bc ("x86: slim down hypercall handling when !PV32")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm not convinced this warrants a Fixes: tag (afaict there's no breakage),
but in any event
Reviewed-by: Jan Beulich <jbeulich@suse.com>
I had considered doing the rename at the same time, but then decided to
save on the extra code churn. I'm sorry if this was the wrong choice.

Jan

