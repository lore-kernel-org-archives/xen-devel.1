Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91EDCA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 13:08:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437230.1656066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBu2Q-0007Ji-Fd; Wed, 30 Sep 2026 13:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437230.1656066; Wed, 30 Sep 2026 13:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBu2Q-0007Jb-Ck; Wed, 30 Sep 2026 13:07:58 +0000
Received: by outflank-mailman (input) for mailman id 1437230;
 Wed, 30 Sep 2026 13:07:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1xBu2P-0007JT-0X
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:07:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBu2N-00ERJe-WA
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 15:07:56 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6abd09aa-8faa-0a2a0a5109dd-0a2a4509bb32-4
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:07:55 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6abd09aa-be1a-0a2a45090019-a06583089e44-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:07:55 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 4A2A64682326;
 Wed, 30 Sep 2026 09:05:48 -0400 (EDT)
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
To: jbeulich@suse.com,
	xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech
Subject: Re: Re: [PATCH v5] x86/nSVM: Check injected event consistency
Date: Wed, 30 Sep 2026 14:01:47 +0100
Message-ID: <20260930130151.3425085-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <a472b7db-5f87-4945-b354-dbeacce00155@suse.com>
References: <a472b7db-5f87-4945-b354-dbeacce00155@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790773675-BDCC7034-6DFB6FFC/0/0
X-purgate-type: clean
X-purgate-size: 13236

>On 25.09.2026 11:38, Abdelkareem Abdelsaamad wrote:
>> On the AMD platforms, allowing a VMRUN instruction with a malformed VMCB has
>> debugging complications, security and performance implications. The APM
>> volume #2 15.20 (40332—Rev. 4.10—July 2026) states the two possibilities that
>
>Here and elsewhere: While doc rev plus section number are sufficient to
>identify the section that is meant, that's still not very practical if
>the reader only has some other revision to hand. Far in the past we did
>establish that the main thing to mention is the section title. Those
>tend to change very infrequently, if at all.
Ack. I will update this here and elsewhere to omit the revision details and
include the title. I will format it as: 
'The APM volume #2, Section 15.20 Event Injection state ..'
>
>> VMRUN will immediately exit with VMEXIT_INVALID due to the injected event.
>> These are
>> • Reserved values of TYPE have been specified.
>> • TYPE = 3 (exception) has been specified with a vector that does not
>>   correspond to an exception (this includes vector 2, which is an NMI, not
>>   an exception).
>> 
>> Furthermore, reading through the APM shows that the exception vector validity
>> can also depend on the guest mode, the CPU generation and the
>> microarchitectural constraints. Some vectors are only valid starting with the
>> specific CPU generation that introduced the corresponding feature, the guest
>> mode or whether the guest opted-in for specific CPU capability. The Upstream
>> KVM introduced a similar consistency check that reflects on this dependency
>> with the commit
>> 7e79f71bca5c ("KVM: nSVM: Add missing consistency check for EVENTINJ").
>> However, the KVM implementation did allow the Overflow (X86_EXC_OF) and the
>> BOUND Range (X86_EXC_BR) vectors injection in 64-bit mode. According to the APM
>> Volume #2 and Volume #3 (40332—Rev. 4.10—July 2026), injecting these exceptions
>> while the guest is in 64-bit mode is invalid and triggers an immediate
>> VMEXIT_INVALID. This architectural mismatch in the KVM implementation was
>> reported here:
>> https://lore.kernel.org/all/20260803225402.2324595-1-abdelkareem.abdelsaamad@citrix.com/
>> 
>> To verify the hardware behaviour with the various vectors, A case-by-case
>> testing on 64-bit mode Windows guest is performed. The hardware exception event
>> is manually injected at the end of svm_vmexit_handler and the consequence
>> is observed:
>>  - If VMEXIT_INVALID is triggered, the injection is invalid.
>>  - If a guest triple fault is triggered, the event passed the hardware checks
>>    and completed the event delivery. It is valid.
>> 
>> Extend the VMCB validation to check for the VMCB event injection inconsistency.
>> 
>> While at it, extend the svm_vmcb_isvalid usage to the non-nested VMEXIT_INVALID
>> debugging. Clean up svm_vmcb_isvalid by dropping the unused `verbose` parameter
>> and by correcting the misleading boolean return value to properly reflect the
>> validation status.
>
>The dropping of that parameter wants splitting out. That's likely
>uncontroversial. The new use of the function also would better be split
>out (without folding with the parameter removal). And the polarity
>inversion of the function's return value wants to be a separate patch,
>too (arguably making the dropping of the parameter a secondary change
>there might be okay).
Ack. I will remove this change from the v6 series and submit it later as
a separate patch.

