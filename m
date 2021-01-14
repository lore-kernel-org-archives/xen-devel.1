Return-Path: <SRS0=mH2p=GR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DB8C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 09:21:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34E2123A1D
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 09:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34E2123A1D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.66905.119035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzyoJ-0004Hb-EQ; Thu, 14 Jan 2021 09:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66905.119035; Thu, 14 Jan 2021 09:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzyoJ-0004HU-At; Thu, 14 Jan 2021 09:20:55 +0000
Received: by outflank-mailman (input) for mailman id 66905;
 Thu, 14 Jan 2021 09:20:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kzyoH-0004HN-Ee
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 09:20:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e34970ef-477a-4285-b827-7b18a2b201f0;
 Thu, 14 Jan 2021 09:20:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B1C70AFA0;
 Thu, 14 Jan 2021 09:20:51 +0000 (UTC)
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
X-Inumbo-ID: e34970ef-477a-4285-b827-7b18a2b201f0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610616051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e9y1am0SjUe2wl7vFPhVNdVO3ME0BR9nBN+dTTuBTMg=;
	b=Kp5gkVUrt/v+bnpC+jAb59DasmttrfH/S9VlSf7BbsOCdoAof9oWN5zHRLH35/i4YgEiru
	qTQ/g8LjVGRijtxMcQYz3ooV5sfJCBZnzlM4qfmabozrQt3a9stHR5sOY9sGVPw4Dir76t
	aKUzFBGFrDph4edjx+5Byjuj2nWPsv0=
Subject: Re: [PATCH] memory: avoid pointless continuation in
 xenmem_add_to_physmap()
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e41fb847-684e-2502-5261-56108ebaeab0@suse.com>
 <feaa96fe-4609-0f4c-6cb0-8bac854bc7f6@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8cc75e77-5365-4617-7d06-0808d4e471ce@suse.com>
Date: Thu, 14 Jan 2021 10:20:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <feaa96fe-4609-0f4c-6cb0-8bac854bc7f6@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.01.2021 20:09, Julien Grall wrote:
> On 04/12/2020 10:43, Jan Beulich wrote:
>> Adjust so we uniformly avoid needlessly arranging for a continuation on
>> the last iteration.
>>
>> Fixes: 5777a3742d88 ("IOMMU: hold page ref until after deferred TLB flush")
> 
> I view this patch as an optimization because there is nothing wrong with 
> the code. So I think "Fixes" is not entirely suitable here.

Well, yes, I think one can look at it both ways. The code was
clearly worse than necessary, performance wise. We should have
recognized this (as well as what had caused XSA-355) before
XSA-346 was even predisclosed, and the code should never have
been the way it is right now. So while it doesn't result in any
malfunction (other than the XSA-355 issue), I still view it as
a bug. But I can see that one may also view it differently.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Other than my remark about the tag:
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks.

Jan

