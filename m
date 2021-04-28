Return-Path: <SRS0=iCHD=JZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6026DC433B4
	for <xen-devel@archiver.kernel.org>; Wed, 28 Apr 2021 09:19:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E777A613F3
	for <xen-devel@archiver.kernel.org>; Wed, 28 Apr 2021 09:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E777A613F3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.119128.225486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgLQ-0008WO-8B; Wed, 28 Apr 2021 09:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119128.225486; Wed, 28 Apr 2021 09:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgLQ-0008WH-3q; Wed, 28 Apr 2021 09:18:56 +0000
Received: by outflank-mailman (input) for mailman id 119128;
 Wed, 28 Apr 2021 09:18:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbgLO-0008WB-9D
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 09:18:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69d4ed58-6e59-47c4-94e4-afbb7affc701;
 Wed, 28 Apr 2021 09:18:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE84DAFE8;
 Wed, 28 Apr 2021 09:18:52 +0000 (UTC)
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
X-Inumbo-ID: 69d4ed58-6e59-47c4-94e4-afbb7affc701
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619601532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RjpndbxELtnnZIDfTz2mogtdoeO4SpIH65kAzKgtwpM=;
	b=kT0cE9MbINLhmeFsGV0EztM49az/GkNCR3A8IfIFev74psNumwHAJC6pWqmIWFL49g8cSE
	YOuL4XSKedROj3eF27jFdo7fk+GoeW38aMLxuvfoMpgyQaFel4wLiZCsdXYsoue3kJloPG
	2h57ouUrschT5DBrdzGca39UmFPo3ew=
Subject: Re: [PATCH 3/3] x86/VT-x: Enumeration for CET
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <20210426175421.30497-4-andrew.cooper3@citrix.com>
 <d5ae2cf3-1157-d589-6c1d-8717a45a2753@suse.com>
 <0cebcfeb-68d2-f225-11a2-6d39a4a353dd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a82e93b4-ad2e-536d-a015-1f41cc61b217@suse.com>
Date: Wed, 28 Apr 2021 11:18:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0cebcfeb-68d2-f225-11a2-6d39a4a353dd@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.04.2021 18:27, Andrew Cooper wrote:
> On 27/04/2021 16:56, Jan Beulich wrote:
>> On 26.04.2021 19:54, Andrew Cooper wrote:
>>> VT-x has separate entry/exit control for loading guest/host state.  Saving
>>> guest state on vmexit is performed unconditionally.
>> With the latter I find ...
>>
>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>> @@ -2014,6 +2014,9 @@ void vmcs_dump_vcpu(struct vcpu *v)
>>>      printk("RFLAGS=0x%08lx (0x%08lx)  DR7 = 0x%016lx\n",
>>>             vmr(GUEST_RFLAGS), regs->rflags,
>>>             vmr(GUEST_DR7));
>>> +    if ( vmentry_ctl & VM_ENTRY_LOAD_GUEST_CET )
>>> +        printk("SSP = 0x%016lx S_CET = 0x%016lx ISST = 0x%016lx\n",
>>> +               vmr(GUEST_SSP), vmr(GUEST_S_CET), vmr(GUEST_ISST));
>> ... the conditional here a little odd, but I expect the plan is
>> to have the various bits all set consistently once actually
>> enabling the functionality.
> 
> TBH, the general behaviour here is poor.
> 
> What happens now, as Xen does use CET itself, is that Xen's values
> propagate into guest context, and are written back into the VMCS on
> VMExit.  There is no way to turn this behaviour off AFAICT.
> 
> Therefore, we must not print the guest values when the vCPU isn't
> configured for CET, because otherwise we'd be rendering what is actually
> Xen state, in the guest state area.
> 
> Once a VM is using CET, we'll have both VM_ENTRY_LOAD_GUEST_CET and
> VM_EXIT_LOAD_HOST_CET set.

As I did assume then, so fair enough.

> There is theoretically an optimisations to be had for a hypervisor not
> using CET, to only use the VM_ENTRY_LOAD_GUEST_CET control and leave
> VM_EXIT_LOAD_HOST_CET clear, but getting this optimisation wrong will
> leave the VMM running with guest controlled values.
> 
> Personally, I think it was be a far safer interface for there only to be
> a single bit to control "switch CET state" or not.

I agree, but this then goes for other state having multiple controls
as well, I guess. I've been wondering whether this separation somehow
helps them with the implementation of the guest-save, host-load, and
guest-load steps.

Jan