>> ---
>> Testing:
>>  - Using a locally developed XTF nested virt setup, I manually tested VMRUN
>>    instruction handling with a malformed VMCB:
>>    1) Inject event with the type (7).
>>       The hypervisor logs show the message
>>       (XEN) [  645.155609] d2v0[nsvm_vmcb_prepare4vmrun]: eventinj: Invalid
>>             Injected Event Type: 0x7.
>>    2) Inject event with the exception value (3) and the vector value (2) for
>>       NMI. The hypervisor logs show the message
>>       (XEN) [  645.157277] d2v0[nsvm_vmcb_prepare4vmrun]: eventinj: Invalid
>>             exception type: 0x3 vector: 0x2.
>>    3) Inject event with the exception value (3) and the vector value (21) for
>>       the X86_EXC_CP (Control-Flow Protection).
>>       Without the changes included:
>>           On the Naples host, where the vector was not yet known to the
>>           hardware. VMRUN immediately triggers VMEXIT_INVALID.
>>    4) To perform more detailed bare-metal testing, I set up a testing matrix
>>       using a XenServer Windows 10 64-bit VM and manually injected the
>>       various events according to the testing matrix below:
>> -----------------------------------------------------------------------------------
>> |Exception Vector|     AMD Naples    |     AMD Genoa    |    Testing Conditions    |
>> |----------------|-------------------|------------------|--------------------------|
>> |  - X86_EXC_OF  |  VMEXIT_INVALID   |  VMEXIT_INVALID  | - Verified that 64bit    |
>> |  - X86_EXC_BR  |                   |                  | mode is active before    |
>> |                |                   |                  | injecting the event.     |
>> |----------------|-------------------|------------------|--------------------------|
>> |                |                   |                  | - Verified that the      |
>> |                |                   |                  | Genoa host does not have |
>> |  - X86_EXC_CP  | Guest Triple fault|  VMEXIT_INVALID  | guest_cr[4] X86_CR4_CET  |
>> |                |                   |                  | set and the VMCB does not|
>> |                |                   |                  | have CR4 X86_CR4_CET set |
>> |----------------|-------------------|------------------|--------------------------|
>> |                |                   |                  | - APM states only valid  |
>> | - X86_EXC_HV   |  VMEXIT_INVALID   |  VMEXIT_INVALID  | to inject into VMSAs that|
>> |                |                   |                  | execute with Restricted  |
>> |                |                   |                  | Injection.               |
>> |----------------|-------------------|------------------|--------------------------|
>> | - X86_EXC_DE   |                   |                  | - Verified that hosts    |
>> | - X86_EXC_DB   |                   |                  | do not have guest_cr[4]  |
>> | - X86_EXC_UD   |                   |                  | X86_CR4_OSXMMEXCPT set   |
>> | - X86_EXC_BP   |                   |                  | and the VMCB does not    |
>> | - X86_EXC_NM   |                   |                  | have CR4                 |
>> | - X86_EXC_DF   |                   |                  | X86_CR4_OSXMMEXCPT set   |
>> | - X86_EXC_TS   | Guest Triple fault|Guest Triple fault| with the vector          |
>> | - X86_EXC_NP   |                   |                  | X86_EXC_XM.              |
>> | - X86_EXC_SX   |                   |                  | with the vector          |
>> |                |                   |                  | X86_EXC_MC.              |
>> |----------------|-------------------|------------------|--------------------------|
>> | - X86_EXC_CSO  |                   |                  |                          |
>> | - X86_EXC_SPV  |                   |                  |                          |
>> | - X86_EXC_VE   |  VMEXIT_INVALID   |  VMEXIT_INVALID  |                          |
>> | - X86_EXC_VC   |                   |                  |                          |
>>  ----------------------------------------------------------------------------------
>
>Hmm, #XM and #MC don't appear in the leftmost column. They're mentioned in the
>rightmost one, albeit there looks to be some corruption there.
I will correct the formatting and add #XM and #MC to the leftmost column in the
v6.

>Also, nit: The leading dashes in the leftmost column don't add any value, and
>may hence better be omitted. Uniform leading padding there would further avoid
>the (visual) impression that there's something wrong with the contents.
I will omit the leading dashes in v6.

