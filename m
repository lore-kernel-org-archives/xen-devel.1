Return-Path: <SRS0=f3nK=FC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBA5C63697
	for <xen-devel@archiver.kernel.org>; Sat, 28 Nov 2020 11:27:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C2C422264
	for <xen-devel@archiver.kernel.org>; Sat, 28 Nov 2020 11:27:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="GL0a92Nr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C2C422264
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.39946.72989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiyNg-0000bV-2r; Sat, 28 Nov 2020 11:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39946.72989; Sat, 28 Nov 2020 11:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiyNf-0000bO-VR; Sat, 28 Nov 2020 11:27:07 +0000
Received: by outflank-mailman (input) for mailman id 39946;
 Sat, 28 Nov 2020 11:27:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kiyNe-0000bG-Nx
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2020 11:27:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiyNb-0004zI-Ps; Sat, 28 Nov 2020 11:27:03 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiyNb-0004jH-IR; Sat, 28 Nov 2020 11:27:03 +0000
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
	bh=HvwaVHZe+OmUARUfoPhJEeMbfY6nTVY5vm00zjtencQ=; b=GL0a92Nr7KjOxDIzt5IZIoSPFr
	mp+ejjSGtD9Hq3EGiI1ztaCGUWvodxHqRF84Qv4h5Bug21WEqiowxpe91efDPggxU9b3ZwMtUEWzL
	Gj3lpC6VRSDyjYSMJDW+qOJkp0tSxggAz188/NhIYueJgTbDarm6pczu6EqJ9Yvl7LL0=;
Subject: Re: [PATCH] xen/irq: Propagate the error from init_one_desc_irq() in
 init_irq_data()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20201119145434.28065-1-julien@xen.org>
 <20201119151156.wgkwyslzzlpcirot@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <592a2f99-a77f-f12d-cefe-4d41e8a0f08e@xen.org>
Date: Sat, 28 Nov 2020 11:27:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201119151156.wgkwyslzzlpcirot@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Roger,

On 19/11/2020 15:11, Roger Pau Monné wrote:
> On Thu, Nov 19, 2020 at 02:54:34PM +0000, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> init_one_desc_irq() can return an error if it is unable to allocate
>> memory. While this is unlikely to happen during boot (called from
>> init_irq_data()), it is better to harden the code by propagting the
>> return value.
>>
>> Spotted by coverity.
>>
>> CID: 106529
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
>> ---
>>   xen/arch/x86/irq.c | 7 ++++++-
> 
> Fox x86:
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thank you!

> 
>>   2 files changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
>> index 3877657a5277..279d221a2b85 100644
>> --- a/xen/arch/arm/irq.c
>> +++ b/xen/arch/arm/irq.c
>> @@ -88,7 +88,12 @@ static int __init init_irq_data(void)
>>       for ( irq = NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
>>       {
>>           struct irq_desc *desc = irq_to_desc(irq);
>> -        init_one_irq_desc(desc);
>> +        int rc;
>> +
>> +        rc = init_one_irq_desc(desc);
> 
> You could init rc at definition.

I need to send a new version, so I have merged the two line together.

Cheers,

-- 
Julien Grall

