Return-Path: <SRS0=2EqH=MG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DAAC07E9A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Jul 2021 18:16:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DE16613AF
	for <xen-devel@archiver.kernel.org>; Wed, 14 Jul 2021 18:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DE16613AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.156178.288184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3jR8-0004Nb-Jg; Wed, 14 Jul 2021 18:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156178.288184; Wed, 14 Jul 2021 18:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3jR8-0004NU-Ge; Wed, 14 Jul 2021 18:16:46 +0000
Received: by outflank-mailman (input) for mailman id 156178;
 Wed, 14 Jul 2021 18:16:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m3jR7-0004NK-L8
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 18:16:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3jR5-0002pw-Rr; Wed, 14 Jul 2021 18:16:43 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3jR5-0002qw-Lg; Wed, 14 Jul 2021 18:16:43 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=yssYiHJH9BR8drt4JeB5l32n6DVNC1BHpXUJdLWMLeQ=; b=VgKM7zjVxP2PLqa+TtgxsBA1Zr
	/rBYJ2Tb6Nub7juXmgoSY8yDnWB8xWU5xwIZebwt0623pbeiWZQFbNTU0wXL4a3gi6Ta5lErp9U67
	ATW+3gLnAy/9PTthyeY+V/h0wdOf3rYFWTi9LDpJi2a5nQpdI7oOMQJ0lNS/rF/i3tVc=;
Subject: Re: [PATCH v2 13/13] SUPPORT.md: write down restriction of 32-bit
 tool stacks
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <ddff8b28-274d-d7fe-4ba9-0772859b7a72@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e12989f7-9217-e2b8-a17d-5c252dc89248@xen.org>
Date: Wed, 14 Jul 2021 19:16:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ddff8b28-274d-d7fe-4ba9-0772859b7a72@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/07/2021 16:18, Jan Beulich wrote:
> Let's try to avoid giving the impression that 32-bit tool stacks are as
> capable as 64-bit ones.

Would you be able to provide a few examples of the known issues in the 
commit message? This would be helpful for anyone to understand why we 
decided to drop the support.

At least on Arm, we tried to design the hypercall ABI in such a way that 
it should be possible to use a 32-bit toolstack.

That said, I am not aware of anyone using the 32-bit ABI on 64-bit Arm 
hypervisor. So dropping the support should be fine.

Cheers,

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Wording adjustments as per review discussion.
> 
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -131,6 +131,12 @@ ARM only has one guest type at the momen
>   
>   ## Toolstack
>   
> +While 32-bit builds of the tool stack are generally supported, restrictions
> +apply in particular when running on top of a 64-bit hypervisor.  For example,
> +very large guests aren't expected to be manageable in this case.  This includes
> +guests giving the appearance of being large, by altering their own memory
> +layouts.
> +
>   ### xl
>   
>       Status: Supported
> 

-- 
Julien Grall

