Return-Path: <SRS0=4R9G=IO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC82C433DB
	for <xen-devel@archiver.kernel.org>; Tue, 16 Mar 2021 14:42:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85CC26507D
	for <xen-devel@archiver.kernel.org>; Tue, 16 Mar 2021 14:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85CC26507D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.98326.186446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAtc-0001LL-7k; Tue, 16 Mar 2021 14:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98326.186446; Tue, 16 Mar 2021 14:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAtc-0001LE-4Q; Tue, 16 Mar 2021 14:42:08 +0000
Received: by outflank-mailman (input) for mailman id 98326;
 Tue, 16 Mar 2021 14:42:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMAtb-0001L9-EW
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 14:42:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMAta-0004v0-DS; Tue, 16 Mar 2021 14:42:06 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMAta-0001u4-89; Tue, 16 Mar 2021 14:42:06 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=L/fTNfVtEEXDtNdkuhqM0cmc4L+3SavwYBL00dDdZAg=; b=AP5CDHXBlSc5oc+I3oPK+qHXIY
	G6kojEBU2eM9IKXV4UXZk7DvRVtQySSs85vgMHKdjtW936SjGx6Ty/bYx6Jyj8uKobaQVA5iDNnoH
	YqNGcIui3BeOknFHM/Pz7jznb/5fmZ9zlKeNJ7W8AfcH/5y+W8PHT/6GCWuWlNx2fjaA=;
Subject: Re: [PATCH v2] xen/arm: Use register_t type of cpuinfo entries
From: Julien Grall <julien@xen.org>
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <7a6a8c5c33d13fb43f3777f046036b91233534d3.1615804612.git.bertrand.marquis@arm.com>
 <722ebf03-d037-de42-69d7-625f2ae13d2c@xen.org>
Message-ID: <967f25ef-6d17-18b6-1eb1-763efd0882ff@xen.org>
Date: Tue, 16 Mar 2021 14:42:04 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <722ebf03-d037-de42-69d7-625f2ae13d2c@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 16/03/2021 14:40, Julien Grall wrote:
> Hi Bertrand,
> 
> On 15/03/2021 10:38, Bertrand Marquis wrote:
>> All cpu identification registers that we store in the cpuinfo structure
>> are 64bit on arm64 and 32bit on arm32 so storing the values in 32bit on
>> arm64 is removing the higher bits which might contain information in the
>> future.
>>
>> This patch is changing the types in cpuinfo to register_t (which is
>> 32bit on arm32 and 64bit on arm64) and adding the necessary paddings
>> inside the unions.
>> For consistency uint64_t entries are also changed to register_t on 64bit
>> systems.
>>
>> It is also fixing all prints using directly the bits values from cpuinfo
>> to use PRIregister and adapt the printed value to print all bits
>> available on the architecture.
>>
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

I have committed it to my for-next/4.16 branch.

Cheers,

-- 
Julien Grall

