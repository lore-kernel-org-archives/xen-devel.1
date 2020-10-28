Return-Path: <SRS0=61/H=ED=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5425C55178
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 08:06:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24E8F24198
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 08:06:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="BUFi2akJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24E8F24198
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.13348.33915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXgTO-0005tq-Dd; Wed, 28 Oct 2020 08:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13348.33915; Wed, 28 Oct 2020 08:06:22 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXgTO-0005tj-Ae; Wed, 28 Oct 2020 08:06:22 +0000
Received: by outflank-mailman (input) for mailman id 13348;
 Wed, 28 Oct 2020 08:06:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXgTN-0005te-4K
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:06:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f40e969-a113-4afe-a8db-7a296aecc6d8;
 Wed, 28 Oct 2020 08:06:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F1D5AC8B;
 Wed, 28 Oct 2020 08:06:19 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXgTN-0005te-4K
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:06:21 +0000
X-Inumbo-ID: 3f40e969-a113-4afe-a8db-7a296aecc6d8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3f40e969-a113-4afe-a8db-7a296aecc6d8;
	Wed, 28 Oct 2020 08:06:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603872379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HMtT7KXdpk1APyRvlE2ER2cCchJyToR0mxmgX9rkDSY=;
	b=BUFi2akJ5ygMmX4CLyOao/LpEZ1BnlF+k3FP3mig1CBkPSY21mqCwInfR07ZeGcHMSAqtu
	Z5sG3WJtNgGhevAbM6H9s23haU0rKPPkbpEy0+rW9ScBBFwkgvRs/BAqo3O40nvn/c0HR+
	R9nORU1ajyxBuyO8LEPVNhIG7wwQYMk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0F1D5AC8B;
	Wed, 28 Oct 2020 08:06:19 +0000 (UTC)
Subject: Re: [PATCH] x86/svm: Merge hsa and host_vmcb to reduce memory
 overhead
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201026135043.15560-1-andrew.cooper3@citrix.com>
 <ec123127-786a-02e9-07dd-351f30b6a5b3@suse.com>
 <6acb623c-27bd-2d2d-c7c3-52c9ff1a1bf5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <731eceae-ab67-8176-2576-549426780316@suse.com>
Date: Wed, 28 Oct 2020 09:06:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6acb623c-27bd-2d2d-c7c3-52c9ff1a1bf5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.10.2020 20:30, Andrew Cooper wrote:
> On 27/10/2020 15:24, Jan Beulich wrote:
>> On 26.10.2020 14:50, Andrew Cooper wrote:
>>> The format of the Host State Area is, and has always been, a VMCB.  It is
>>> explicitly safe to put the host VMSAVE data in.
>> Nit: The PM calls this "Host Save Area" or "Host State Save Area"
>> afaics.
>>
>> I recall us discussing this option in the past, and not right
>> away pursuing it because of it not having been explicit at the
>> time. What place in the doc has made this explicit?
> 
> Sadly still not yet, but the pestering has happened.
> 
>> The main
>> uncertainty (without any explicit statement) on my part would be
>> the risk of VMSAVE writing (for performance reasons) e.g. full
>> cache lines, i.e. more than exactly the bits holding the state
>> to be saved, without first bringing old contents in from memory.
> 
> SEV-ES now requires the hypervisor to program desired exit state in in
> the VMCB, due to differences in how the VMRUN instruction works.  See
> Vol3 15.35.8.  (And yes - this does contradict the earlier statement in
> that a the hypervisor must not write directly into the host state area).
> 
> I have had it confirmed by AMD that it is safe to use in this fashion,
> but if you want more evidence, KVM has had this behaviour on AMD for its
> entire lifetime.

Ah, interesting.

>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>> @@ -72,11 +72,10 @@ static void svm_update_guest_efer(struct vcpu *);
>>>  static struct hvm_function_table svm_function_table;
>>>  
>>>  /*
>>> - * Physical addresses of the Host State Area (for hardware) and vmcb (for Xen)
>>> - * which contains Xen's fs/gs/tr/ldtr and GSBASE/STAR/SYSENTER state when in
>>> - * guest vcpu context.
>>> + * Host State Area.  This area is used by the processor in non-root mode, and
>>> + * contains Xen's fs/gs/tr/ldtr and GSBASE/STAR/SYSENTER state required to
>>> + * leave guest vcpu context.
>>>   */
>>> -static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, hsa);
>>>  static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, host_vmcb);
>> The comment now applies to host_vmcb, so making the dual purpose
>> more obvious would imo be helpful.
> 
> But it isn't dual purpose.  It *is* host state, both the half which
> VMRUN deals with, and the half which VMLOAD/SAVE deals with (separately,
> to optimise VMRUN).

It is host state, yes, and if you would spell it "host state area"
(and perhaps even omit "area") it would look less dual purpose,
because the use of capitals (to me at least) suggests you refer to
HSA (as used e.g. in the MSR name). The dual purpose really is
that (a) the address gets put in the respective MSR and (b) the
thing also gets directly accessed as a VMCB. Just like the comment
originally said. Yes, in the end it's cumulative host state.

Is there any reason why you can't mostly keep the original comment,
merely starting with singular "Physical address of ..."? (Of course
I'd then still prefer if "Host State Area" was changed to either of
the two terms actually used by the PM.)

Jan

