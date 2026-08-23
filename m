Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFED6C5DF97
	for <xen-devel@archiver.kernel.org>; Sun, 23 Aug 2026 14:29:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398437.1634727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wy9Bc-0000ta-Mi; Sun, 23 Aug 2026 14:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398437.1634727; Sun, 23 Aug 2026 14:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wy9Bc-0000tS-H9; Sun, 23 Aug 2026 14:28:36 +0000
Received: by outflank-mailman (input) for mailman id 1398437;
 Sun, 23 Aug 2026 14:28:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wy9Ba-0000tM-SH
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2026 14:28:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wy9Ba-003hFF-98
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2026 16:28:34 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a8b0337-bab6-0a2a0a5309dd-0a2a450abd48-48
 for <xen-devel@lists.xenproject.org>; Sun, 23 Aug 2026 16:28:34 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a8b0391-f2d2-0a2a450a0019-a065830982a4-3
 for <xen-devel@lists.xenproject.org>; Sun, 23 Aug 2026 16:28:34 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 42672839A6CA;
 Sun, 23 Aug 2026 10:26:35 -0400 (EDT)
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
Subject: Re: Re: [PATCH v3] x86/nSVM: Check injected event consistency
Date: Sun, 23 Aug 2026 15:24:24 +0100
Message-ID: <20260823142426.2931564-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <affe36be-1638-4ff1-bbc1-d970f3547abe@suse.com>
References: <affe36be-1638-4ff1-bbc1-d970f3547abe@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1787495314-59BC0CFC-2B175EBE/0/0
X-purgate-type: clean
X-purgate-size: 6062

On 13.08.2026 10:12, Jan Beulich wrote:
>On 06.08.2026 19:23, Abdelkareem Abdelsaamad wrote:
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
>> (40332—Rev. 4.40—July 2026) for the X86_EXC_OF and X86_EXC_BR vectors which
>
>Isn't this 4.10, just like you have it further up?
Yes, that's correct. I'll fix this to 4.10 in v4.
>> should not be valid on the x86 64-bit (long mode) platforms. The adjustment is
>> posted to the KVM mailing commit patch thread
>> https://lore.kernel.org/all/20260803225402.2324595-1-abdelkareem.abdelsaamad@citrix.com/
>> 
>> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
>> ---
>> Changes in v3:
>> - Restricted X86_EXC_OF (4) and X86_EXC_BR (5) vector injections to 
>>   non-64-bit guests to prevent impossible guest-mode state injections
>>   per AMD APM Volumes 2 & 3.
>> - Refactored exception vector validation from if-conditions to a switch
>>   statement to improve readability and extensibility.
>> - Restricted X86_EXC_CP (21) vector injection to hosts with enabled CET
>>   to prevent VMRUN failures on hardware without CET support.
>
>When reading this, I was puzzled, but the code below is correct: It's not
>the host you check, but the guest's CR4.
Right, this should refer to the guest's CR4. I will update this in v4.
>> @@ -320,6 +320,41 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>>      svm_dump_sel("  TR", &vmcb->tr);
>>  }
>>  
>> +static bool is_valid_svm_vmcb_injected_exception_vector(
>
>Is in particular "svm" but perhaps also "vmcb" really relevant in the name
>here (which is a static helper)?
I will change to a shorter function name is_valid_injected_exception_vector in
v4.
>
>> +    const struct vmcb_struct *vmcb, uint8_t vmcb_injected_vector)
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
>> +    case X86_EXC_XM:
>
>Doesn't #XM (AMD: #XF) require CR4.OSXMMEXCPT to be set?
This logic was ported and adopted from the KVM. The intent is to avoid
injecting invalid events on the platforms where the vector is entirely
reserved, rather than blocking valid events where a capability is not
opted-in.The X86_EXC_XM vector is valid (not reserved) on SVM-supported
platforms. I performed some testing with Naples and Genoa platforms, injecting
this vector resulted in a guest triple fault rather than a VMEXIT_INVALID. This
shows that event delivery succeeded and did not trigger VMEXIT_INVALID
>
>> +    case X86_EXC_HV:
>> +    case X86_EXC_SX:
>
>Are #HV and #SX really permitted without any constraints?
The same reasoning for X86_EXC_SX applies here.

For X86_EXC_HV, this vector is associated with SEV-SNP guests on AMD platforms.
I performed testing on both Genoa and Naples guests, injecting this event
always triggered a VMEXIT_INVALID. Based on these results, I will drop this
specific vector from the permitted events in v4.
>
>> +        return true;
>> +    case X86_EXC_OF:
>> +    case X86_EXC_BR:
>> +        return !(vmcb_get_efer(vmcb) & EFER_LMA) || !(vmcb->cs.l);
>
>Nit: No need for parentheses on the rhs of the ||.
I will drop in v4.
>
>> +    case X86_EXC_VC:
>> +        return vmcb_get_sev_es(vmcb);
>> +    case X86_EXC_CP:
>> +        return !!(vmcb_get_cr4(vmcb) & X86_CR4_CET);
>
>No need for !! when converting to bool.
I will drop in v4.
>
>> +    default:
>> +        return false;
>> +    }
>
>Throughout: Blank lines please between non-fall-through case blocks.
I will change in v4.
>
>> @@ -392,6 +433,16 @@ bool svm_vmcb_isvalid(
>>          PRINTF("eventinj: MBZ bits are set (%#"PRIx64")\n",
>>                 vmcb->event_inj.raw);
>>  
>> +    if ( !((1 << vmcb_injected_type) & vmcb_valid_event_inj_types_mask) )
>> +        PRINTF("eventinj: Invalid Injected Event Type: (%#"PRIx8")\n",
>> +               vmcb_injected_type);
>> +
>> +    if ( (vmcb_injected_type == X86_ET_HW_EXC) &&
>> +         !is_valid_svm_vmcb_injected_exception_vector(
>> +             vmcb, vmcb_injected_vector) )
>
>Nit: Indentation is off by one here. The anchor on the earlier line isn't the
>'!' but the 'i'.
I will change in v4.
>
>> +        PRINTF("eventinj: Invalid Injected Event. Exception type: 
>> (%#"PRIx8"),"
>> +               " with a vector: (%#"PRIx8") does not belong to an exception 
>> on"
>> +               " the platform \n", vmcb_injected_type, vmcb_injected_vector);
>
>This message is quite a bit too long. There's also a stray blank ahead of the
>\n. And further arguments after one that was already wrapped across lines want
>to start on a separate line.
I will properly wrap the subsequent arguments in v4. I will change the message
to be more concise to something like
"eventinj: Invalid exception type: (%#"PRIx8") vector: (%#"PRIx8") for the "
"platform\n"
>
>Jan

