Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E351CA9EBD
	for <xen-devel@archiver.kernel.org>; Sun, 11 Oct 2026 15:16:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445626.1661660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFvHY-0005nB-CI; Sun, 11 Oct 2026 15:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445626.1661660; Sun, 11 Oct 2026 15:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFvHY-0005n2-8u; Sun, 11 Oct 2026 15:16:12 +0000
Received: by outflank-mailman (input) for mailman id 1445626;
 Sun, 11 Oct 2026 15:16:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1xFvHW-0005mu-J4
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2026 15:16:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <julien@xen.org>) id 1xFvHW-000000007d7-04i7;
 Sun, 11 Oct 2026 15:16:09 +0000
Received: from [2a02:8012:3a1:0:94b1:aa8d:8098:b789]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <julien@xen.org>) id 1xFvHS-00000000I5D-2QvK;
 Sun, 11 Oct 2026 15:16:07 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=4vLAabyXUF+p1z3Sk2EwmJMzDuyIAWDYxx95hcnUxRk=; b=htp/H6G1qOBJ9rFlGqggGBSmM6
	/jdAMuEJhBjfICdtvO2t/OE0e9mJ6Llm7juM1y8H5LNSFLl7ms5Pg85JqKxXs/3fQe+0TaBhgBUAv
	7s7GV7OfKzRs1iF/hYgc0CZoSJKlBKNmpsV7YtpNfJDeiEMF6s8DT7822cRZfGCWSl1k=;
Message-ID: <0304e375-ddbf-4760-b61c-3c563e67416d@xen.org>
Date: Sun, 11 Oct 2026 16:16:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] static-memory: allow skipping the cache flush
To: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260829050611.3353566-1-Jan.SetjeEilers@oracle.com>
 <d071b84a-2c92-4ef8-acde-c0419e259017@xen.org>
 <1da5f563-9fb3-4043-b13e-fa7a4f390911@oracle.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <1da5f563-9fb3-4043-b13e-fa7a4f390911@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 18/09/2026 22:23, Jan Setje-Eilers wrote:
> On 9/17/26 04:06, Grall, Julien wrote:
>> A few years ago, Arm introduced FEAT_FWB to rework how stage-2 + stage-1
>> memory attributes works. Currently in Xen, we are using the "old"
>> approach where the used attributes is the strongest of the two. For
>> instance, the guest has the MMU off, then the access will bypass the
>> cache. With FEAT_FWB, you can force the memory attributes to be
>> cacheable even when the MMU is off.
>>
>> I believe FEAT_FWB should solve the problem you have (assume your HW
>> supports it). In term of effort, it is mostly updating the stage-2
>> memory attributes and then getting rid of some cache operations (include
>> set/way emulation) when the feature is enabled.
>   I found that as well, but at least some of my hardware is from just
> before that shows up.

Thanks for clarification. I would have though most of such HW are pretty 
much gone :).

I am not entirely sure what's the best way forward for HW not supporting 
FEAT_FWB. With your approach, I am concerned we may be missing some 
cases after boot, so we could potentially skip the flush if the pages 
have not been touched for Xen (you said the pages are not scrubbed for 
static memory). I'd like some opinions from Bertrand, Michal and Stefano 
on this.

Cheers,

-- 
Julien Grall


