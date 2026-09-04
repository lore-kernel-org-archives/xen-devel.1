Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8007C79F82
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 15:15:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408721.1641119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Vd5-0008VG-Qr; Fri, 04 Sep 2026 15:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408721.1641119; Fri, 04 Sep 2026 15:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Vd5-0008V9-Ne; Fri, 04 Sep 2026 15:14:59 +0000
Received: by outflank-mailman (input) for mailman id 1408721;
 Fri, 04 Sep 2026 15:14:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1x2Vd4-0008V3-Cs
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 15:14:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Vd3-006clq-MN
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 17:14:57 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a9ae06f-8faa-0a2a0a5109dd-0a2a450787d4-6
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 17:14:57 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a9ae070-b4ea-0a2a45070019-a0658309acea-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 17:14:57 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id B1B2883C64ED;
 Fri,  4 Sep 2026 11:12:52 -0400 (EDT)
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
	teddy.astie@vates.tech
Cc: andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	jbeulich@suse.com
Subject: Re: Re: [PATCH v3] x86/nSVM: Check injected event consistency
Date: Fri,  4 Sep 2026 16:10:10 +0100
Message-ID: <20260904151014.3113677-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <1787565706.8631fc262581453bbf619ec5b2062170.1a033380dce000c4f3@vates.tech>
References: <1787565706.8631fc262581453bbf619ec5b2062170.1a033380dce000c4f3@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1788534897-A54C3AE4-D82F6540/0/0
X-purgate-type: clean
X-purgate-size: 4351

On 24.08.2026 12:12, Teddy Astie wrote:
>On 06.08.2026 19:26, Abdelkareem Abdelsaamad wrote:
>> On the AMD platforms, allowing a VMRUN instruction with a malformed VMCB has
>> debugging complications, security and performance implications. The APM
>> volume #2 15.20 (40332-Rev. 4.10-July 2026) states the two possibilities that
>> result in a VMRUN exit with VMEXIT_INVALID due to the injected event. These are
>> • Reserved values of TYPE have been specified.
>> • TYPE = 3 (exception) has been specified with a vector that does not
>>    correspond to an exception (this includes vector 2, which is an NMI, not
>>    an exception).
>> 
>> Extend the VMCB validation to check for such inconsistency.
>> 
>> The collection of the invalid exception vectors are ported from the upstream
>> KVM commit
>> ("7e79f71bca5c" KVM: nSVM: Add missing consistency check for EVENTINJ). Adjust
>> the checks from the commit to align with the APM Volume #2 and Volume #3
>> (40332—Rev. 4.40—July 2026) for the X86_EXC_OF and X86_EXC_BR vectors which
>> should not be valid on the x86 64-bit (long mode) platforms. The adjustment is
>> posted to the KVM mailing commit patch thread
>> https://lore.kernel.org/all/20260803225402.2324595-1-abdelkareem.abdelsaamad@citrix.com/
>> 
>> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
>> ---
>> Changes in v3:
>> - Restricted X86_EXC_OF (4) and X86_EXC_BR (5) vector injections to
>>    non-64-bit guests to prevent impossible guest-mode state injections
>>    per AMD APM Volumes 2 & 3.
>> - Refactored exception vector validation from if-conditions to a switch
>>    statement to improve readability and extensibility.
>> - Restricted X86_EXC_CP (21) vector injection to hosts with enabled CET
>>    to prevent VMRUN failures on hardware without CET support.
>> 
>> Changes in v2:
>> - Remove the redundant SVM_EVENT_INJ_TYPE_MASK and SVM_EVENT_INJ_VEC_MASK
>>    constants.
>> - Correct the Injected Event Type consistency check to disallow the injection
>>    of reserved type 1 events.
>> ---
>
>(...)
>
>> https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2734283788
>> ---
>>   xen/arch/x86/hvm/svm/vmcb.c | 51 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>> 
>
>I would add this newly introduced function in svm_vmexit_handler(), when 
>encountering VMEXIT_INVALID to attempt giving more information of the 
>problem (nobody likes to debug VMEXIT_INVALID).
By this, do you mean calling the svm_vmcb_isvalid from svm_vmexit_handler or
calling only is_valid_svm_vmcb_injected_exception_vector? I see that
VMEXIT_INVALID already dumps the VMCB.
>
>> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
>> index 975a1eaef8..4379bbef09 100644
>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>> @@ -320,6 +320,41 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>>       svm_dump_sel("  TR", &vmcb->tr);
>>   }
>>   
>> +static bool is_valid_svm_vmcb_injected_exception_vector(
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
>> +    case X86_EXC_HV:
>
>As you plan to drop #HV (due to being SEV-SNP specific), could it be at 
>least commented out; which would hint the need for a appropriate check 
>when implementing SEV-SNP restricted injections. 
I will address this in v5, since v4 has already been posted.
>
>> +    case X86_EXC_SX:
>> +        return true;
>> +    case X86_EXC_OF:
>> +    case X86_EXC_BR:
>> +        return !(vmcb_get_efer(vmcb) & EFER_LMA) || !(vmcb->cs.l);
>> +    case X86_EXC_VC:
>> +        return vmcb_get_sev_es(vmcb);
>> +    case X86_EXC_CP:
>> +        return !!(vmcb_get_cr4(vmcb) & X86_CR4_CET);
>> +    default:
>> +        return false;
>> +    }
>> +}
>> +
>
>
>Teddy


