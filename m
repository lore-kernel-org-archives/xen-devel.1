Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EB3C197A0
	for <xen-devel@archiver.kernel.org>; Thu, 16 Nov 2023 14:01:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.634254.989669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cuy-0004MJ-V4; Thu, 16 Nov 2023 14:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634254.989669; Thu, 16 Nov 2023 14:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cuy-0004MC-Sb; Thu, 16 Nov 2023 14:00:28 +0000
Received: by outflank-mailman (input) for mailman id 634254;
 Thu, 16 Nov 2023 14:00:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3cux-0004M6-Qs
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 14:00:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3cuv-0006bg-4q; Thu, 16 Nov 2023 14:00:25 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[10.95.133.161]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3cuu-0001cZ-V1; Thu, 16 Nov 2023 14:00:25 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=A6miHsw0opItqgAV11USOyMB+3Jx+buaP0HvesB2xiU=; b=ZtbeYa5PJcSzTa7so+hcwKLUHh
	rhHH8dz7MvDLyAACEaEHAtj99+27GP1nCoa4FMJfehufFyz18aT/Mn4aAl/51fNe3z7hofwUDh5Vn
	mA4bZpepahLdRtIZWCphP5JlfdNiKhI5c5bTLQX5nx96/iTtMy2m3BANcq31gt60w/KE=;
Message-ID: <569a0499-e6ce-4568-adae-650a51d223df@xen.org>
Date: Thu, 16 Nov 2023 14:00:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/arm: Skip memory nodes if not enabled
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Leo Yan <leo.yan@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20231013120442.1267488-1-leo.yan@linaro.org>
 <20231106021742.GA90848@leoy-huanghe.lan>
 <191b5aa4-182f-4b2e-8430-e605de592890@xen.org>
 <20231106103212.GE90848@leoy-huanghe.lan>
 <d4196b09-427d-458f-87f4-7e7126bf6f39@xen.org>
In-Reply-To: <d4196b09-427d-458f-87f4-7e7126bf6f39@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi,

On 06/11/2023 11:31, Julien Grall wrote:
> On 06/11/2023 10:32, Leo Yan wrote:
>> Hi Julien,
>>
>> On Mon, Nov 06, 2023 at 09:52:45AM +0000, Julien Grall wrote:
>>
>> [...]
>>
>>>> Gentle ping.
>>>>
>>>> I don't see this patch is landed in Xen master or staging branch, 
>>>> should
>>>> anything I need to follow up?
>>>
>>> The tree has been frozen for the past few weeks for any patches that 
>>> are not
>>> meant for 4.18. We branched for 4.18 last week so staging is now in
>>> soft-reopening until 4.18 is released.
>>
>> Thank you for the info.
>>
>>> I am aware of few patches that are ready to be merged. But I haven't yet
>>> gone through all of them and merge to 4.19. It will probably be done 
>>> once
>>> 4.18 is released.
>>
>> Sure, good to know this.  I will wait a bit and just let me know if
>> I need to follow up anything.
> 
> Please ping me in ~ 2 weeks time if your patch is still not merged.
> 
> @Stefano, did you add this patch in your for-next branch?

It is now committed.

Cheers,

-- 
Julien Grall

