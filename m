Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EC4CD5BB1
	for <xen-devel@archiver.kernel.org>; Sun, 24 May 2026 11:00:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1318619.1586746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wR6Z6-0004RP-Nc; Sun, 24 May 2026 11:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318619.1586746; Sun, 24 May 2026 11:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wR6Z6-0004RI-KQ; Sun, 24 May 2026 11:00:16 +0000
Received: by outflank-mailman (input) for mailman id 1318619;
 Sun, 24 May 2026 11:00:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wR6Z5-0004RC-QD
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 11:00:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wR6Z5-003zR6-0Z;
 Sun, 24 May 2026 11:00:15 +0000
Received: from [2a02:8012:3a1:0:94ee:8228:5d9d:4ee8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wR6Z4-005PIm-39;
 Sun, 24 May 2026 11:00:15 +0000
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
	bh=7m4lJ7TIcGE792JMwbJcSf0iwwa49L3L/8UsoUChDbM=; b=PSoEG+vNRgfWC8ttgY5EfqB6Fi
	fPWA0s8YnqBwboe+qgHxLVNSLg88IveZ6yhggJIV5gZTNS78JMqwMZ28kOXZC5aDHtq7Qo5NnwU1K
	O7IZp7PtdKSrn7J0vf8GnzFMenXtjWzxYvwmIHOwIGbzIQiinyv/snqIzgEnSiR8oXOY=;
Message-ID: <e489f44e-ef61-425c-bd0e-0a992c32f7cf@xen.org>
Date: Sun, 24 May 2026 12:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
 <56a7c116-4ecb-4dfc-a7dd-774d53041fe9@xen.org>
 <87a04781-5765-43b6-8b21-cb993609bd91@epam.com>
 <cd2c76a2-7a13-4bbf-9c29-5dcf3ae06fc0@xen.org>
 <4c96c478-aeb5-443c-a6ca-f23caf7d5430@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4c96c478-aeb5-443c-a6ca-f23caf7d5430@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Milan,

On 28/04/2026 11:16, Milan Djokic wrote:
>>> The original idea was to also allow stage-1-only support. But I'm not
>>> sure if stage-1-only usecase is useful or even valid for Xen.. I will
>>> update the patch series with the missing parts for stage-1-only support,
>>> pointed out by Luca, but the question remains if this is needed at all.
>>> If not, I can revert to original state where stage-2 was always 
>>> required.
>>
>> By "stage-1 only" support, do you mean Xen would use the stage-1 in
>> replacement of the stage-2? Or do you mean the guest will use the
>> stage-1 page-table and there will be no isolation from Xen?
>>
>> If the former, then I believe the page tables don't have the exact same
>> format. Today, the page-tables are shared between the CPU and IOMMU, so
>> this would need to be duplicated. For now, I am not sure this is worth
>> to do.
>>
>> If the latter, this would require the guest to be directly mapped (i.e.
>> IPA == PA) but it would also open a big hole. So I would want to
>> understand the exact use case first.
>>
> 
> The latter. In this case, the guest would configure stage-1 while 
> stage-2 translation is not used, so there is no additional isolation 
> enforced by Xen. This would only be intended for specific usecases with 
> trusted domains. But yes, this opens a significant hole if used with 
> untrusted guests. If there is no strong usecase, we could restrict the 
> implementation to always require stage-2.

It is still unclear what would be the exact use-case. Is it a system 
where the SMMU doesn't support stage-2? Performance reason?

Overall, I would rather not add any extra code in Xen without any strong 
use case.

Cheers,

-- 
Julien Grall


