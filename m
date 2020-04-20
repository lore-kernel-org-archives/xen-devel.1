Return-Path: <SRS0=l84g=6E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F2FC3815B
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 12:09:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F2D7221F4
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 12:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="P05JlT1x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F2D7221F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQVEO-0008WR-Iy; Mon, 20 Apr 2020 12:08:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JPG3=6E=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jQVEM-0008WM-Vs
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 12:08:55 +0000
X-Inumbo-ID: b4215f98-82ff-11ea-9053-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4215f98-82ff-11ea-9053-12813bfff9fa;
 Mon, 20 Apr 2020 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3uJrIP1KzKW+tm4uKI8YsSCB6DZyKMvlrY4HiQcrG3Q=; b=P05JlT1xupwI1L9Jus1usXaSri
 mb8VV6gHAm0drj82kl6/c/UR/HS+0g7wI3p9AM/n/gkQXSxQYW9A/d0bMyrBRoQzEcTeKOXkVb59Q
 ym6l1a4e3wJTCYqNA7dWL5MlLAGHP1g1qFtUJtdBBbxQl1L+V3Qsocsk05PIKO0cVG1Y=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQVEK-0003aE-7R; Mon, 20 Apr 2020 12:08:52 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQVEJ-0000Zp-W0; Mon, 20 Apr 2020 12:08:52 +0000
Subject: Re: [PATCH 3/6] x86/mem-paging: use guest handle for
 XENMEM_paging_op_prep
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
 <f3c57792-d372-a70f-691b-87681b83e898@suse.com>
 <d340e170-1c08-e20a-b170-c176eb00b4dd@xen.org>
 <5e1dc7fd-f780-31bc-670d-4736061f46af@suse.com>
 <80621ca8-6c08-2868-ada6-bf0ef41fc699@xen.org>
 <802bfbad-a0d7-8d7a-716d-76f0b83c5707@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <136f8a16-3160-04f7-55f3-667f578e505e@xen.org>
Date: Mon, 20 Apr 2020 13:08:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <802bfbad-a0d7-8d7a-716d-76f0b83c5707@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 20/04/2020 08:26, Jan Beulich wrote:
> On 17.04.2020 19:13, Julien Grall wrote:
>> On 17/04/2020 10:44, Jan Beulich wrote:
>>> On 17.04.2020 10:37, Julien Grall wrote:
>>>> On 16/04/2020 16:46, Jan Beulich wrote:
>>>>> --- a/xen/arch/x86/mm/p2m.c
>>>>> +++ b/xen/arch/x86/mm/p2m.c
>>>>> @@ -1779,7 +1779,8 @@ void p2m_mem_paging_populate(struct doma
>>>>>      * mfn if populate was called for  gfn which was nominated but not evicted. In
>>>>>      * this case only the p2mt needs to be forwarded.
>>>>>      */
>>>>> -int p2m_mem_paging_prep(struct domain *d, unsigned long gfn_l, uint64_t buffer)
>>>>> +int p2m_mem_paging_prep(struct domain *d, unsigned long gfn_l,
>>>>> +                        XEN_GUEST_HANDLE_PARAM(const_uint8) buffer)
>>>>
>>>> Shouldn't this technically be XEN_GUEST_HANDLE_64() to match the field?
>>>
>>> I think an argument can be made for going either way - as a function
>>> parameter it should have the type chosen. Do you see any (possibly
>>> just latent) breakage from using _PARAM() rather than _64()?
>> I know they are the same on x86, but from an abstract PoV they are fundamentally different.
>>
>> XEN_GUEST_HANDLE_PARAM() represents a guest pointer, when pased as an
>> hypercall argument.
>>
>> XEN_GUEST_HANDLE() represents a guest pointer, when passed as a field
>> in a struct in memory.
>>
>> In this case, the guest pointer was part of a structure. So I think
>> you want to use XEN_GUEST_HANDLE().
> 
> Hmm, looks like I was confused about what the two mean. So far I was
> under the impression that _PARAM() was to be used for function
> parameters in general, not just hypercall ones. While the text near
> the macro definitions is quite clear in this regard, I'm afraid
> Stefano's original series (first and foremost commit abf06ea91d12's
> playing with e.g. handle_iomem_range()) was rather confusing than
> helpful - it looks to me as if quite a bit of the "casting" could
> actually be dropped (I'll see about doing some cleanup there). Plus
> I'm afraid other mixing of plain vs param has been introduced on
> x86, at least for dm.c:track_dirty_vram()'s calls to
> {hap,shadow}_track_dirty_vram(); this is just the first instance
> I've found - there may be more.

I agree the commit you mention above is confusing. If we follow the 
definition, then the conversion between the two internally should never 
have been done.

Maybe Stefano can clarify the intention?

>> FWIW, the different matters on Arm. Although, it looks like the
>> compiler will not warn you if you are using the wrong handler :(.
> 
> I find this highly suspicious, but can't check myself until back
> in the office - these are distinct compound types after all, so
> this shouldn't just be a warning, but an error. Or did you merely
> mean there's no warning on x86?

I mean on Arm 32-bit. I have changed one of the function to use 
XEN_GUEST_HANDLE_PARAM() rather than XEN_GUEST_HANDLE() but not changing 
the caller.

It is probably because they are both defined using an union. Interestly, 
the type will also not be checked, so the code a function will happily 
accept a XEN_GUEST_HANDLE_PARAM(uint8) even if the prototype requested 
XEN_GUEST_HANDLE_PARAM(uint64).

This looks rather messy, maybe we should use a structure (and some 
alignment) to add more safety.

Cheers,

-- 
Julien Grall

