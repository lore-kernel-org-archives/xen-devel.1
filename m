Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3C4C79F99
	for <xen-devel@archiver.kernel.org>; Sun,  6 Sep 2026 13:16:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410225.1641334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3CjF-0001PJ-Vz; Sun, 06 Sep 2026 13:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410225.1641334; Sun, 06 Sep 2026 13:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3CjF-0001PB-Qr; Sun, 06 Sep 2026 13:16:13 +0000
Received: by outflank-mailman (input) for mailman id 1410225;
 Sun, 06 Sep 2026 13:16:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1x3CjD-0001P4-N6
 for xen-devel@lists.xenproject.org; Sun, 06 Sep 2026 13:16:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3CjC-00F3Xd-Ev
 for xen-devel@lists.xenproject.org; Sun, 06 Sep 2026 15:16:10 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a9d6767-2eae-0a2a0a5409dd-0a2a4508978a-38
 for <xen-devel@lists.xenproject.org>; Sun, 06 Sep 2026 15:16:10 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a9d6799-f659-0a2a45080019-a0658309c3dc-3
 for <xen-devel@lists.xenproject.org>; Sun, 06 Sep 2026 15:16:10 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 7AEFC8356EA8;
 Sun,  6 Sep 2026 09:14:04 -0400 (EDT)
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
Date: Sun,  6 Sep 2026 14:11:14 +0100
Message-ID: <20260906131117.3121334-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d9512f79-a05c-447b-98c5-7dfb14ef5347@suse.com>
References: <d9512f79-a05c-447b-98c5-7dfb14ef5347@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1788700570-CE94287B-B2387E36/0/0
X-purgate-type: clean
X-purgate-size: 9373

On 26.08.2026 15:33, Jan Beulich wrote:
>On 23.08.2026 18:11, Abdelkareem Abdelsaamad wrote:
>> On the AMD platforms, allowing a VMRUN instruction with a malformed VMCB has
>> debugging complications, security and performance implications. The APM
>> volume #2 15.20 (40332-Rev. 4.10-July 2026) states the two possibilities that
>> result in a VMRUN exit with VMEXIT_INVALID due to the injected event. These are
>> • Reserved values of TYPE have been specified.
>> • TYPE = 3 (exception) has been specified with a vector that does not
>>   correspond to an exception (this includes vector 2, which is an NMI, not
>>   an exception).
>> 
>> Extend the VMCB validation to check for such inconsistency.
>> 
>> The collection of the invalid exception vectors are ported from the upstream
>> KVM commit
>> ("7e79f71bca5c" KVM: nSVM: Add missing consistency check for EVENTINJ). Adjust
>> the checks from the commit to align with the APM Volume #2 and Volume #3
>> (40332—Rev. 4.10—July 2026) for the X86_EXC_OF and X86_EXC_BR vectors which
>> should not be valid on the x86 64-bit (long mode) platforms. The adjustment is
>> posted to the KVM mailing commit patch thread
>> https://lore.kernel.org/all/20260803225402.2324595-1-abdelkareem.abdelsaamad@citrix.com/
>> 
>> Injecting the vector X86_EXC_HV is also found to trigger VMEXIT_INVALID with
>> the Xen hypervisor. Drop the X86_EXC_HV vector from the permitted vectors.
>
>Is this matched by anything in the PM? There is "#HV is only allowed to be
>injected into VMSAs that execute with Restricted Injection." Which suggests
>#HV can be injected, but only under a certain condition. Following what
>Teddy said towards v3, this may want expressing by a separate case block
>also returning false, but having a comment.
I will put it separately with a comment in v5.
Regarding the APM question: the manual does not appear to fully document
generation-specific or microarchitecture-dependent constraints for all the
vectors. Some vectors are only valid starting with the specific CPU generation
that introduced the corresponding feature. To verify the hardware behavior, I
am performing case-by-case testing on 64-bit Windows guests. I inject the
various events at the end of svm_vmexit_handler and see the result:
 - If it triggers VMEXIT_INVALID, the injection is invalid.
 - If it triggers a triple fault, the event passed the hardware checks and 
 completed the event delivery. It is valid.
