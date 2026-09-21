Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E35C982E6
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 15:57:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427694.1650496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8gNo-0007aN-K6; Mon, 21 Sep 2026 15:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427694.1650496; Mon, 21 Sep 2026 15:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8gNo-0007aG-HW; Mon, 21 Sep 2026 15:56:44 +0000
Received: by outflank-mailman (input) for mailman id 1427694;
 Mon, 21 Sep 2026 15:56:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1x8gNm-0007aA-TG
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 15:56:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8gNm-00546Y-72
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 17:56:42 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6ab153a8-bab6-0a2a0a5309dd-0a2a4501cada-24
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 17:56:42 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6ab153b9-5984-0a2a45010019-a06583089440-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 17:56:42 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 170CC44B8956;
 Mon, 21 Sep 2026 11:54:39 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: xen-devel@lists.xenproject.org,
	jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech
Subject: Re: Re: [PATCH v4] x86/nSVM: Check injected event consistency
Date: Mon, 21 Sep 2026 16:50:56 +0100
Message-ID: <20260921155103.3243475-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <v4-586da975-bd71-4305-a17e-cd5ba35995a4@suse.com>
References: <v4-586da975-bd71-4305-a17e-cd5ba35995a4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1790006202-1E867757-AD78F3BA/0/0
X-purgate-type: clean
X-purgate-size: 5890

On 07.09.2026 08:50, Jan Beulich wrote:
>On 06.09.2026 15:11, Abdelkareem Abdelsaamad wrote:
>> On 26.08.2026 15:33, Jan Beulich wrote:
>>> On 23.08.2026 18:11, Abdelkareem Abdelsaamad wrote:
>>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>>> @@ -320,6 +320,44 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>>>>      svm_dump_sel("  TR", &vmcb->tr);
>>>>  }
>>>>  
>>>> +static bool is_valid_injected_exception_vector(const struct vmcb_struct *vmcb,
>>>> +    uint8_t vmcb_injected_vector)
>>>> +{
>>>> +    switch ( vmcb_injected_vector )
>>>> +    {
>>>> +    case X86_EXC_DE:
>>>> +    case X86_EXC_DB:
>>>> +    case X86_EXC_BP:
>>>> +    case X86_EXC_UD:
>>>> +    case X86_EXC_NM:
>>>> +    case X86_EXC_DF:
>>>> +    case X86_EXC_TS:
>>>> +    case X86_EXC_NP:
>>>> +    case X86_EXC_SS:
>>>> +    case X86_EXC_GP:
>>>> +    case X86_EXC_PF:
>>>> +    case X86_EXC_MF:
>>>> +    case X86_EXC_AC:
>>>> +    case X86_EXC_MC:
>>>
>>> Is #MC valid to inject without CR4.MCE set?
>> The testing I performed (see previous comment) does not show that set CR4.MCE
>> is required for the valid injection.
>
>I find this worrying. Roger, any chance you could try to find out whether
>that's perhaps more an erratum than intended behavior?
>
I believe X86_EXC_MC was introduced long before AMD CPUs with SVM. Therefore,
on all the SVM-capable CPUs I am targeting, it is valid to trigger this
exception vector regardless of whether the guest has explicitly opted in for
the capability.
That said, if Roger can double-check and confirm this behavior, it would be
highly appreciated.

>>>> +        return true;
>>>> +
>>>> +    case X86_EXC_OF:
>>>> +    case X86_EXC_BR:
>>>> +        return !(vmcb_get_efer(vmcb) & EFER_LMA) || !vmcb->cs.l;
>>>> +
>>>> +    case X86_EXC_VC:
>>>> +        return vmcb_get_sev_es(vmcb);
>>>> +
>>>> +    case X86_EXC_CP:
>>>> +        return vmcb_get_cr4(vmcb) & X86_CR4_CET;
>>>
>>> ... e.g. here. That is, if a CR4 (or other) check is needed here, but not
>>> for #XM (or #SX), that's surely worth (briefly) commenting upon. The more
>>> that, afaics, none of this is spelled out in the PM.
>> In my testing, the hardware behavior differs across the generations support for
>> the Control-flow Enforcement Technology (CET):
>>  - Naples (No hardware support): Injecting the event when the feature is
>>    completely unsupported by the CPU results in VMEXIT_INVALID. The VMCB's CR4
>>    bit is not set as it is expected.
>>  - Genoa (Hardware support exists): If the CPU supports the feature but the
>>    guest has not enabled it in CR4 (not opted-in), injecting the event
>>    results in a triple fault. I am accordingly checking for the CPU feature and
>>    report it as invalid.
>
>A guest triple fault, I assume?
Yes, that is correct. I meant a guest triple fault.
> I'm not entirely convinced this is a sufficient
>indication of injection being permitted, even though I agree it very much looks
>so. Then again, like above, I'm also unconvinced this is actually intended
>behavior. Guests unaware of a feature (and hence not enabling it) should never
>observe exceptions related to only that feature.
The testing, I performed shows the following behavior across the CPU
generations:
 - On CPUU generations that support the feature (e.g., Genoa supporting 
   Control-flow Enforcement Technology / CET), the injection results in
   a guest triple fault. If the the guest did not opt-in for the CET feature.
   No VMEXIT_INVALID results by the injection.
 - On older hardware generations that completely lack the feature (e.g., Naples), 
   the injection immediately results in a VMEXIT_INVALID.

The current hardware behavior seems to depend on whether the underlying
physical CPU understands the feature, rather than whether the guest has opted
into it via CR4. The patch expands this to consider the injection will result
in VMEXIT_INVALID if the guest did not opt into the feature.

Are you suggesting to reather explicitly check the CPU model/generation instead
of checking X86_CR4_CET? For example, allowing the injection on Genoa platforms
regardless of whether the guest has enabled the CET capability? I am concerned 
that handling this via CPU model checks might introduce architectural edge
cases and/or add maintenance complication—what are your thoughts on that
approach?

>>>> @@ -392,6 +436,20 @@ bool svm_vmcb_isvalid(
>>>>          PRINTF("eventinj: MBZ bits are set (%#"PRIx64")\n",
>>>>                 vmcb->event_inj.raw);
>>>>  
>>>> +    if ( !vmcb->event_inj.v )
>>>> +        PRINTF("eventinj: valid bit is not set (%#"PRIx64")\n",
>>>> +               vmcb->event_inj.raw);
>>>
>>> I understand the parentheses in the log message here. Yet ...
>>>
>>>> +    if ( !((1 << vmcb_injected_type) & vmcb_valid_event_inj_types_mask) )
>>>
>>> If vmcb_injected_type really could take all possible uint8_t values (see
>>> below), this shift would be at risk of becoming UB. And uint8_t is a
>>> stronger hint that all possible values may appear than unsigned int is.
>> I am OK to change to unsigned int for safety with future possible extensions.
>>>
>>>> +        PRINTF("eventinj: Invalid Injected Event Type: (%#"PRIx8")\n",
>>>> +               vmcb_injected_type);
>>>
>>> ... what purpose do they serve here (and below)?
>> I did it just to go with the previous format but I am OK to drop in v5.
>
>You did notice the difference in message type, though? Where parentheses
>are used in existing messages, the values put there serve as auxiliary
>information to the wording used. Whereas here you plainly dump a value,
>without saying what exactly is wrong (that's actually said by the value
>dumped).
Got it. I will drop the parentheses in v5.

