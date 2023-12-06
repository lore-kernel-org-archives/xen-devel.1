Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAE6C10DCE
	for <xen-devel@archiver.kernel.org>; Wed,  6 Dec 2023 10:58:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.649082.1013404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApbH-0004r5-2I; Wed, 06 Dec 2023 10:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649082.1013404; Wed, 06 Dec 2023 10:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApbG-0004qy-Th; Wed, 06 Dec 2023 10:57:54 +0000
Received: by outflank-mailman (input) for mailman id 649082;
 Wed, 06 Dec 2023 10:57:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rApbG-0004qs-3F
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 10:57:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rApbA-0006Lp-43; Wed, 06 Dec 2023 10:57:48 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.253]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rApb9-0006ET-Ud; Wed, 06 Dec 2023 10:57:48 +0000
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
	bh=H7YzSfu3+2mK/JQCwSAtUCP6oi2mrlC5ns4ynLthen0=; b=tKN9VeHm8OLyw9HLf5ZgY6IHLx
	exiyt1/RWqJg1MMuHP5JlJh5tSTfoFQ8/xxFI1HvS/uRZjPfLHtKcVRxg5FmLtQZfUbKrJtmlgcpE
	Lbk92hn/CONaRIKTQZiSxQzpkQrj+lXiO9us5/r28nVgLOelW9sdeOIUQ2UOghbu+xWs=;
Message-ID: <62a22ba6-a912-4ff7-8653-2cc019503aee@xen.org>
Date: Wed, 6 Dec 2023 10:57:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/arm: set -mno-unaligned-access compiler option
 for Arm32
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20231206071039.24435-1-jgross@suse.com>
 <20231206071039.24435-2-jgross@suse.com>
 <606969b5-5ee3-4e15-92d4-86b142845437@suse.com>
 <5bc34aa0-607b-4e89-bd71-c216c70ddc67@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5bc34aa0-607b-4e89-bd71-c216c70ddc67@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 06/12/2023 10:00, Juergen Gross wrote:
> On 06.12.23 09:44, Jan Beulich wrote:
>> On 06.12.2023 08:10, Juergen Gross wrote:
>>> As the hypervisor is disabling unaligned accesses for Arm32, set the
>>> -mno-unaligned-access compiler option for building. This will prohibit
>>> unaligned accesses when e.g. accessing 2- or 4-byte data items in
>>> packed data structures.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Assuming this will want backporting, should it have some Fixes: tag?
> 
> IMHO this might not be needed

You probably miss the discussion between Arnd and I where I pointed out 
that this should fix [1]. I haven't yet tested to confirm.

[1] 
https://lore.kernel.org/xen-devel/c71163f6-2646-6fae-cb22-600eb0486539@xen.org/

> 
> 
> Juergen

-- 
Julien Grall