I am testing this across a Naples (older) and a Genoa (modern) platform. For
the X86_EXC_HV, I am consistently getting VMEXIT_INVALID. I will update the
code comments in v5 with the testing matrix used and the findings.
>
>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>> @@ -320,6 +320,44 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>>      svm_dump_sel("  TR", &vmcb->tr);
>>  }
>>  
>> +static bool is_valid_injected_exception_vector(const struct vmcb_struct *vmcb,
>> +    uint8_t vmcb_injected_vector)
>> +{
>> +    switch ( vmcb_injected_vector )
>> +    {
>> +    case X86_EXC_DE:
>> +    case X86_EXC_DB:
>> +    case X86_EXC_BP:
>> +    case X86_EXC_UD:
>> +    case X86_EXC_NM:
>> +    case X86_EXC_DF:
>> +    case X86_EXC_TS:
>> +    case X86_EXC_NP:
>> +    case X86_EXC_SS:
>> +    case X86_EXC_GP:
>> +    case X86_EXC_PF:
>> +    case X86_EXC_MF:
>> +    case X86_EXC_AC:
>> +    case X86_EXC_MC:
>
>Is #MC valid to inject without CR4.MCE set?
The testing I performed (see previous comment) does not show that set CR4.MCE
is required for the valid injection.
>> +    case X86_EXC_XM:
>
>As before: Doesn't #XM (AMD: #XF) require CR4.OSXMMEXCPT to be set?
The testing I performed (see previous comment) does not show that set CR4.MCE
is required for the valid injection.
>> +    case X86_EXC_SX:
>
>Again as before: Is #SX really permitted without any constraints? You did
>reply to both comments on v3, but that outcome isn't reflected here. The
>more that what you said there could equally apply ...
The testing I performed (see the first comment) does not show that set CR4.MCE
is required for the valid injection.
>
>> +        return true;
>> +
>> +    case X86_EXC_OF:
>> +    case X86_EXC_BR:
>> +        return !(vmcb_get_efer(vmcb) & EFER_LMA) || !vmcb->cs.l;
>> +
>> +    case X86_EXC_VC:
>> +        return vmcb_get_sev_es(vmcb);
>> +
>> +    case X86_EXC_CP:
>> +        return vmcb_get_cr4(vmcb) & X86_CR4_CET;
>
>... e.g. here. That is, if a CR4 (or other) check is needed here, but not
>for #XM (or #SX), that's surely worth (briefly) commenting upon. The more
>that, afaics, none of this is spelled out in the PM.
In my testing, the hardware behavior differs across the generations support for
the Control-flow Enforcement Technology (CET):
 - Naples (No hardware support): Injecting the event when the feature is
   completely unsupported by the CPU results in VMEXIT_INVALID. The VMCB's CR4
   bit is not set as it is expected.
 - Genoa (Hardware support exists): If the CPU supports the feature but the
   guest has not enabled it in CR4 (not opted-in), injecting the event
   results in a triple fault. I am accordingly checking for the CPU feature and
   report it as invalid.
>
>> @@ -330,6 +368,12 @@ bool svm_vmcb_isvalid(
>>      unsigned long cr4 = vmcb_get_cr4(vmcb);
>>      unsigned long valid;
>>      uint64_t efer = vmcb_get_efer(vmcb);
>> +    uint8_t vmcb_injected_type = vmcb->event_inj.type;
>> +    uint8_t vmcb_injected_vector = vmcb->event_inj.vector;
>> +    uint8_t vmcb_valid_event_inj_types_mask = (1 << X86_ET_EXT_INTR) |
>> +                                              (1 << X86_ET_NMI) |
>> +                                              (1 << X86_ET_HW_EXC) |
>> +                                              (1 << X86_ET_SW_INT);
>
>The absence of X86_ET{_PRIV,}_SW_EXC likely wants a brief comment, as that's
>a peculiarity of SVM. Alternatively how about introducing X86_ET_SVM_ALL (or
>some such) as a #define somewhere?
I thought the mask varibale name is sufficient? I am also fine with the #define
but it will be a one time usage. What is your suggestion?
>> @@ -392,6 +436,20 @@ bool svm_vmcb_isvalid(
>>          PRINTF("eventinj: MBZ bits are set (%#"PRIx64")\n",
>>                 vmcb->event_inj.raw);
>>  
>> +    if ( !vmcb->event_inj.v )
>> +        PRINTF("eventinj: valid bit is not set (%#"PRIx64")\n",
>> +               vmcb->event_inj.raw);
>
>I understand the parentheses in the log message here. Yet ...
>
>> +    if ( !((1 << vmcb_injected_type) & vmcb_valid_event_inj_types_mask) )
>
>If vmcb_injected_type really could take all possible uint8_t values (see
>below), this shift would be at risk of becoming UB. And uint8_t is a
>stronger hint that all possible values may appear than unsigned int is.
I am OK to change to unsigned int for safety with future possible extensions.
>
>> +        PRINTF("eventinj: Invalid Injected Event Type: (%#"PRIx8")\n",
>> +               vmcb_injected_type);
>
>... what purpose do they serve here (and below)?
I did it just to go with the previous format but I am OK to drop in v5.
>
>As to the use of PRIx8: Imo that's unnecessary to use. We assume
>sizeof(int) >= 4, and every type smaller than that will be promoted to
>int. Just %#x will hence do here (and below), improving readability.
>Furthermore, the use of fixed-width types here is in conflict with
>./CODING_STYLE anyway. I'm willing to accept it for variables holding
>vector numbers (albeit longer term they will apparently need to widen
>anyway), but the other two should be unsigned int.
I will change to %#x and I will change the other two variables to unsigned int.
> +    if ( (vmcb_injected_type == X86_ET_HW_EXC) &&
> +         !is_valid_injected_exception_vector(vmcb, vmcb_injected_vector) )
> +        PRINTF("eventinj: Invalid exception type: (%#"PRIx8") vector: "
> +               "(%#"PRIx8") for the platform\n",
>
>Does "for the platform" really add any value? With it dropped, the
>whole format string could also go on a single line (which we generally
>prefer).
My point was to give an expressive hint as the injection combination can be
invalid on one platform/mode but valid on another (for example, #BR injection
triggers VMEXIT_INVALID in 64-bit long mode but is allowed in 32-bit mode). The
CPU generation also matter as outlined before.
>
>One more check would likely be worthwhile doing: We have X86_EXC_HAVE_EC,
>and vmcb->event_inj.ev could also do with checking.
I will test this and add the check in v5 in the case it is needed.
>
>Finally a more general comment: svm_vmcb_isvalid() is used solely out of
>nestedsvm.c. I hence think it would better move there, and such moving
>would better come ahead of adding more code (which would then also need
>moving).
This is a point that needs to reach a consensus between you and Teddy. In the
v3 review, Teddy commented to expand the use of svm_vmcb_isvalid() by calling
it within svm_vmexit_handler() when exit_reason == VMEXIT_INVALID. If I follow
Teddy's suggestion, the function needs to stay in a shared location. Otherwise,
the function will be kept, as is, strictly for nested SVM usage and moving it
>Jan