>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>> @@ -327,20 +327,91 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>>      svm_dump_sel("  TR", &vmcb->tr);
>>  }
>>  
>> +static bool is_valid_injected_exception_vector(const struct vmcb_struct *vmcb,
>> +    uint8_t vmcb_injected_vector, const struct vcpu *v)
>
>If you indent the 2nd line like this, the first argument wants to also move
>off of the 1st line:
>
>static bool is_valid_injected_exception_vector(
>    const struct vmcb_struct *vmcb,
>    uint8_t vmcb_injected_vector,
>    const struct vcpu *v)
>
>Additionally, as shown, it is then also better to have one line per parameter
>(albeit we may not be consistent there).
>
>Alternatively:
>
>static bool is_valid_injected_exception_vector(const struct vmcb_struct *vmcb,
>                                               uint8_t vmcb_injected_vector, 
>                                               const struct vcpu *v)
Ack. I will fix the function parameter indentation in the v6.
>> +    case X86_EXC_BR:
>> +        return !(vmcb_get_efer(vmcb) & EFER_LMA) || !vmcb->cs.l;
>
>I'd like to suggest to combine #OF and #BR handling (to also better fit
>commentary), e.g.:
>
>    case X86_EXC_OF:
>        if ( vmcb_get_sev_es(vmcb) )
>            return false;
>        fallthrough;
>    case X86_EXC_BR:
>        return !(vmcb_get_efer(vmcb) & EFER_LMA) || !vmcb->cs.l;
Ack. I will change this as suggested in v6.
>> +    case X86_EXC_CP:
>> +    {
>> +        unsigned long guest_valid_cr4 = hvm_cr4_guest_valid_bits(v->domain);
>> +        return guest_valid_cr4 & X86_CR4_CET;
>> +    }
>
>I continue to disagree. While this tries to match what the table says, it
>still isn't correct to key this to the bits a guest _might_ set. Imo AMD
>have screwed up there, and #CP shouldn't have been valid to inject on
>pre-CET hardware. For our purposes, consider a guest migrating from a
>Naples host to a Genoa one: It'll suddenly observe different behavior (if
>#CP injection was attempted in the first place).
>
Ugh. I looked back at the testing matrix and realized the results recorded for
Naples and Genoa were accidentally swapped.
The right result is that it is not valid to inject on pre-CET hardware (Naples).
I will correct the testing matrix result entry in the v6.
>This will then also fit the returning of "false" in the default case.
>Prior to the introduction of #CP and CR4.CET the handling of vector 0x15
>would also have ended up there, after all. Such a hypothetical "old" Xen
>would have behaved uniformly on CET-incapable and CET-capable hardware.
>(The same obviously is true for any new exception types we may get to see
>down the road.)
>> +    /*
>> +     * X86_EXC_HV vector is reserved for SNP guests use. Only allowed to be
>> +     * injected into VMSAs that execute with Restricted Injection.
>> +     * See the APM Volume #2 15.36 (40332—Rev. 4.10—July 2026).
>> +     */
>> +    case X86_EXC_HV:
>> +    default:
>> +        return false;
>> +    }
>> +}
>> +
>>  bool svm_vmcb_isvalid(
>> -    const char *from, const struct vmcb_struct *vmcb, const struct vcpu *v,
>> -    bool verbose)
>> +    const char *from, const struct vmcb_struct *vmcb, const struct vcpu *v)
>>  {
>> -    bool ret = false; /* ok */
>> +    bool ret = true; /* ok */
>>      unsigned long cr0 = vmcb_get_cr0(vmcb);
>>      unsigned long cr3 = vmcb_get_cr3(vmcb);
>>      unsigned long cr4 = vmcb_get_cr4(vmcb);
>>      unsigned long valid;
>>      uint64_t efer = vmcb_get_efer(vmcb);
>> +    unsigned int vmcb_injected_type = vmcb->event_inj.type;
>> +    unsigned int vmcb_injected_vector = vmcb->event_inj.vector;
>> +    /*
>> +     * Represent the nonreserved and accoridngly valid guest exception or
>> +     * interrupt type.
>> +     * See the APM Volume #2 15.20 (40332—Rev. 4.10—July 2026).
>> +     */
>> +    unsigned long vmcb_valid_event_inj_types_mask = (1 << X86_ET_INTR) |
>> +                                                    (1 << X86_ET_NMI) |
>> +                                                    (1 << X86_ET_HW_EXC) |
>> +                                                    (1 << X86_ET_SW_INT);
>
>Why unsigned long when unsigned int would do? There's also no need for ...
I will switch the mask to unsigned int and update the shift to use 1U in the v6.
>> +        PRINTF("eventinj: Invalid Injected Event Type: %#x\n",
>> +               vmcb_injected_type);
>> +
>> +    if ( (vmcb_injected_type == X86_ET_HW_EXC) &&
>> +         !is_valid_injected_exception_vector(vmcb, vmcb_injected_vector, v) )
>> +        PRINTF("eventinj: Invalid exception type: %#x vector: %#x\n",
>> +               vmcb_injected_type, vmcb_injected_vector);
>Logging vmcb_injected_type here isn't very useful: It's known to be
>X86_ET_HW_EXC.
I will drop the logging of vmcb_injected_type in the v6.

