Return-Path: <SRS0=Rhtt=CZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8F1C433E2
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2020 09:12:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF46A2076C
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2020 09:12:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="KOkpoqkl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF46A2076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kITU8-0005bf-OB; Wed, 16 Sep 2020 09:12:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nCdG=CZ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kITU7-0005ba-5V
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 09:12:15 +0000
X-Inumbo-ID: 678d875a-8132-4db0-b662-801d0af41c74
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 678d875a-8132-4db0-b662-801d0af41c74;
 Wed, 16 Sep 2020 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=kJFD26a05sjMfdUYmYyt2bW7tPW2EKOc5lLBx6JT98s=; b=KOkpoqkliPmTNOCXx8W9oKrw5s
 YpG853px6H+BFpvPxpcJkVhacKWhECF/Mh6IlkkdLgrcxfleEOE0OiwfKQ610HJJzGv6iBjlyu0R3
 U0ohI0i0tr5/Oxv9E1M9RCr0Oiwi9f9jW5YPXeWGldACgIiPALNYkTHEhUZbTQ+AFErM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kITU3-0001YH-LY; Wed, 16 Sep 2020 09:12:11 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kITU3-00034y-EB; Wed, 16 Sep 2020 09:12:11 +0000
Subject: Re: [PATCH V1 14/16] xen/ioreq: Use guest_cmpxchg64() instead of
 cmpxchg()
To: paul@xen.org, 'Jan Beulich' <jbeulich@suse.com>,
 'Oleksandr Tyshchenko' <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <jgrall@amazon.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-15-git-send-email-olekstysh@gmail.com>
 <44b19ee1-dc34-3a46-0b4b-7196faadcb5c@suse.com>
 <c87089d5-39d2-55e6-5539-97af32c3d6cd@xen.org>
 <002b01d68c09$12df32a0$389d97e0$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <b43a814a-3788-010e-768b-75211748b05c@xen.org>
Date: Wed, 16 Sep 2020 10:12:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <002b01d68c09$12df32a0$389d97e0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 16/09/2020 10:09, Paul Durrant wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 16 September 2020 10:07
>> To: Jan Beulich <jbeulich@suse.com>; Oleksandr Tyshchenko <olekstysh@gmail.com>
>> Cc: xen-devel@lists.xenproject.org; Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant
>> <paul@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <jgrall@amazon.com>
>> Subject: Re: [PATCH V1 14/16] xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
>>
>>
>>
>> On 16/09/2020 10:04, Jan Beulich wrote:
>>> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>>>> @@ -1325,7 +1327,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
>>>>
>>>>            new.read_pointer = old.read_pointer - n * IOREQ_BUFFER_SLOT_NUM;
>>>>            new.write_pointer = old.write_pointer - n * IOREQ_BUFFER_SLOT_NUM;
>>>> -        cmpxchg(&pg->ptrs.full, old.full, new.full);
>>>> +        guest_cmpxchg64(d, &pg->ptrs.full, old.full, new.full);
>>>
>>> But the memory we're updating is shared with s->emulator, not with d,
>>> if I'm not mistaken.
>>
>> It is unfortunately shared with both s->emulator and d when using the
>> legacy interface.
> 
> When using magic pages they should be punched out of the P2M by the time the code gets here, so the memory should not be guest-visible.

Can you point me to the code that doing this?

Cheers,

-- 
Julien Grall

