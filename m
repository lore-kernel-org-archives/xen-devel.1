Return-Path: <SRS0=okQV=DB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40D2C4363D
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2020 16:51:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85C3F21D20
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2020 16:51:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="JayBn9Dt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85C3F21D20
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLUSf-0002VW-FK; Thu, 24 Sep 2020 16:51:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UtQo=DB=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kLUSd-0002VR-Mz
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 16:51:11 +0000
X-Inumbo-ID: b64e8056-afcd-4a41-bbc3-de1fdac51a40
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b64e8056-afcd-4a41-bbc3-de1fdac51a40;
 Thu, 24 Sep 2020 16:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=dLHwdDKiHh8vx3Natl3AOSdPKw9JSuLQyLa1etXnhU4=; b=JayBn9DtOx6zV4hDgdwdguulL4
 8e6CsjuoUoshPm4LhFwwLGqIfquzBwhPlox7oUPW/CYbktfZ+zabtFe8ptirz7zHSH8p8meLW9nHL
 0ccbWP47mV8mwJuyPM6wiZQGWec4BK6PVpKfMJ6aup4j5DHk/elKcb1PASiIr3uKOLKU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kLUSa-0003WH-HS; Thu, 24 Sep 2020 16:51:08 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kLUSa-0007WN-7p; Thu, 24 Sep 2020 16:51:08 +0000
Subject: Re: [PATCH V1 09/16] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Jan Beulich <jbeulich@suse.com>, Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-10-git-send-email-olekstysh@gmail.com>
 <be3401e8-db2b-82a5-b117-2c0fc8b85811@xen.org>
 <7fbab25d-18a9-83d6-2596-f0f9d149058c@gmail.com>
 <af29723b-8ed6-ca8f-8848-29aa65f42b74@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <21522443-7c3b-ced1-653b-1021edd55107@xen.org>
Date: Thu, 24 Sep 2020 17:51:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <af29723b-8ed6-ca8f-8848-29aa65f42b74@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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



On 24/09/2020 12:08, Jan Beulich wrote:
> On 23.09.2020 22:16, Oleksandr wrote:
>> On 23.09.20 21:03, Julien Grall wrote:
>>> On 10/09/2020 21:22, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> @@ -91,6 +108,28 @@ struct arch_domain
>>>>    #endif
>>>>    }  __cacheline_aligned;
>>>>    +enum hvm_io_completion {
>>>> +    HVMIO_no_completion,
>>>> +    HVMIO_mmio_completion,
>>>> +    HVMIO_pio_completion
>>>> +};
>>>> +
>>>> +struct hvm_vcpu_io {
>>>> +    /* I/O request in flight to device model. */
>>>> +    enum hvm_io_completion io_completion;
>>>> +    ioreq_t                io_req;
>>>> +
>>>> +    /*
>>>> +     * HVM emulation:
>>>> +     *  Linear address @mmio_gla maps to MMIO physical frame
>>>> @mmio_gpfn.
>>>> +     *  The latter is known to be an MMIO frame (not RAM).
>>>> +     *  This translation is only valid for accesses as per
>>>> @mmio_access.
>>>> +     */
>>>> +    struct npfec        mmio_access;
>>>> +    unsigned long       mmio_gla;
>>>> +    unsigned long       mmio_gpfn;
>>>> +};
>>>> +
>>>
>>> Why do we need to re-define most of this? Can't this just be in common
>>> code?
>>
>> Jan asked almost the similar question in "[PATCH V1 02/16] xen/ioreq:
>> Make x86's IOREQ feature common".
>> Please see my answer there:
>> https://patchwork.kernel.org/patch/11769105/#23637511
>>
>> Theoretically we could move this to the common code, but the question is
>> how to be with other struct fields the x86's struct hvm_vcpu_io
>> has/needs but
>> Arm's seems not, would it be possible to logically split struct
>> hvm_vcpu_io into common and arch parts?
> 
> Have struct vcpu_io and struct arch_vcpu_io as a sub-part of it?

+1 for the idea.

Cheers,

-- 
Julien Grall

