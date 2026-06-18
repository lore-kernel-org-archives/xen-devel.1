Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC94CCD98F2
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2026 12:49:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1341127.1601676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waCBB-0000ge-53; Thu, 18 Jun 2026 12:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341127.1601676; Thu, 18 Jun 2026 12:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waCBB-0000gX-1E; Thu, 18 Jun 2026 12:49:09 +0000
Received: by outflank-mailman (input) for mailman id 1341127;
 Thu, 18 Jun 2026 12:49:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1waCB9-0000gN-Pw
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 12:49:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waCB9-008JRa-6o
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:49:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a33e934-bab6-0a2a0a5309dd-0a2a4506d528-34
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:49:06 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a33e940-b690-0a2a45060019-888fbc3352b5-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:49:05 +0200
Received: by mx.zohomail.com with SMTPS id 1781786941670217.4886731259653;
 Thu, 18 Jun 2026 05:49:01 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1781786943; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V35hGhBAXmI4Sb14UhtVaYgWPyiOlSLqndTPTAB069PMWkIJpKxS64hK03c5NwiHS49zgi/ru0QiRdpY65kMhN9b5wSAxoY8l8PY1AzX8PoKupSRBoUGy3wC0ZpXZ+y3Mi5UROKBFkldex+3lVrv0keZEHceji00v32PYlLrp8I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781786943; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pILEMyw5gCxqIrCUuBXTTwRSJypX7InxQ7qQLI/bSBI=; 
	b=n7+iJvVogihZrYC0szI1+oSzoD4oFyZMo1576KsLilXxICRA0pLerG5vrnIlizXRVLce0pCFvT92NnOIcSxmXdyi6utANEHxjd8DK0CJZZCaOmaYlywJeoSn/lPr+7xHJWrWtvxdYvbq6MsKTONCIJXzB/FxzoUL7t3om0aDsug=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781786942;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pILEMyw5gCxqIrCUuBXTTwRSJypX7InxQ7qQLI/bSBI=;
	b=qwY7wTuTCFiQwV+ZoMU3Fada2lh8YnTirHFX+L16aPmU6DMU8x270hvboxrphqGF
	Dsxq09H9D78ShFH+7cK+RUy55ATXz7W4IgVKHOSrCknDczrvVxVSKtdwSCHk38VHPCn
	nKuXaJEnMWawPF9StmrLm4e+lVHPe4+NkncUdqb4=
Message-ID: <23a1961c-29ea-42fe-ab1d-f185af449d37@apertussolutions.com>
Date: Thu, 18 Jun 2026 08:49:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] XSM: guard .sysctl() and .readconsole() hooks
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <bf642902-7235-45a8-a470-f164a930c0c1@suse.com>
 <8536e453-423d-45a0-bb82-38283eca4786@citrix.com>
 <0604a985-96fc-454f-b9a1-242bc6cce9b6@suse.com>
 <e5443d3c-a3ec-4698-b20e-b867f150aa5e@apertussolutions.com>
 <31bcc003-d876-4298-8edf-3fd3a07eda96@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <31bcc003-d876-4298-8edf-3fd3a07eda96@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-16d1c6/1781786945-B07FB853-37D78803/0/0
X-purgate-type: clean
X-purgate-size: 2300



On 6/18/26 8:43 AM, Jan Beulich wrote:
> On 18.06.2026 14:40, Daniel P. Smith wrote:
>> On 6/18/26 8:23 AM, Jan Beulich wrote:
>>> On 18.06.2026 14:13, Andrew Cooper wrote:
>>>> On 18/06/2026 12:32 pm, Jan Beulich wrote:
>>>>> Leaving the hook pointers in struct xsm_ops when !SYSCTL would lead to
>>>>> the BUG_ON() in xsm_fixup_ops() triggering for respectively configured
>>>>> hypervisors.
>>>>>
>>>>> While moving the #ifdef for the corresponding xsm_*() wrappers, also move
>>>>> those for xsm_page_offline() (where the hook pointer field already is
>>>>> suitably guarded).
>>>>>
>>>>> Fixes: c9eabaa03a68 ("xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL")
>>>>> Fixes: bddd9af6049f ("xen/sysctl: wrap around XEN_SYSCTL_readconsole")
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> Ugly.  We probably ought to see about booting the RANDCONFIG hypervisor
>>>> too, which should be able to spot things like this.
>>>>
>>>> This is a regression vs 4.21, so does need including.
>>>
>>> Aiui it's a regression vs 4.20, i.e. will want backporting to 4.21.
>>>
>>>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...
>>>
>>> Thanks.
>>>
>>>>> --- a/xen/include/xsm/xsm.h
>>>>> +++ b/xen/include/xsm/xsm.h
>>>>> @@ -61,8 +61,10 @@ struct xsm_ops {
>>>>>    #endif
>>>>>        int (*set_target)(struct domain *d, struct domain *e);
>>>>>        int (*domctl)(struct domain *d, struct xen_domctl *op);
>>>>> +#ifdef CONFIG_SYSCTL
>>>>>        int (*sysctl)(int cmd);
>>>>>        int (*readconsole)(uint32_t clear);
>>>>> +#endif
>>>>
>>>> ... this is now the 3rd CONFIG_SYSCTL in xsm_ops.
>>>>
>>>> I know it will grow the diff, but can we see about collecting them into
>>>> a single region, and in dummy_ops too?  It will shrink the overall
>>>> result, and the order of pointers in this ops structure is uninteresting.
>>>
>>> I have a far more consolidating patch in the works, which is how I actually
>>> noticed the issue. I'd prefer to keep things as simple as possible here.
>>
>> Would also be good to clean up flask_ops similarly.
> 
> Hence the "far more consolidating" - that'll happen (implicitly) all in one
> go.
> 

Perfect. Just wanted to be sure it was on your radar.

v/r,
dps



