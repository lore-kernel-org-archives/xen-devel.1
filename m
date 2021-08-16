Return-Path: <SRS0=BFXa=NH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF796C4320A
	for <xen-devel@archiver.kernel.org>; Mon, 16 Aug 2021 17:55:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A594A60F4B
	for <xen-devel@archiver.kernel.org>; Mon, 16 Aug 2021 17:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A594A60F4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.167468.305682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFgpT-0006Gw-Qh; Mon, 16 Aug 2021 17:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167468.305682; Mon, 16 Aug 2021 17:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFgpT-0006Gp-N7; Mon, 16 Aug 2021 17:55:19 +0000
Received: by outflank-mailman (input) for mailman id 167468;
 Mon, 16 Aug 2021 17:55:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mFgpR-0006Gj-HC
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 17:55:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mFgpR-0002iF-8m; Mon, 16 Aug 2021 17:55:17 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mFgpR-0003FH-2t; Mon, 16 Aug 2021 17:55:17 +0000
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
	bh=VBuIrp8shPmmTAxg2m/Et3G7xBH/L6XaZHOXXr8H7m8=; b=6G6uMDuQhsdAnpaJJsa7Cju9w6
	gnq/ifBt5S9JEC3yXsETFE+EkHHDKWIxDPPaBTWXZl3dKDNQ09IC1LfZaYNtwu42n0zXEiUi2wKUo
	TrCDzdQdkCDgBNvR5rs0qXgG6lEHF0CI0+vBSTMnG/YNn7WO74jw97DrlYLqRxaT18vQ=;
Subject: Re: [PATCH V4 10/10] xen/arm: introduce allocate_static_memory
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-11-penny.zheng@arm.com>
 <11d38943-444d-80d1-5fd5-98cbc24e6b7e@xen.org>
 <VE1PR08MB52155AED4031436410203304F7FD9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <dbed44c8-13c9-6f2e-1f18-44eb3f74c67f@xen.org>
Date: Mon, 16 Aug 2021 18:55:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB52155AED4031436410203304F7FD9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 16/08/2021 08:51, Penny Zheng wrote:
>>> +               d, bank, pbase, pbase + psize);
>>> +
>>> +        /*
>>> +         * It shall be mapped to the fixed guest RAM address rambase[i],
>>> +         * And until it exhausts the ramsize[i], it will seek to the next
>>> +         * rambase[i+1].
>>> +         */
>>> +        while ( 1 )
>>> +        {
>>> +            /*
>>> +             * The current physical bank is fully mapped.
>>> +             * Handle the next physical bank.
>>> +             */
>>> +            if ( gsize >= psize )
>>> +            {
>>> +                if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank],
>>> +                                                   smfn, psize) )
>>> +                    goto fail;
>>> +
>>> +                gsize = gsize - psize;
>>> +                bank++;
>>> +                break;
>>> +            }
>>> +            /*
>>> +             * Current guest bank memory is not enough to map.
>>> +             * Check if we have another guest bank available.
>>> +             * gbank refers guest memory bank index.
>>> +             */
>>> +            else if ( (gbank + 2) > GUEST_RAM_BANKS ) {
>>
>> I don't understand the +2. Can you clarify it?
>>
> 
> gbank refers to the index of the guest bank, and here since current guest bank(gbank)
>   memory is not enough to map, users seeks to the next one(gbank + 1),
> 
> gbank + 2 is the number of requested guest memory banks right now, and shall not be
> larger than GUEST_RAM_BANKS.

Thanks for the clarification. When I read "2" I tend to think we are 
checking the bank after the next. How about writing:

(gbank + 1) >= GUEST_RAM_BANKS

or

gbank >= (GUEST_RAM_BANKS - 1)

This as the same end results, but we check the index rather than the 
number of banks.

Anyway, I can settle with 2 if you really prefer it.

Cheers,

-- 
Julien Grall

