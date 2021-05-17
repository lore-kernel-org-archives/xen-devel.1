Return-Path: <SRS0=GMNG=KM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DE9C433B4
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 15:12:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09B90610A2
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 15:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09B90610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.128356.240983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lieul-0005wl-Tr; Mon, 17 May 2021 15:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128356.240983; Mon, 17 May 2021 15:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lieul-0005we-Qc; Mon, 17 May 2021 15:12:15 +0000
Received: by outflank-mailman (input) for mailman id 128356;
 Mon, 17 May 2021 15:12:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lieuk-0005wY-Pm
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 15:12:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4b5c7b5-a4ae-4395-b74d-9ba8be501bf9;
 Mon, 17 May 2021 15:12:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 105D8AF75;
 Mon, 17 May 2021 15:12:13 +0000 (UTC)
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
X-Inumbo-ID: a4b5c7b5-a4ae-4395-b74d-9ba8be501bf9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621264333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ACzB0DWbQGMuhP7p+vCM4+g4XN+9TxlE9DnI7LNXZBs=;
	b=vDfEffzs87TIlyJUBoxJiFeoxiofBZyZFCKTYenvgXrKex0QVkTui63PUD/mFZrrvqzWov
	+AYG2+nff9AsadGKL2MUFXg09LY7mghXZS9EigOW0wWNu9PYsOIXbDPqKOVJ9fab+FOGoK
	NAJ/O7l2p8W6IrmSmmMzF+HEbCj8zcE=
Subject: Re: [PATCH 4/8] xen/blkfront: don't trust the backend response data
 blindly
To: Juergen Gross <jgross@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210513100302.22027-1-jgross@suse.com>
 <20210513100302.22027-5-jgross@suse.com>
 <315ad8b9-8a98-8d3e-f66c-ab32af2731a8@suse.com>
 <6095c4b9-a9bb-8a38-fb6c-a5483105b802@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a19a13ba-a386-2808-ad85-338d47085fa6@suse.com>
Date: Mon, 17 May 2021 17:12:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <6095c4b9-a9bb-8a38-fb6c-a5483105b802@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.05.2021 16:23, Juergen Gross wrote:
> On 17.05.21 16:11, Jan Beulich wrote:
>> On 13.05.2021 12:02, Juergen Gross wrote:
>>> @@ -1574,10 +1580,16 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>>>   	spin_lock_irqsave(&rinfo->ring_lock, flags);
>>>    again:
>>>   	rp = rinfo->ring.sring->rsp_prod;
>>> +	if (RING_RESPONSE_PROD_OVERFLOW(&rinfo->ring, rp)) {
>>> +		pr_alert("%s: illegal number of responses %u\n",
>>> +			 info->gd->disk_name, rp - rinfo->ring.rsp_cons);
>>> +		goto err;
>>> +	}
>>>   	rmb(); /* Ensure we see queued responses up to 'rp'. */
>>
>> I think you want to insert after the barrier.
> 
> Why? The relevant variable which is checked is "rp". The result of the
> check is in no way depending on the responses themselves. And any change
> of rsp_cons is protected by ring_lock, so there is no possibility of
> reading an old value here.

But this is a standard double read situation: You might check a value
and then (via a separate read) use a different one past the barrier.

Jan

